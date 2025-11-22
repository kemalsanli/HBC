//
//  CompressorViewModel.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

import Foundation
import AppKit

/// View model responsible for coordinating HandBrake batch encoding operations.
///
/// This type exposes state for the SwiftUI interface (progress, status,
/// selected encoder, etc.) and orchestrates the lifetime of the underlying
/// `Process` instances that call `HandBrakeCLI`.
final class CompressorViewModel: ObservableObject {
    @Published var sourceURL: URL?
    @Published var status: String = LocalizationController.shared.text(.statusReady)
    @Published var overallProgress: Double = 0.0
    @Published var currentFileIndex: Int = 0
    @Published var totalFiles: Int = 0
    @Published var currentFileName: String = ""
    @Published var perFileProgress: Double = 0.0
    @Published var isRunning: Bool = false
    @Published var selectedEncoder: EncoderType = .defaultPreset
    @Published var elapsedSeconds: Int = 0

    /// Controls whether a per-run changelog file is written in the selected source folder.
    ///
    /// When this flag is `false`, logs are still kept in memory for display in the UI,
    /// but no `changelog_*.txt` file is created on disk.
    @Published var isFileLoggingEnabled: Bool = true

    // Error state
    @Published var errorMessage: String? = nil

    // Custom encoder parameters
    @Published var customEncoder: String = "vt_h265"
    @Published var customQuality: String = "32"
    @Published var customFramerate: String = "30"
    @Published var customExtra: String = "--pfr --optimize"
    
    // YOLO mode
    @Published var yoloMode: Bool = false
    
    // Encode log
    @Published var encodeLogs: [String] = []

    /// Presents an error message to the user in a thread-safe way.
    ///
    /// This helper updates `errorMessage` and, optionally, the `status`
    /// string. If the caller is already on the main thread, the update
    /// executes immediately; otherwise the changes are dispatched to the
    /// main queue.
    ///
    /// - Parameters:
    ///   - message: The error message to show in the UI.
    ///   - status: An optional status string to set alongside the error.
    private func presentError(_ message: String, status: String? = nil) {
        let update = {
            if let status = status {
                self.status = status
            }
            self.errorMessage = message
        }
        if Thread.isMainThread {
            update()
        } else {
            DispatchQueue.main.async(execute: update)
        }
    }

    private var timer: Timer?
    private var startTime: Date?
    private var assertionID: IOPMAssertionID = 0
    private var sleepAssertionActive = false
    private var currentProcess: Process?
    private var cancelRequested = false
    
    private let fileSystem: FileSystem
    private let allowedExts: Set<String> = ["mp4","mkv","avi","mov","flv","ts","m4v","webm","ogv"]
    
    /// Shared localization controller used for status and error messages produced
    /// by the view model. This keeps view-model driven strings consistent with
    /// the rest of the UI.
    private let localization = LocalizationController.shared

    /// Represents the outcome of a YOLO mode size comparison.
    ///
    /// - replaceOriginal: The encoded output is smaller and should replace the original.
    /// - keepOriginal: The original should be kept and the encoded output removed.
    /// - encodeFailed: The encoded output is missing or empty and should be treated as a failure.
    enum YoloDecision {
        case replaceOriginal
        case keepOriginal
        case encodeFailed
    }
    
    /// Represents the outcome of a size comparison when deciding whether to use
    /// a compressed file instead of the original.
    ///
    /// - useCompressed: The compressed file is smaller and should replace the original.
    /// - keepOriginal: The original file should be kept.
    enum OptimizeDecision {
        case useCompressed
        case keepOriginal
    }
    
    /// Resolves the HandBrakeCLI path using the shared application configuration.
    ///
    /// This computed property delegates to `AppConfiguration.shared` so that
    /// all HandBrakeCLI lookups respect the same candidate paths and any
    /// future user-provided overrides.
    private var cliPath: String {
        AppConfiguration.shared.resolvedHandBrakeCLIPath()
    }
    
    private var logFileURL: URL?

    /// Returns the list of encoder identifiers that can be used in custom mode.
    ///
    /// The returned list may differ depending on the current architecture
    /// (for example, hardware encoders available on Intel vs Apple Silicon).
    var availableEncoders: [String] {
#if arch(arm64)
        return ["x264", "x265", "mpeg4", "mpeg2", "vp8", "vp9", "theora", "vt_h264", "vt_h265"]
#else
        return ["x264", "x265", "mpeg4", "mpeg2", "vp8", "vp9", "theora", "vt_h264", "vt_h265", "nvenc_h264", "nvenc_h265", "qsv_h264", "qsv_h265"]
#endif
    }
    
    /// Formats a byte count as a human-readable megabyte string.
    ///
    /// - Parameter bytes: The file size in bytes.
    /// - Returns: A string such as `"42.3 MB"`.
    private func formatSize(_ bytes: Int) -> String {
        let mb = Double(bytes) / (1024*1024)
        return String(format: "%.1f MB", mb)
    }
    
    private let logQueue = DispatchQueue(label: "LogQueue", qos: .utility)

    /// Shared date formatter used for log timestamps.
    ///
    /// Using a single, lazily initialized `DateFormatter` avoids the cost
    /// of creating a new formatter for each log line.
    private lazy var logDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()

    /// Creates a new view model instance.
    ///
    /// - Parameter fileSystem: The filesystem abstraction used for all disk
    ///   operations. The default value uses `FileManager.default`.
    init(fileSystem: FileSystem = FileManager.default) {
        self.fileSystem = fileSystem
    }

    /// Appends a log line to the in-memory log list and, if a log file is configured,
    /// writes it to disk.
    ///
    /// - Parameter text: The plain log message to record.
    ///                   A timestamp is automatically prepended.
    private func appendLog(_ text: String) {
        logQueue.async {
            let dateStr = self.logDateFormatter.string(from: Date())
            let logLine = "[\(dateStr)] \(text)"
            DispatchQueue.main.async {
                self.encodeLogs.append(logLine)
            }
            self.writeLogToFile(logLine)
        }
    }
    
    /// Writes a single log line to the current log file if one is configured.
    ///
    /// - Parameter text: The fully formatted log line to append to the file.
    private func writeLogToFile(_ text: String) {
        guard let logURL = self.logFileURL else { return }
        if let handle = try? FileHandle(forWritingTo: logURL) {
            handle.seekToEndOfFile()
            if let data = (text + "\n").data(using: .utf8) {
                handle.write(data)
            }
            try? handle.close()
        } else {
            try? (text + "\n").write(to: logURL, atomically: true, encoding: .utf8)
        }
    }
    
    /// Prevents the system display from sleeping while an encode is running.
    ///
    /// This method acquires an IOKit power assertion which should later be
    /// released by calling `allowSleep()`. If an assertion is already active,
    /// the method returns without creating a new one.
    // MARK: - Sleep disable
    private func preventSleep() {
        guard !sleepAssertionActive else { return }
        let result = IOPMAssertionCreateWithName(
            kIOPMAssertionTypeNoDisplaySleep as CFString,
            IOPMAssertionLevel(kIOPMAssertionLevelOn),
            "Video compression running" as CFString,
            &assertionID
        )
        if result == kIOReturnSuccess {
            sleepAssertionActive = true
        } else {
            appendLog(localization.text(.logSleepAssertionFailedFormat, Int(result)))
        }
    }
    
    /// Releases any active power assertion and allows the system to sleep again.
    ///
    /// If no assertion is currently active, this method returns without
    /// calling into IOKit. This makes it safe to call multiple times during
    /// cleanup.
    private func allowSleep() {
        guard sleepAssertionActive else { return }
        IOPMAssertionRelease(assertionID)
        sleepAssertionActive = false
    }
    
    /// Starts the elapsed time timer used to show the total encode duration.
    ///
    /// Resets `elapsedSeconds` to zero and schedules a repeating 1-second timer.
    // MARK: - Timer
    private func startTimer() {
        elapsedSeconds = 0
        startTime = Date()
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.elapsedSeconds = Int(Date().timeIntervalSince(self.startTime ?? Date()))
        }
    }
    
    /// Stops the elapsed time timer and invalidates the underlying `Timer`.
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    /// Performs common cleanup after a batch run finishes.
    ///
    /// This method stops the timer, releases any active sleep assertion,
    /// marks the view model as not running, and updates the `status` and
    /// logs based on whether the run was cancelled (`cancelRequested`).
    ///
    /// - Parameters:
    ///   - finishedCount: The number of successfully processed files.
    ///   - skippedCount: The number of files that were skipped.
    private func cleanupAfterRun(finishedCount: Int, skippedCount: Int) {
        stopTimer()
        allowSleep()
        isRunning = false
        
        let minutes = elapsedSeconds / 60
        let seconds = elapsedSeconds % 60
        
        if cancelRequested {
            status = localization.text(.statusCancelled)
            appendLog(localization.text(.logEncodeCancelled))
        } else {
            status = localization.text(.statusCompletedFormat, finishedCount, skippedCount, minutes, seconds)
        }
    }
    
    /// Presents an `NSOpenPanel` for the user to select a source folder.
    ///
    /// The selected folder is stored in `sourceURL` and used as the root
    /// directory for batch encoding.
    func pickFolder() {
        let panel = NSOpenPanel()
        panel.canChooseFiles = false
        panel.canChooseDirectories = true
        panel.allowsMultipleSelection = false
        if panel.runModal() == .OK {
            self.sourceURL = panel.urls.first
        }
    }
    
    /// Starts the batch encoding process for the selected source folder.
    ///
    /// This method validates the HandBrakeCLI path, enumerates all supported
    /// video files under `sourceURL`, and encodes them using the currently
    /// selected encoder configuration. Progress and log messages are published
    /// so the SwiftUI view can reflect the current state.
    ///
    /// It also clears any previous `errorMessage` so each run starts from a clean error state,
    /// optionally prepares a per-run changelog file inside the selected source folder when
    /// file logging is enabled, disables display sleep via IOKit, and starts the elapsed time
    /// timer used for the on-screen duration display.
    ///
    /// If no folder is selected or HandBrakeCLI cannot be found, the method
    /// updates `status` and returns without starting an encode.
    // MARK: - Encode
    func start() {
        errorMessage = nil
        guard let src = sourceURL else { return }
        if !fileSystem.isExecutableFile(atPath: cliPath) {
            presentError(
                localization.text(.errorHandBrakeMissingBodyFormat, self.cliPath),
                status: "\(localization.text(.statusHandBrakeMissing)) (\(self.cliPath))"
            )
            return
        }
        
        // If custom encoder is selected and fields are empty, apply vt_h265xp defaults
        if selectedEncoder == .custom {
            if customEncoder.isEmpty { customEncoder = "vt_h265" }
            if customQuality.isEmpty { customQuality = "32" }
            if customFramerate.isEmpty { customFramerate = "30" }
            if customExtra.isEmpty { customExtra = "--pfr --optimize" }
        }
        
        isRunning = true
        cancelRequested = false
        status = localization.text(.statusSearchingFiles)
        overallProgress = 0
        perFileProgress = 0
        currentFileIndex = 0
        currentFileName = ""
        totalFiles = 0
        encodeLogs = []

        // Prepare a single log file for this run (optional, controlled by isFileLoggingEnabled)
        self.logFileURL = nil
        if isFileLoggingEnabled, let src = self.sourceURL {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd_HH-mm-ss"
            let dateStr = formatter.string(from: Date())
            let logFileName = "changelog_\(dateStr).txt"
            // Place the changelog file inside the selected source folder
            self.logFileURL = src.appendingPathComponent(logFileName)
        }
        let startLogKey: L10nKey = self.yoloMode ? .logEncodeStartedYoloOn : .logEncodeStartedYoloOff
        self.appendLog(self.localization.text(startLogKey))

        preventSleep()
        startTimer()
        
        let destBase: URL
        if yoloMode {
            destBase = src
        } else {
            destBase = AppConfiguration.shared.compressedFolderURL(for: src)
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let files = self.enumerateVideos(at: src)
            DispatchQueue.main.async {
                self.totalFiles = files.count
                if files.isEmpty {
                    self.isRunning = false
                    self.allowSleep()
                    self.stopTimer()
                    self.presentError(
                        self.localization.text(.errorNoVideosBody),
                        status: self.localization.text(.statusNoVideosFound)
                    )
                }
            }
            guard !files.isEmpty else { return }
            
            var finishedCount = 0
            var skippedCount = 0
            
            for (idx, fileURL) in files.enumerated() {
                if self.cancelRequested { break }
                let relPath = fileURL.path.replacingOccurrences(of: src.path + "/", with: "")
                
                let destURL: URL
                if self.yoloMode {
                    destURL = fileURL.deletingPathExtension().appendingPathExtension("mp4")
                } else {
                    destURL = destBase.appendingPathComponent(relPath).deletingPathExtension().appendingPathExtension("mp4")
                    do {
                        try self.fileSystem.createDirectory(at: destURL.deletingLastPathComponent(), withIntermediateDirectories: true)
                    } catch {
                        self.appendLog(self.localization.text(
                            .logFailedToCreateDirectoryFormat,
                            destURL.deletingLastPathComponent().path,
                            error.localizedDescription
                        ))
                    }
                }
                
                DispatchQueue.main.async {
                    self.currentFileIndex = idx + 1
                    self.currentFileName = relPath
                    self.status = self.localization.text(.statusProcessingFormat, relPath)
                    self.perFileProgress = 0.0
                    self.overallProgress = Double(finishedCount + skippedCount) / Double(self.totalFiles)
                }
                
                let task = Process()
                task.executableURL = URL(fileURLWithPath: self.cliPath)
                var args: [String]
                var actualOutputURL = destURL
                var usedTempFile = false
                if self.yoloMode && destURL.path == fileURL.path {
                    // Output path equals input, so use a temporary file
                    let tempURL = fileURL.deletingPathExtension().appendingPathExtension("tmp.mp4")
                    actualOutputURL = tempURL
                    usedTempFile = true
                }
                args = Self.buildArguments(
                    encoder: self.selectedEncoder,
                    inputPath: fileURL.path,
                    outputPath: actualOutputURL.path,
                    customEncoder: self.customEncoder,
                    customQuality: self.customQuality,
                    customFramerate: self.customFramerate,
                    customExtra: self.customExtra
                )
                task.arguments = args
                
                let pipe = Pipe()
                task.standardOutput = pipe
                task.standardError = pipe
                
                pipe.fileHandleForReading.readabilityHandler = { handle in
                    if let text = String(data: handle.availableData, encoding: .utf8), !text.isEmpty {
                        if let pct = Self.extractPercent(from: text) {
                            DispatchQueue.main.async {
                                self.perFileProgress = pct / 100.0
                                self.overallProgress = (Double(finishedCount + skippedCount) + self.perFileProgress) / Double(self.totalFiles)
                            }
                        }
                    }
                }
                
                self.currentProcess = task
                do {
                    try task.run()
                    task.waitUntilExit()
                } catch {
                    self.appendLog(self.localization.text(.logErrorRunningHandBrakeFormat, relPath, error.localizedDescription))
                    if self.errorMessage == nil {
                        self.presentError(
                            self.localization.text(.errorHandBrakeFailedBodyFormat, relPath, error.localizedDescription)
                        )
                    }
                }
                pipe.fileHandleForReading.readabilityHandler = nil
                self.currentProcess = nil
                
                // File size check
                let inputSize = (try? self.fileSystem.attributesOfItem(atPath: fileURL.path)[.size] as? NSNumber)?.intValue ?? 0
                let outputSize = (try? self.fileSystem.attributesOfItem(atPath: actualOutputURL.path)[.size] as? NSNumber)?.intValue ?? 0

                if self.yoloMode {
                    let decision = Self.decideYoloOutcome(inputSize: inputSize, outputSize: outputSize)
                    switch decision {
                    case .replaceOriginal:
                        // New file is smaller → delete the original and keep the new file instead
                        self.appendLog(self.localization.text(
                            .logYoloReplacedOriginalFormat,
                            relPath,
                            self.formatSize(inputSize),
                            self.formatSize(outputSize)
                        ))
                        do {
                            try self.fileSystem.removeItem(at: fileURL)
                        } catch {
                            self.appendLog(self.localization.text(
                                .logYoloOriginalDeleteFailedFormat,
                                fileURL.path,
                                error.localizedDescription
                            ))
                        }
                        // If a temp file was used, move it to the final destination path
                        if usedTempFile {
                            do {
                                try self.fileSystem.moveItem(at: actualOutputURL, to: destURL)
                            } catch {
                                self.appendLog(self.localization.text(
                                    .logYoloTempMoveFailedFormat,
                                    actualOutputURL.path,
                                    destURL.path,
                                    error.localizedDescription
                                ))
                            }
                        }
                        finishedCount += 1
                    case .keepOriginal:
                        // New file is larger or equal → delete the new file and keep the original
                        self.appendLog(self.localization.text(
                            .logYoloSkippedLargerOrEqualFormat,
                            relPath,
                            self.formatSize(inputSize),
                            self.formatSize(outputSize)
                        ))
                        do {
                            try self.fileSystem.removeItem(at: actualOutputURL)
                        } catch {
                            self.appendLog(self.localization.text(
                                .logOutputDeleteFailedFormat,
                                actualOutputURL.path,
                                error.localizedDescription
                            ))
                        }
                        skippedCount += 1
                    case .encodeFailed:
                        // Encode failed → delete the new file and keep the original
                        self.appendLog(self.localization.text(
                            .logYoloEncodeFailedFormat,
                            relPath,
                            self.formatSize(inputSize)
                        ))
                        do {
                            try self.fileSystem.removeItem(at: actualOutputURL)
                        } catch {
                            self.appendLog(self.localization.text(
                                .logYoloFailedOutputDeleteFailedFormat,
                                actualOutputURL.path,
                                error.localizedDescription
                            ))
                        }
                        skippedCount += 1
                    }
                } else {
                    let decision = Self.decideOptimizeOutcome(originalSize: inputSize, compressedSize: outputSize)
                    switch decision {
                    case .useCompressed:
                        self.appendLog(self.localization.text(
                            .logEncodeSuccessFormat,
                            relPath,
                            self.formatSize(inputSize),
                            self.formatSize(outputSize)
                        ))
                        finishedCount += 1
                    case .keepOriginal:
                        self.appendLog(self.localization.text(
                            .logEncodeSkippedLargerOrEqualFormat,
                            relPath,
                            self.formatSize(inputSize),
                            self.formatSize(outputSize)
                        ))
                        do {
                            try self.fileSystem.removeItem(at: destURL)
                        } catch {
                            self.appendLog(self.localization.text(
                                .logOutputDeleteFailedFormat,
                                destURL.path,
                                error.localizedDescription
                            ))
                        }
                        skippedCount += 1
                    }
                }
                
                DispatchQueue.main.async {
                    self.perFileProgress = 1.0
                    self.overallProgress = Double(finishedCount + skippedCount) / Double(self.totalFiles)
                }
            }
            
            DispatchQueue.main.async {
                self.cleanupAfterRun(finishedCount: finishedCount, skippedCount: skippedCount)
            }
        }
    }
    
    /// Cancels the currently running encode, if any.
    ///
    /// This method requests cancellation and terminates the underlying
    /// `Process`. Final cleanup (timer, sleep assertion, status and logs)
    /// is performed in `start()` via `cleanupAfterRun(finishedCount:skippedCount:)`.
    func cancel() {
        cancelRequested = true
        currentProcess?.terminate()
    }
    
    /// Optimizes the original source folder using files from the compressed folder.
    ///
    /// For each video in the `compressed<FolderName>` directory, this method
    /// compares its size with the corresponding original file and replaces the
    /// original only if the compressed version is smaller. All actions are
    /// recorded in the encode log.
    // Optimize original folder: copy smaller files from compressed to original if smaller, and log
    func optimizeOriginalFolder() {
        guard let src = sourceURL else { return }
        
        DispatchQueue.global(qos: .userInitiated).async {
            let compressedURL = AppConfiguration.shared.compressedFolderURL(for: src)
            guard self.fileSystem.fileExists(atPath: compressedURL.path) else {
                self.appendLog(self.localization.text(.logCompressedFolderMissingFormat, compressedURL.path))
                return
            }
            
            let compressedFiles = self.enumerateVideos(at: compressedURL)
            var improvedCount = 0
            var skippedCount = 0
            
            for compressedFile in compressedFiles {
                let relPath = compressedFile.path.replacingOccurrences(of: compressedURL.path + "/", with: "")
                let origFile = src.appendingPathComponent(relPath)
                let compressedSize = (try? self.fileSystem.attributesOfItem(atPath: compressedFile.path)[.size] as? NSNumber)?.intValue ?? 0
                let origSize = (try? self.fileSystem.attributesOfItem(atPath: origFile.path)[.size] as? NSNumber)?.intValue ?? 0
                let decision = Self.decideOptimizeOutcome(originalSize: origSize, compressedSize: compressedSize)
                switch decision {
                case .useCompressed:
                    do {
                        try self.fileSystem.removeItem(at: origFile)
                        try self.fileSystem.copyItem(at: compressedFile, to: origFile)
                        self.appendLog(self.localization.text(
                            .logOptimizeUpdatedFormat,
                            relPath,
                            self.formatSize(origSize),
                            self.formatSize(compressedSize)
                        ))
                        improvedCount += 1
                    } catch {
                        self.appendLog(self.localization.text(
                            .logOptimizeErrorFormat,
                            relPath,
                            error.localizedDescription
                        ))
                    }
                case .keepOriginal:
                    self.appendLog(self.localization.text(
                        .logOptimizeUnchangedFormat,
                        relPath,
                        self.formatSize(origSize),
                        self.formatSize(compressedSize)
                    ))
                    skippedCount += 1
                }
            }
            
            self.appendLog(self.localization.text(.logOptimizeCompletedFormat, improvedCount, skippedCount))
        }
    }
    
    // MARK: - Helpers

    /// Builds the full HandBrakeCLI argument list for the given encoder configuration.
    ///
    /// This helper is pure and does not touch any external state, which makes it easy
    /// to unit test in isolation.
    ///
    /// - Parameters:
    ///   - encoder: The selected encoder type.
    ///   - inputPath: Full path to the input file.
    ///   - outputPath: Full path to the output file.
    ///   - customEncoder: Encoder name to use when `encoder` is `.custom`.
    ///   - customQuality: Quality value to use when `encoder` is `.custom`.
    ///   - customFramerate: Framerate to use when `encoder` is `.custom`.
    ///   - customExtra: Extra CLI flags to append when `encoder` is `.custom`.
    /// - Returns: An array of HandBrakeCLI arguments including `-i` and `-o`.
    static func buildArguments(
        encoder: EncoderType,
        inputPath: String,
        outputPath: String,
        customEncoder: String,
        customQuality: String,
        customFramerate: String,
        customExtra: String
    ) -> [String] {
        if encoder == .custom {
            var customArgs: [String] = []
            customArgs.append("--encoder")
            customArgs.append(customEncoder)
            customArgs.append("-q")
            customArgs.append(customQuality)
            customArgs.append("-r")
            customArgs.append(customFramerate)
            let extraParts = customExtra.split(separator: " ").map { String($0) }
            customArgs.append(contentsOf: extraParts)
            return ["-i", inputPath, "-o", outputPath] + customArgs
        } else {
            return ["-i", inputPath, "-o", outputPath] + encoder.cliArgs
        }
    }

    /// Determines the YOLO mode decision based on input and output file sizes.
    ///
    /// - Parameters:
    ///   - inputSize: Size of the original file in bytes.
    ///   - outputSize: Size of the encoded output file in bytes.
    /// - Returns: A `YoloDecision` indicating how the caller should treat the output.
    static func decideYoloOutcome(inputSize: Int, outputSize: Int) -> YoloDecision {
        guard outputSize > 0 else {
            return .encodeFailed
        }
        if outputSize < inputSize {
            return .replaceOriginal
        } else {
            return .keepOriginal
        }
    }

    /// Determines whether a compressed file should replace the original based on size.
    ///
    /// - Parameters:
    ///   - originalSize: Size of the original file in bytes.
    ///   - compressedSize: Size of the compressed file in bytes.
    /// - Returns: An `OptimizeDecision` indicating whether the compressed file should be used.
    static func decideOptimizeOutcome(originalSize: Int, compressedSize: Int) -> OptimizeDecision {
        if originalSize > 0 && compressedSize > 0 && compressedSize < originalSize {
            return .useCompressed
        } else {
            return .keepOriginal
        }
    }

    /// Recursively enumerates all supported video files inside the given folder.
    ///
    /// - Parameter root: The root folder in which to search for videos.
    /// - Returns: An array of file URLs whose extensions are contained in
    ///            `allowedExts`.
    private func enumerateVideos(at root: URL) -> [URL] {
        var results: [URL] = []
        if let enumerator = fileSystem.enumerator(at: root) {
            for case let url as URL in enumerator {
                if (try? url.resourceValues(forKeys: [.isRegularFileKey]).isRegularFile) == true {
                    if allowedExts.contains(url.pathExtension.lowercased()) {
                        results.append(url)
                    }
                }
            }
        }
        return results
    }
    
    /// Extracts the first percentage value from a HandBrakeCLI output line.
    ///
    /// - Parameter text: The raw output text to parse.
    /// - Returns: The parsed percentage as a `Double` if a value could be found,
    ///            otherwise `nil`.
    static func extractPercent(from text: String) -> Double? {
        let pattern = #"(\d{1,3}(?:\.\d+)?)\s*%"#
        guard let regex = try? NSRegularExpression(pattern: pattern) else { return nil }
        if let match = regex.firstMatch(in: text, range: NSRange(text.startIndex..., in: text)),
           let r = Range(match.range(at: 1), in: text) {
            return Double(text[r])
        }
        return nil
    }
}

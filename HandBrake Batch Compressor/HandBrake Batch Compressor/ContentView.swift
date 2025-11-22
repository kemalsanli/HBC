//
//  ContentView.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 30.08.2025.
//



import SwiftUI
import AppKit
import IOKit.pwr_mgt

// MARK: - AppConfiguration (AppConfiguration.swift)

/// Global configuration and shared constants for the application.
///
/// This type centralizes values such as default HandBrakeCLI search paths
/// and user-adjustable preferences so they can be managed from a single
/// place. By routing all lookups through this configuration, future changes
/// (like allowing the user to provide a custom HandBrakeCLI path) only need
/// to be implemented once.
///
/// The configuration is exposed as a singleton via `shared` for simplicity.
/// If the app grows, this can later be injected through the SwiftUI
/// environment instead of being accessed globally.
final class AppConfiguration: ObservableObject {
    /// Shared singleton instance used throughout the app.
    static let shared = AppConfiguration()
    
    /// Built-in default filesystem paths where HandBrakeCLI is searched for.
    ///
    /// These values represent the "factory" defaults and should not be
    /// mutated at runtime. `handBrakeCandidatePaths` is initialized from
    /// this list so that the app can evolve to support user-edited paths
    /// while still being able to reset back to a known baseline.
    private let defaultHandBrakeCandidatePaths: [String] = [
        "/opt/homebrew/bin/HandBrakeCLI",
        "/usr/local/bin/HandBrakeCLI"
    ]
    
    /// Candidate filesystem paths where HandBrakeCLI is searched for.
    ///
    /// The first existing executable path in this list will be used when
    /// resolving the HandBrakeCLI binary, unless a custom path is provided.
    /// This array can later be made user-editable; for now it is initialized
    /// from `defaultHandBrakeCandidatePaths`.
    @Published var handBrakeCandidatePaths: [String]
    
    /// Optional user-specified override for the HandBrakeCLI path.
    ///
    /// When non-`nil`, this value is checked first when resolving the
    /// HandBrakeCLI executable. The string is persisted in `UserDefaults`
    /// so that it survives app restarts. No UI is wired up yet, but this
    /// property is ready for future configuration screens.
    @Published var customHandBrakePath: String? {
        didSet {
            saveCustomHandBrakePath()
        }
    }
    
    /// Prefix used when creating compressed folder names.
    ///
    /// For a source folder named `"MyVideos"`, the compressed folder will
    /// by default be named `"compressedMyVideos"`.
    let compressedFolderPrefix: String = "compressed"
    
    private init() {
        handBrakeCandidatePaths = defaultHandBrakeCandidatePaths
        customHandBrakePath = UserDefaults.standard.string(forKey: "customHandBrakePath")
    }
    
    /// Resolves the effective HandBrakeCLI path.
    ///
    /// The resolution order is:
    /// 1. A valid `customHandBrakePath` if one is set and executable.
    /// 2. The first executable file found in `handBrakeCandidatePaths`.
    /// 3. The bare `"HandBrakeCLI"` command as a last-resort fallback.
    ///
    /// - Parameter fileManager: The file manager used to query the filesystem.
    /// - Returns: The preferred path string to use when launching HandBrakeCLI.
    func resolvedHandBrakeCLIPath(fileManager: FileManager = .default) -> String {
        if let custom = customHandBrakePath,
           !custom.isEmpty,
           fileManager.isExecutableFile(atPath: custom) {
            return custom
        }
        
        for path in handBrakeCandidatePaths {
            if fileManager.isExecutableFile(atPath: path) {
                return path
            }
        }
        
        return "HandBrakeCLI"
    }
    
    /// Returns `true` if HandBrakeCLI appears to be installed at any known path.
    ///
    /// This helper is used by the installation sheet to provide a simple
    /// "Installed" status without duplicating path lookup logic in the view.
    ///
    /// - Parameter fileManager: The file manager used to query the filesystem.
    /// - Returns: `true` when HandBrakeCLI exists at the custom path or one of
    ///   the candidate locations.
    func isHandBrakeInstalled(fileManager: FileManager = .default) -> Bool {
        if let custom = customHandBrakePath,
           !custom.isEmpty,
           fileManager.isExecutableFile(atPath: custom) {
            return true
        }
        
        return handBrakeCandidatePaths.contains {
            fileManager.isExecutableFile(atPath: $0)
        }
    }
    
    /// Computes the default compressed folder name for a given source folder name.
    ///
    /// - Parameter sourceFolderName: The name of the original source folder.
    /// - Returns: The compressed folder name, such as `"compressedMyVideos"`.
    func compressedFolderName(for sourceFolderName: String) -> String {
        compressedFolderPrefix + sourceFolderName.capitalized
    }
    
    /// Computes the default compressed folder URL for a given source folder URL.
    ///
    /// By default, this app places the compressed folder next to the source
    /// folder, using `compressedFolderName(for:)` to generate the folder name.
    ///
    /// - Parameter sourceURL: The URL of the original source folder.
    /// - Returns: The URL of the compressed folder location.
    func compressedFolderURL(for sourceURL: URL) -> URL {
        let folderName = compressedFolderName(for: sourceURL.lastPathComponent)
        return sourceURL.deletingLastPathComponent().appendingPathComponent(folderName, isDirectory: true)
    }
    
    /// Persists or clears the custom HandBrakeCLI path in `UserDefaults`.
    private func saveCustomHandBrakePath() {
        let defaults = UserDefaults.standard
        if let value = customHandBrakePath, !value.isEmpty {
            defaults.set(value, forKey: "customHandBrakePath")
        } else {
            defaults.removeObject(forKey: "customHandBrakePath")
        }
    }
}

/// Represents the available encoder types supported by the batch compressor.
///
/// Each case maps to a concrete encoder configuration or a custom mode
/// that is later built by `CompressorViewModel`.
// MARK: - EncoderType (EncoderType.swift)
// MARK: - Encoder Types
enum EncoderType: String, CaseIterable, Identifiable {
    case `defaultPreset` = "Default (x265 preset)"
    case x264 = "x264"
    case x265 = "x265"
    case vt_h264 = "vt_h264"
    case vt_h265 = "vt_h265"
    case custom = "Custom"
    
    var id: String { self.rawValue }
    
    /// The default HandBrakeCLI argument list associated with this encoder type.
    ///
    /// For `.custom`, this property returns an empty array because the arguments
    /// are constructed dynamically by `CompressorViewModel.start()`.
    var cliArgs: [String] {
        switch self {
        case .defaultPreset:
            return ["-e", "x265", "-q", "24", "-r", "30", "--pfr", "--optimize"]
        case .x264:
            return ["-e", "x264", "-q", "20", "--optimize"]
        case .x265:
            return ["-e", "x265", "-q", "24", "--optimize"]
        case .vt_h264:
            return ["--encoder", "vt_h264", "--quality", "70"]
        case .vt_h265:
            return ["--encoder", "vt_h265", "--quality", "70"]
        case .custom:
            return []
        }
    }
}

/// View model responsible for coordinating HandBrake batch encoding operations.
///
/// This type exposes state for the SwiftUI interface (progress, status,
/// selected encoder, etc.) and orchestrates the lifetime of the underlying
/// `Process` instances that call `HandBrakeCLI`.
// MARK: - CompressorViewModel (CompressorViewModel.swift)
final class CompressorViewModel: ObservableObject {
    @Published var sourceURL: URL?
    @Published var status: String = "Ready"
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
    
    private let allowedExts: Set<String> = ["mp4","mkv","avi","mov","flv","ts","m4v","webm","ogv"]
    
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
            appendLog("Failed to create sleep assertion: \(result)")
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
            status = "Cancelled ⛔️"
            appendLog("Encode cancelled by user")
        } else {
            status = "Completed ✅ \(finishedCount) processed, \(skippedCount) skipped (\(minutes)m \(seconds)s)"
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
        if !FileManager.default.isExecutableFile(atPath: cliPath) {
            presentError(
                """
HandBrakeCLI could not be found at:

\(self.cliPath)

Please install Homebrew and HandBrakeCLI.
Click the “How to install HandBrake” button in the top-right corner for installation instructions.
""",
                status: "HandBrakeCLI not found (\(self.cliPath))"
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
        status = "Searching files…"
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
        self.appendLog("---- Encode started (YOLO: \(self.yoloMode ? "ON" : "OFF")) ----")

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
                        "No video files were found in the selected folder.",
                        status: "No video files found."
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
                        try FileManager.default.createDirectory(at: destURL.deletingLastPathComponent(), withIntermediateDirectories: true)
                    } catch {
                        self.appendLog("Failed to create directory: \(destURL.deletingLastPathComponent().path) - \(error)")
                    }
                }
                
                DispatchQueue.main.async {
                    self.currentFileIndex = idx + 1
                    self.currentFileName = relPath
                    self.status = "Processing: \(relPath)"
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
                if self.selectedEncoder == .custom {
                    // Build the custom CLI arguments
                    var customArgs: [String] = []
                    customArgs.append("--encoder")
                    customArgs.append(self.customEncoder)
                    customArgs.append("-q")
                    customArgs.append(self.customQuality)
                    customArgs.append("-r")
                    customArgs.append(self.customFramerate)
                    let extraParts = self.customExtra.split(separator: " ").map { String($0) }
                    customArgs.append(contentsOf: extraParts)
                    args = ["-i", fileURL.path, "-o", actualOutputURL.path] + customArgs
                } else {
                    args = ["-i", fileURL.path, "-o", actualOutputURL.path] + self.selectedEncoder.cliArgs
                }
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
                    self.appendLog("❌ Error running HandBrakeCLI for \(relPath): \(error)")
                    if self.errorMessage == nil {
                        self.presentError(
"""
HandBrakeCLI failed while processing:

\(relPath)

Details: \(error.localizedDescription)
"""
                        )
                    }
                }
                pipe.fileHandleForReading.readabilityHandler = nil
                self.currentProcess = nil
                
                // File size check
                let inputSize = (try? FileManager.default.attributesOfItem(atPath: fileURL.path)[.size] as? NSNumber)?.intValue ?? 0
                let outputSize = (try? FileManager.default.attributesOfItem(atPath: actualOutputURL.path)[.size] as? NSNumber)?.intValue ?? 0
                
                if self.yoloMode {
                    if outputSize > 0 {
                        if outputSize < inputSize {
                            // New file is smaller → delete the original and keep the new file instead
                            self.appendLog("\(relPath) → Input: \(self.formatSize(inputSize)), Output: \(self.formatSize(outputSize)) → successful, original deleted")
                            do {
                                try FileManager.default.removeItem(at: fileURL)
                            } catch {
                                self.appendLog("Original file could not be deleted: \(fileURL.path) - \(error)")
                            }
                            // If a temp file was used, move it to the final destination path
                            if usedTempFile {
                                do {
                                    try FileManager.default.moveItem(at: actualOutputURL, to: destURL)
                                } catch {
                                    self.appendLog("Temp file could not be moved: \(actualOutputURL.path) → \(destURL.path) - \(error)")
                                }
                            }
                            finishedCount += 1
                        } else {
                            // New file is larger or equal → delete the new file and keep the original
                            self.appendLog("\(relPath) → Input: \(self.formatSize(inputSize)), Output: \(self.formatSize(outputSize)) → skipped (output ≥ input)")
                            do {
                                try FileManager.default.removeItem(at: actualOutputURL)
                            } catch {
                                self.appendLog("Output file could not be deleted: \(actualOutputURL.path) - \(error)")
                            }
                            skippedCount += 1
                        }
                    } else {
                        // Encode failed → delete the new file and keep the original
                        self.appendLog("\(relPath) → Input: \(self.formatSize(inputSize)), Output: 0.0 MB → skipped (encode failed)")
                        do {
                            try FileManager.default.removeItem(at: actualOutputURL)
                        } catch {
                            self.appendLog("Failed output file could not be deleted: \(actualOutputURL.path) - \(error)")
                        }
                        skippedCount += 1
                    }
                } else {
                    if outputSize >= inputSize || outputSize == 0 {
                        self.appendLog("\(relPath) → Input: \(self.formatSize(inputSize)), Output: \(self.formatSize(outputSize)) → skipped (output larger or equal)")
                        do {
                            try FileManager.default.removeItem(at: destURL)
                        } catch {
                            self.appendLog("Output file could not be deleted: \(destURL.path) - \(error)")
                        }
                        skippedCount += 1
                    } else {
                        self.appendLog("\(relPath) → Input: \(self.formatSize(inputSize)), Output: \(self.formatSize(outputSize)) → encode successful")
                        finishedCount += 1
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
        let compressedURL = AppConfiguration.shared.compressedFolderURL(for: src)
        guard FileManager.default.fileExists(atPath: compressedURL.path) else {
            self.appendLog("Compressed folder not found: \(compressedURL.path)")
            return
        }
        let compressedFiles = self.enumerateVideos(at: compressedURL)
        var improvedCount = 0
        var skippedCount = 0
        for compressedFile in compressedFiles {
            let relPath = compressedFile.path.replacingOccurrences(of: compressedURL.path + "/", with: "")
            let origFile = src.appendingPathComponent(relPath)
            let compressedSize = (try? FileManager.default.attributesOfItem(atPath: compressedFile.path)[.size] as? NSNumber)?.intValue ?? 0
            let origSize = (try? FileManager.default.attributesOfItem(atPath: origFile.path)[.size] as? NSNumber)?.intValue ?? 0
            if origSize > 0 && compressedSize > 0 && compressedSize < origSize {
                do {
                    try FileManager.default.removeItem(at: origFile)
                    try FileManager.default.copyItem(at: compressedFile, to: origFile)
                    self.appendLog("Optimize: \(relPath) → original \(self.formatSize(origSize)), new \(self.formatSize(compressedSize)), updated.")
                    improvedCount += 1
                } catch {
                    self.appendLog("Optimize: \(relPath) → ERROR: \(error)")
                }
            } else {
                self.appendLog("Optimize: \(relPath) → original \(self.formatSize(origSize)), new \(self.formatSize(compressedSize)), unchanged.")
                skippedCount += 1
            }
        }
        self.appendLog("Optimize completed: \(improvedCount) files updated, \(skippedCount) files unchanged.")
    }
    
    /// Recursively enumerates all supported video files inside the given folder.
    ///
    /// - Parameter root: The root folder in which to search for videos.
    /// - Returns: An array of file URLs whose extensions are contained in
    ///            `allowedExts`.
    // MARK: - Helpers
    private func enumerateVideos(at root: URL) -> [URL] {
        var results: [URL] = []
        if let enumerator = FileManager.default.enumerator(at: root, includingPropertiesForKeys: [.isRegularFileKey], options: [.skipsHiddenFiles]) {
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

/// Root SwiftUI view for the HandBrake Batch Compressor application.
///
/// This view wires up controls for selecting a folder, configuring the
/// encoder, toggling YOLO mode, and observing encode progress and logs.
// MARK: - ContentView (ContentView.swift)
struct ContentView: View {
    @StateObject private var vm = CompressorViewModel()
    @State private var showYoloAlert = false
    @State private var showHelpSheet = false
    @State private var showInstallSheet = false
    @State private var showYoloInfoSheet = false
    @State private var showOptimizeInfoSheet = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            HStack {
                Text("HandBrake Batch Compressor")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button("How to install HandBrake") {
                    showInstallSheet = true
                }
                .buttonStyle(.bordered)
                .font(.caption)
                .help("Step-by-step Homebrew and HandBrakeCLI installation guide")
                
                Button {
                    showHelpSheet = true
                } label: {
                    Image(systemName: "info.circle")
                }
                .buttonStyle(.borderless)
                .help("About and usage help")
            }
            
            // Folder picker
            HStack {
                Button("Select Source Folder") { vm.pickFolder() }
                    .buttonStyle(.borderedProminent)
                if let src = vm.sourceURL {
                    Text(src.path)
                        .font(.callout)
                        .lineLimit(1)
                        .truncationMode(.middle)
                }
            }

            Toggle("Save run log file in source folder", isOn: $vm.isFileLoggingEnabled)
                .toggleStyle(.checkbox)
                .font(.caption)
            
            // Encoder picker
            Picker("Encoder", selection: $vm.selectedEncoder) {
                ForEach(EncoderType.allCases) { enc in
                    Text(enc.rawValue).tag(enc)
                }
            }
            .pickerStyle(.segmented)
            
            // Custom encoder UI section
            if vm.selectedEncoder == .custom {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Picker("Encoder:", selection: $vm.customEncoder) {
                            ForEach(vm.availableEncoders, id: \.self) { opt in
                                Text(opt).tag(opt)
                            }
                        }
                        .pickerStyle(.menu)
                        .frame(width: 200)
                    }
                    HStack {
                        Text("Quality:")
                        TextField("Quality", text: $vm.customQuality)
                            .frame(width: 60)
                            .textFieldStyle(.roundedBorder)
                    }
                    HStack {
                        Text("Framerate:")
                        TextField("Framerate", text: $vm.customFramerate)
                            .frame(width: 60)
                            .textFieldStyle(.roundedBorder)
                    }
                    HStack {
                        Text("Extra Params:")
                        TextField("Extra", text: $vm.customExtra)
                            .textFieldStyle(.roundedBorder)
                    }
                }
                .padding(8)
                .background(Color(NSColor.controlBackgroundColor))
                .cornerRadius(8)
            }
            
            // YOLO mode toggle + inline help
            HStack(spacing: 4) {
                Toggle("YOLO mode (overwrite original files)", isOn: Binding(
                    get: { vm.yoloMode },
                    set: { newValue in
                        if newValue {
                            showYoloAlert = true
                        } else {
                            vm.yoloMode = false
                        }
                    }
                ))
                .toggleStyle(.checkbox)
                .font(.caption)
                
                Button {
                    showYoloInfoSheet = true
                } label: {
                    Image(systemName: "questionmark.circle")
                }
                .buttonStyle(.plain)
                .help("""
YOLO mode overwrites original files only when the newly encoded file is smaller. \
If the new file is larger or the encode fails, the original file is kept. \
This mode is automatic and may delete older versions permanently.
""")
            }
            .alert("Warning: YOLO Mode", isPresented: $showYoloAlert) {
                Button("Confirm", role: .destructive) {
                    vm.yoloMode = true
                }
                Button("Cancel", role: .cancel) {
                    vm.yoloMode = false
                }
            } message: {
                Text("When YOLO mode is enabled, your original files may be OVERWRITTEN and old files may be DELETED. This action CANNOT BE UNDONE. Are you sure you want to continue?")
            }
            .sheet(isPresented: $showYoloInfoSheet) {
                YoloModeInfoView()
            }
            
            // Optimize original folder button (visible only when YOLO mode is disabled)
            if !vm.yoloMode {
                HStack(spacing: 4) {
                    Button("Optimize Original Folder") {
                        vm.optimizeOriginalFolder()
                    }
                    .buttonStyle(.bordered)
                    .font(.caption)
                    
                    Button {
                        showOptimizeInfoSheet = true
                    } label: {
                        Image(systemName: "questionmark.circle")
                    }
                    .buttonStyle(.plain)
                    .help("""
Uses the compressed folder to update the original folder after encoding with YOLO disabled. \
For each matching file, if the compressed version is smaller, it replaces the original file. \
Larger or equal-size compressed files are discarded. This action cannot be undone.
""")
                }
                .sheet(isPresented: $showOptimizeInfoSheet) {
                    OptimizeOriginalInfoView()
                }
            }
            
            // Encode progress + log
            if vm.isRunning {
                Text("Elapsed time: \(vm.elapsedSeconds/60)m \(vm.elapsedSeconds%60)s")
                    .font(.caption)
                if vm.totalFiles > 0 {
                    ProgressView(value: vm.overallProgress)
                        .frame(height: 6)
                    Text("Total: \(vm.currentFileIndex)/\(vm.totalFiles)")
                        .font(.caption)
                }
                if !vm.currentFileName.isEmpty {
                    ProgressView(value: vm.perFileProgress)
                        .frame(height: 6)
                    Text("Current: \(vm.currentFileName)")
                        .font(.caption)
                }
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(vm.encodeLogs, id: \.self) { log in
                            Text(log)
                                .font(.system(size: 11, design: .monospaced))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
                .frame(maxHeight: 200)
            }
            
            // Status label
            Text("Status: \(vm.status)")
                .font(.subheadline)
            
            Spacer()
            
            // Action buttons
            HStack {
                Button("Start") { vm.start() }
                    .buttonStyle(.borderedProminent)
                    .disabled(vm.sourceURL == nil || vm.isRunning)
                Button("Cancel") { vm.cancel() }
                    .buttonStyle(.bordered)
                    .disabled(!vm.isRunning)
            }
        }
        .padding(20)
        .frame(width: 720, height: 500)
        .fixedSize()
        .alert("Error",
               isPresented: Binding(
                    get: { vm.errorMessage != nil },
                    set: { newValue in
                        if !newValue {
                            vm.errorMessage = nil
                        }
                    }
               )
        ) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(vm.errorMessage ?? "An unknown error occurred.")
        }
        .sheet(isPresented: $showHelpSheet) {
            HelpView()
        }
        .sheet(isPresented: $showInstallSheet) {
            InstallHandBrakeView()
        }
        .onAppear {
            // Configure the main window to be fixed-size and non-fullscreen.
            // Dispatching asynchronously ensures the window has been created
            // and attached before we mutate its style mask.
            DispatchQueue.main.async {
                guard let window = NSApp.keyWindow ?? NSApp.windows.first else { return }
                
                window.styleMask.remove(.resizable)
                window.collectionBehavior.remove(.fullScreenPrimary)
                window.minSize = NSSize(width: 720, height: 500)
                window.maxSize = NSSize(width: 720, height: 500)
                
                if let zoomButton = window.standardWindowButton(.zoomButton) {
                    zoomButton.isEnabled = false
                }
                if let fullScreenButton = window.standardWindowButton(.fullScreenButton) {
                    fullScreenButton.isEnabled = false
                }
            }
        }
    }
}


/// A modal view that displays application information and basic usage help.
// MARK: - HelpView (HelpView.swift)
struct HelpView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("HandBrake Batch Compressor")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("About")
                    .font(.headline)
                Text("""
HandBrake Batch Compressor is a one-click macOS utility for compressing whole video folders with HandBrakeCLI.

Select a source folder and press Start — the app walks all nested subfolders, encodes supported video files, and tracks progress for you. There are no complex workflows or queues to manage.

For most users the default preset is enough: pick a folder, click Start, and wait for the batch to finish. Power users can optionally:

- Enable YOLO mode to automatically overwrite originals only when the new file is smaller.
- Run “Optimize Original Folder” after a safe run to apply smaller compressed files back to the source folder.
""")
                    .font(.body)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button("Close") {
                        dismiss()
                    }
                    .keyboardShortcut(.cancelAction)
                }
            }
            .padding(24)
        }
        .frame(minWidth: 520, minHeight: 380)
        .scrollIndicators(.visible)
    }
}

/// Detailed explanation of YOLO mode behavior and risks.
// MARK: - YoloModeInfoView (YoloModeInfoView.swift)
struct YoloModeInfoView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("YOLO Mode")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("What YOLO mode does")
                    .font(.headline)
                Text("""
When YOLO mode is enabled, HandBrake Batch Compressor compares each newly encoded file \
with its original and automatically decides which one to keep:

- If the encoded file is smaller than the original, the original file is deleted and the new file is kept.
- If the encoded file is larger, the original file is kept and the encoded file is deleted.
- If the encode fails or the output file is empty, the original file is kept and the failed output is deleted.
""")
                    .font(.body)
                
                Text("Important")
                    .font(.headline)
                Text("""
YOLO mode operates automatically while the batch is running. Original files may be deleted \
as soon as a smaller encoded version is available. This action cannot be undone, so make sure \
you have backups or are comfortable losing the original files before enabling YOLO mode.
""")
                    .font(.body)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button("Close") {
                        dismiss()
                    }
                    .keyboardShortcut(.cancelAction)
                }
            }
            .padding(24)
        }
        .frame(minWidth: 520, minHeight: 380)
        .scrollIndicators(.visible)
    }
}

/// Detailed explanation of Optimize Original Folder behavior.
// MARK: - OptimizeOriginalInfoView (OptimizeOriginalInfoView.swift)
struct OptimizeOriginalInfoView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Optimize Original Folder")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("What this command does")
                    .font(.headline)
                Text("""
After encoding with YOLO mode turned off, HandBrake Batch Compressor writes all encoded files \
into a separate compressed folder (for example: `compressedMyVideos`). The original folder remains unchanged.

The "Optimize Original Folder" command then:

- Scans the compressed folder for encoded files.
- Finds the matching original file for each encoded file.
- Compares file sizes and only replaces the original if the encoded file is smaller.
- Leaves originals unchanged when the encoded file is larger or the same size.
""")
                    .font(.body)
                
                Text("When to use it")
                    .font(.headline)
                Text("""
Use this command when you want to:

- First verify the quality of the encoded files in the compressed folder.
- Then, once you are satisfied, apply the smaller versions back to the original folder \
  to save disk space without manually moving files.

This operation modifies your original folder and cannot be undone. Make sure you are happy \
with the results in the compressed folder before running it.
""")
                    .font(.body)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button("Close") {
                        dismiss()
                    }
                    .keyboardShortcut(.cancelAction)
                }
            }
            .padding(24)
        }
        .frame(minWidth: 520, minHeight: 380)
        .scrollIndicators(.visible)
    }
}

/// A reusable code snippet view with monospaced styling and a copy-to-clipboard button.
// MARK: - CodeSnippetView (CodeSnippetView.swift)
struct CodeSnippetView: View {
    let title: String?
    let code: String
    
    @State private var didCopy = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let title = title {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            
            HStack(alignment: .top, spacing: 8) {
                Text(code)
                    .font(.system(.body, design: .monospaced))
                    .textSelection(.enabled)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button(didCopy ? "Copied" : "Copy") {
                    copyToPasteboard(code)
                    withAnimation(.easeInOut(duration: 0.15)) {
                        didCopy = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation(.easeInOut(duration: 0.15)) {
                            didCopy = false
                        }
                    }
                }
                .buttonStyle(.bordered)
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(NSColor.controlBackgroundColor))
            )
        }
    }
    
    /// Copies the given string to the system pasteboard.
    private func copyToPasteboard(_ text: String) {
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(text, forType: .string)
    }
}


/// A sheet that provides step-by-step Homebrew and HandBrakeCLI installation instructions.
// MARK: - InstallHandBrakeView (InstallHandBrakeView.swift)
struct InstallHandBrakeView: View {
    @Environment(\.dismiss) private var dismiss
    
    private let homebrewCommand = #"/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)""#
    private let handbrakeCommand = "brew install handbrake-cli"
    
    @State private var handbrakeInstalled: Bool = false
    @State private var didRunInitialChecks: Bool = false

    /// Convenience accessor for the shared list of HandBrakeCLI search paths.
    ///
    /// This keeps the UI in sync with `AppConfiguration` without duplicating
    /// the path literals.
    private var handBrakePaths: [String] {
        AppConfiguration.shared.handBrakeCandidatePaths
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("How to install HandBrake")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Homebrew setup")
                    .font(.headline)
                Text("First install Homebrew if it is not already available on your system:")
                    .font(.body)
                
                CodeSnippetView(
                    title: "Install Homebrew",
                    code: homebrewCommand
                )
                
                Text("HandBrakeCLI installation")
                    .font(.headline)
                    .padding(.top, 4)
                Text("Once Homebrew is installed, install HandBrakeCLI with:")
                    .font(.body)
                
                CodeSnippetView(
                    title: "Install HandBrakeCLI",
                    code: handbrakeCommand
                )
                
                Text("Verification")
                    .font(.headline)
                    .padding(.top, 4)
                Text("HandBrake Batch Compressor will look for HandBrakeCLI at these default paths:")
                    .font(.body)

                HStack(alignment: .firstTextBaseline) {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(handBrakePaths, id: \.self) { path in
                            Text("- \(path)")
                        }
                    }
                    .font(.system(.body, design: .monospaced))

                    Spacer()

                    if handbrakeInstalled {
                        Text("Installed")
                            .font(.caption)
                            .foregroundColor(.green)
                    } else {
                        Button("Check installation") {
                            handbrakeInstalled = isHandBrakeInstalled()
                        }
                        .buttonStyle(.bordered)
                    }
                }

                if handbrakeInstalled {
                    Text("You’re good to go. HandBrakeCLI is installed and will be picked up automatically.")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                } else {
                    Text("If HandBrakeCLI is installed in one of these locations, the app will pick it up automatically on the next run.")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button("Close") {
                        dismiss()
                    }
                    .keyboardShortcut(.cancelAction)
                }
            }
            .padding(24)
        }
        .frame(minWidth: 520, minHeight: 420)
        .scrollIndicators(.visible)
        .onAppear {
            // Run a single initial check for HandBrakeCLI when the sheet appears.
            if !didRunInitialChecks {
                handbrakeInstalled = isHandBrakeInstalled()
                didRunInitialChecks = true
            }
        }
    }
    
    /// Returns `true` if HandBrakeCLI appears to be installed at any known path.
    ///
    /// This uses the central `AppConfiguration` so that the installation sheet
    /// stays in sync with the paths and any custom override used by the rest
    /// of the app.
    private func isHandBrakeInstalled() -> Bool {
        AppConfiguration.shared.isHandBrakeInstalled()
    }
}

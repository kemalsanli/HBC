//
//  AppConfiguration.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

import Foundation

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

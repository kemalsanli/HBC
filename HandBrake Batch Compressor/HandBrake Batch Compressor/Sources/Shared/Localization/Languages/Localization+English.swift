//
//  Localization+English.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//


/// English base strings for all known keys.
///
/// These values should be treated as the source of truth for the UI.
extension LocalizationCatalog {
    static let english: [L10nKey: String] = [
        .appTitle: "HandBrake Batch Compressor",
        .statusReady: "Ready",
        .statusNoVideosFound: "No video files found.",
        .statusHandBrakeMissing: "HandBrakeCLI not found",
        .statusCancelled: "Cancelled ⛔️",
        .statusCompletedFormat: "Completed ✅ %d processed, %d skipped (%dm %ds)",
        .statusSearchingFiles: "Searching files…",
        .statusProcessingFormat: "Processing: %@",
        .buttonStart: "Start",
        .buttonCancel: "Cancel",
        .buttonSelectSourceFolder: "Select Source Folder",
        .toggleSaveRunLog: "Save run log file in source folder",
        .toggleYoloMode: "YOLO mode (overwrite original files)",
        .buttonOptimizeOriginalFolder: "Optimize Original Folder",
        .helpAboutTitle: "HandBrake Batch Compressor",
        .helpAboutBody: """
HandBrake Batch Compressor is a one-click macOS utility for compressing whole video folders with HandBrakeCLI.

Select a source folder and press Start — the app walks all nested subfolders, encodes supported video files, and tracks progress for you. There are no complex workflows or queues to manage.
""",
        .yoloInfoTitle: "YOLO Mode",
        .optimizeInfoTitle: "Optimize Original Folder",
        .installHandBrakeTitle: "How to install HandBrake",
        .buttonClose: "Close",

        // General labels and tooltips
        .labelEncoder: "Encoder",
        .labelCustomEncoder: "Encoder:",
        .labelQuality: "Quality:",
        .labelFramerate: "Framerate:",
        .labelExtraParams: "Extra Params:",
        .placeholderQuality: "Quality",
        .placeholderFramerate: "Framerate",
        .placeholderExtra: "Extra",
        .labelElapsedTimeFormat: "Elapsed time: %dm %ds",
        .labelTotalProgressFormat: "Total: %d/%d",
        .labelCurrentFileFormat: "Current: %@",
        .labelStatusPrefix: "Status:",
        .helpInstallTooltip: "Step-by-step Homebrew and HandBrakeCLI installation guide",
        .helpAboutTooltip: "About and usage help",
        .helpSettingsTooltip: "Settings",
        .helpYoloTooltip: """
YOLO mode overwrites original files only when the newly encoded file is smaller. If the new file is larger or the encode fails, the original file is kept. This mode is automatic and may delete older versions permanently.
""",
        .helpOptimizeTooltip: """
Uses the compressed folder to update the original folder after encoding with YOLO disabled. For each matching file, if the compressed version is smaller, it replaces the original file. Larger or equal-size compressed files are discarded. This action cannot be undone.
""",

        // Alerts
        .alertYoloTitle: "Warning: YOLO Mode",
        .alertYoloConfirm: "Confirm",
        .alertYoloCancel: "Cancel",
        .alertYoloMessage: "When YOLO mode is enabled, your original files may be OVERWRITTEN and old files may be DELETED. This action CANNOT BE UNDONE. Are you sure you want to continue?",
        .alertErrorTitle: "Error",
        .alertErrorOk: "OK",
        .alertErrorUnknown: "An unknown error occurred.",
        .alertSettingsLockedTitle: "Settings unavailable",
        .alertSettingsLockedMessage: "Settings cannot be changed while a batch is running. Please wait until the current operation has finished.",
        .alertSettingsLockedOk: "OK",

        // Settings & install
        .settingsTitle: "Settings",
        .settingsLanguageSectionTitle: "Language",
        .settingsLanguageLabel: "App language",
        .settingsLanguagePickerLabel: "Language",
        .settingsLanguageDescription: "“System” follows your macOS language. Other options force the app to use that language where translations are available.",
        .settingsHBPathSectionTitle: "HandBrakeCLI Path",
        .settingsHBPathDescription: "HandBrakeCLI was not found in the default locations. If you installed it manually, provide the full path to the HandBrakeCLI binary.",
        .settingsHBPathPlaceholder: "/usr/local/bin/HandBrakeCLI",
        .settingsHBPathInstalled: "Installed",
        .settingsHBPathCheck: "Check",
        .settingsHBPathError: "No executable HandBrakeCLI found at this path.",

        .installHomebrewSectionTitle: "Homebrew setup",
        .installHomebrewDescription: "First install Homebrew if it is not already available on your system:",
        .installHomebrewSnippetTitle: "Install Homebrew",
        .installHBSectionTitle: "HandBrakeCLI installation",
        .installHBDescription: "Once Homebrew is installed, install HandBrakeCLI with:",
        .installHBSnippetTitle: "Install HandBrakeCLI",
        .installVerificationTitle: "Verification",
        .installVerificationDescription: "HandBrake Batch Compressor will look for HandBrakeCLI at these default paths:",
        .installVerificationInstalled: "Installed",
        .installVerificationCheck: "Check installation",
        .installVerificationGoodToGo: "You’re good to go. HandBrakeCLI is installed and will be picked up automatically.",
        .installVerificationAutoPick: "If HandBrakeCLI is installed in one of these locations, the app will pick it up automatically on the next run.",
        .installManualPathHint: "If you installed HandBrakeCLI manually in a non-standard location, you can point the app to it from Settings.",

        // Help/info section subheadings
        .helpAboutSectionTitle: "About",
        .yoloInfoSectionWhatTitle: "What YOLO mode does",
        .yoloInfoSectionImportantTitle: "Important",
        .optimizeInfoSectionWhatTitle: "What this command does",
        .optimizeInfoSectionWhenTitle: "When to use it",

        // Help/info body text
        .yoloInfoBodyWhat: """
When YOLO mode is enabled, HandBrake Batch Compressor compares each newly encoded file \
with its original and automatically decides which one to keep:

- If the encoded file is smaller than the original, the original file is deleted and the new file is kept.
- If the encoded file is larger, the original file is kept and the encoded file is deleted.
- If the encode fails or the output file is empty, the original file is kept and the failed output is deleted.
""",
        .yoloInfoBodyImportant: """
YOLO mode operates automatically while the batch is running. Original files may be deleted \
as soon as a smaller encoded version is available. This action cannot be undone, so make sure \
you have backups or are comfortable losing the original files before enabling YOLO mode.
""",
        .optimizeInfoBodyWhat: """
After encoding with YOLO mode turned off, HandBrake Batch Compressor writes all encoded files \
into a separate compressed folder (for example: `compressedMyVideos`). The original folder remains unchanged.

The "Optimize Original Folder" command then:

- Scans the compressed folder for encoded files.
- Finds the matching original file for each encoded file.
- Compares file sizes and only replaces the original if the encoded file is smaller.
- Leaves originals unchanged when the encoded file is larger or the same size.
""",
        .optimizeInfoBodyWhen: """
Use this command when you want to:

- First verify the quality of the encoded files in the compressed folder.
- Then, once you are satisfied, apply the smaller versions back to the original folder \
  to save disk space without manually moving files.

This operation modifies your original folder and cannot be undone. Make sure you are happy \
with the results in the compressed folder before running it.
""",

        // Error bodies
        .errorNoVideosBody: "No video files were found in the selected folder.",
        .errorHandBrakeMissingBodyFormat: """
HandBrakeCLI could not be found at:

%@

Please install Homebrew and HandBrakeCLI.
Click the “How to install HandBrake” button in the top-right corner for installation instructions.
""",
        .errorHandBrakeFailedBodyFormat: """
HandBrakeCLI failed while processing:

%@ 

Details: %@
""",

        // Generic buttons
        .buttonCopy: "Copy",
        .buttonCopied: "Copied",

        // Log messages
        .logEncodeCancelled: "Encode cancelled by user",
        .logEncodeStartedYoloOn: "---- Encode started (YOLO: ON) ----",
        .logEncodeStartedYoloOff: "---- Encode started (YOLO: OFF) ----",
        .logSleepAssertionFailedFormat: "Failed to create sleep assertion: %d",
        .logFailedToCreateDirectoryFormat: "Failed to create directory: %@ - %@",
        .logErrorRunningHandBrakeFormat: "❌ Error running HandBrakeCLI for %@: %@",
        .logCompressedFolderMissingFormat: "Compressed folder not found: %@",
        .logYoloReplacedOriginalFormat: "%@ → Input: %@, Output: %@ → successful, original deleted",
        .logYoloOriginalDeleteFailedFormat: "Original file could not be deleted: %@ - %@",
        .logYoloTempMoveFailedFormat: "Temp file could not be moved: %@ → %@ - %@",
        .logYoloSkippedLargerOrEqualFormat: "%@ → Input: %@, Output: %@ → skipped (output ≥ input)",
        .logYoloEncodeFailedFormat: "%@ → Input: %@, Output: 0.0 MB → skipped (encode failed)",
        .logYoloFailedOutputDeleteFailedFormat: "Failed output file could not be deleted: %@ - %@",
        .logOutputDeleteFailedFormat: "Output file could not be deleted: %@ - %@",
        .logEncodeSuccessFormat: "%@ → Input: %@, Output: %@ → encode successful",
        .logEncodeSkippedLargerOrEqualFormat: "%@ → Input: %@, Output: %@ → skipped (output larger or equal)",
        .logOptimizeUpdatedFormat: "Optimize: %@ → original %@, new %@, updated.",
        .logOptimizeErrorFormat: "Optimize: %@ → ERROR: %@",
        .logOptimizeUnchangedFormat: "Optimize: %@ → original %@, new %@, unchanged.",
        .logOptimizeCompletedFormat: "Optimize completed: %d files updated, %d files unchanged.",

        // Menu
        .menuAboutApp: "About HandBrake Batch Compressor"
    ]
}

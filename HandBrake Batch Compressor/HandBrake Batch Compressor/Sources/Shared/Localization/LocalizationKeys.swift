//
//  LocalizationKeys.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

/// Supported application languages for manual localization.
///
/// This enum represents the languages that the app can explicitly switch
/// between. The `.system` case indicates that the OS preferred language
/// should be used when possible.
enum AppLanguage: String, CaseIterable, Identifiable {
    case system
    case english = "en"
    case chineseSimplified = "zh-Hans"
    case hindi = "hi"
    case spanish = "es"
    case french = "fr"
    case bengali = "bn"
    case portuguese = "pt"
    case russian = "ru"
    case japanese = "ja"
    case german = "de"
    case korean = "ko"
    case vietnamese = "vi"
    case italian = "it"
    case turkish = "tr"
    case tamil = "ta"
    case telugu = "te"
    case marathi = "mr"
    case javanese = "jv"
    
    var id: String { rawValue }
    
    /// A human-readable name for display in language pickers (e.g. Settings).
    var displayName: String {
        switch self {
        case .system:
            return "System"
        case .english:
            return "English"
        case .chineseSimplified:
            return "简体中文"
        case .hindi:
            return "हिन्दी"
        case .spanish:
            return "Español"
        case .french:
            return "Français"
        case .bengali:
            return "বাংলা"
        case .portuguese:
            return "Português"
        case .russian:
            return "Русский"
        case .japanese:
            return "日本語"
        case .german:
            return "Deutsch"
        case .korean:
            return "한국어"
        case .vietnamese:
            return "Tiếng Việt"
        case .italian:
            return "Italiano"
        case .turkish:
            return "Türkçe"
        case .tamil:
            return "தமிழ்"
        case .telugu:
            return "తెలుగు"
        case .marathi:
            return "मराठी"
        case .javanese:
            return "Basa Jawa"
        }
    }
}

/// Keys for user-facing strings that can be localized.
///
/// By centralizing the keys in this enum, the app can avoid scattering
/// raw string literals throughout the codebase. Each key can later be
/// backed by a `.strings` file, a dictionary, or another localization
/// mechanism without changing call sites.
enum L10nKey: String, CaseIterable {
    case appTitle
    case statusReady
    case statusNoVideosFound
    case statusHandBrakeMissing
    case statusCancelled
    case statusCompletedFormat
    case statusSearchingFiles
    case statusProcessingFormat
    case buttonStart
    case buttonCancel
    case buttonSelectSourceFolder
    case toggleSaveRunLog
    case toggleYoloMode
    case buttonOptimizeOriginalFolder
    case helpAboutTitle
    case helpAboutBody
    case yoloInfoTitle
    case optimizeInfoTitle
    case installHandBrakeTitle
    case buttonClose

    // General labels and tooltips
    case labelEncoder
    case labelCustomEncoder
    case labelQuality
    case labelFramerate
    case labelExtraParams
    case placeholderQuality
    case placeholderFramerate
    case placeholderExtra
    case labelElapsedTimeFormat
    case labelTotalProgressFormat
    case labelCurrentFileFormat
    case labelStatusPrefix
    case helpInstallTooltip
    case helpAboutTooltip
    case helpSettingsTooltip
    case helpYoloTooltip
    case helpOptimizeTooltip

    // Alerts
    case alertYoloTitle
    case alertYoloConfirm
    case alertYoloCancel
    case alertYoloMessage
    case alertErrorTitle
    case alertErrorOk
    case alertErrorUnknown
    case alertSettingsLockedTitle
    case alertSettingsLockedMessage
    case alertSettingsLockedOk

    // Settings & install
    case settingsTitle
    case settingsLanguageSectionTitle
    case settingsLanguageLabel
    case settingsLanguagePickerLabel
    case settingsLanguageDescription
    case settingsHBPathSectionTitle
    case settingsHBPathDescription
    case settingsHBPathPlaceholder
    case settingsHBPathInstalled
    case settingsHBPathCheck
    case settingsHBPathError

    case installHomebrewSectionTitle
    case installHomebrewDescription
    case installHomebrewSnippetTitle
    case installHBSectionTitle
    case installHBDescription
    case installHBSnippetTitle
    case installVerificationTitle
    case installVerificationDescription
    case installVerificationInstalled
    case installVerificationCheck
    case installVerificationGoodToGo
    case installVerificationAutoPick
    case installManualPathHint

    // Help/info section subheadings
    case helpAboutSectionTitle
    case yoloInfoSectionWhatTitle
    case yoloInfoSectionImportantTitle
    case optimizeInfoSectionWhatTitle
    case optimizeInfoSectionWhenTitle

    // Help/info body text
    case yoloInfoBodyWhat
    case yoloInfoBodyImportant
    case optimizeInfoBodyWhat
    case optimizeInfoBodyWhen

    // Error bodies
    case errorNoVideosBody
    case errorHandBrakeMissingBodyFormat
    case errorHandBrakeFailedBodyFormat

    // Generic buttons
    case buttonCopy
    case buttonCopied

    // Log messages
    case logEncodeCancelled
    case logEncodeStartedYoloOn
    case logEncodeStartedYoloOff
    case logSleepAssertionFailedFormat
    case logFailedToCreateDirectoryFormat
    case logErrorRunningHandBrakeFormat
    case logCompressedFolderMissingFormat
    case logYoloReplacedOriginalFormat
    case logYoloOriginalDeleteFailedFormat
    case logYoloTempMoveFailedFormat
    case logYoloSkippedLargerOrEqualFormat
    case logYoloEncodeFailedFormat
    case logYoloFailedOutputDeleteFailedFormat
    case logOutputDeleteFailedFormat
    case logEncodeSuccessFormat
    case logEncodeSkippedLargerOrEqualFormat
    case logOptimizeUpdatedFormat
    case logOptimizeErrorFormat
    case logOptimizeUnchangedFormat
    case logOptimizeCompletedFormat

    // Menu
    case menuAboutApp
}


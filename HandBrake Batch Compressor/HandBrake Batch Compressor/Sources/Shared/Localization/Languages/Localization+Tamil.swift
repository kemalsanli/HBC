//
//  Localization+Tamil.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

extension LocalizationCatalog {
    /// Tamil translations for all known keys.
    ///
    /// These values are machine-translated and may need review by native speakers,
    /// but they are intended to be clear and user-friendly for a first release.
    static let tamil: [L10nKey: String] = [
        .appTitle: "HandBrake தொகுதி சுருக்கி",
        .statusReady: "தயார்",
        .statusNoVideosFound: "வீடியோ கோப்புகள் எதுவும் கிடைக்கவில்லை.",
        .statusHandBrakeMissing: "HandBrakeCLI காணப்படவில்லை",
        .statusCancelled: "ரத்துசெய்யப்பட்டது ⛔️",
        .statusCompletedFormat: "முடிந்தது ✅ %d செயலாக்கப்பட்டது, %d தவிர்க்கப்பட்டது (%dநி %dவிநா)",
        .statusSearchingFiles: "கோப்புகளைத் தேடுகிறது…",
        .statusProcessingFormat: "செயலாக்கம்: %@",
        .buttonStart: "தொடங்கு",
        .buttonCancel: "ரத்து",
        .buttonSelectSourceFolder: "மூல கோப்புறையைத் தேர்ந்தெடு",
        .toggleSaveRunLog: "இயக்க பதிவு கோப்பை மூல கோப்புறையில் சேமிக்கவும்",
        .toggleYoloMode: "YOLO முறை (அசல் கோப்புகளை மேலெழுது)",
        .buttonOptimizeOriginalFolder: "அசல் கோப்புறையை மேம்படுத்து",
        .helpAboutTitle: "HandBrake தொகுதி சுருக்கி",
        .helpAboutBody: """
HandBrake தொகுதி சுருக்கி என்பது HandBrakeCLI‑ஐ பயன்படுத்தி முழு வீடியோ கோப்புறைகளைச் சுருக்குவதற்கான ஒரே‑கிளிக் macOS கருவியாகும்.

மூல கோப்புறையைத் தேர்ந்தெடுத்து “Start” ஐ அழுத்துங்கள் — ஆப் அனைத்து உள் கோப்புறைகளையும் சுற்றி, ஆதரிக்கப்படும் வீடியோ கோப்புகளை என்கோட் செய்து, முன்னேற்றத்தை உங்களுக்காக கண்காணிக்கும். சிக்கலான வேலைப்பாடுகள் அல்லது வரிசைகளை நிர்வகிக்க வேண்டியதில்லை.
""",
        .yoloInfoTitle: "YOLO முறை",
        .optimizeInfoTitle: "அசல் கோப்புறையை மேம்படுத்து",
        .installHandBrakeTitle: "HandBrake‑ஐ எப்படி நிறுவுவது",
        .buttonClose: "மூடு",

        // General labels and tooltips
        .labelEncoder: "என்கோடர்",
        .labelCustomEncoder: "என்கோடர்:",
        .labelQuality: "தரம்:",
        .labelFramerate: "Frame rate:",
        .labelExtraParams: "கூடுதல் அளவுருக்கள்:",
        .placeholderQuality: "தரம்",
        .placeholderFramerate: "Frame rate",
        .placeholderExtra: "கூடுதல்",
        .labelElapsedTimeFormat: "கடந்த நேரம்: %dநி %dவிநா",
        .labelTotalProgressFormat: "மொத்தம்: %d/%d",
        .labelCurrentFileFormat: "தற்போது: %@",
        .labelStatusPrefix: "நிலை:",
        .helpInstallTooltip: "Homebrew மற்றும் HandBrakeCLI‑ஐ நிறுவுவதற்கான படிப்படியான வழிகாட்டி",
        .helpAboutTooltip: "ஆப்பைப் பற்றி தகவல் மற்றும் பயன்பாட்டு உதவி",
        .helpSettingsTooltip: "அமைப்புகள்",
        .helpYoloTooltip: """
YOLO முறை, புதியதாக என்கோட் செய்யப்பட்ட கோப்பு அசல் கோப்பை விட சிறியதாக இருந்தால் மட்டுமே அசல் கோப்புகளை மேலெழுதும். புதிய கோப்பு பெரியதாக இருந்தாலும் அல்லது என்கோடிங் தோல்வியடைந்தாலும், அசல் கோப்பு வைத்துக்கொள்ளப்படும். இந்த முறை தானாக இயங்குகிறது மற்றும் பழைய பதிப்புகளை நிரந்தரமாக நீக்கக்கூடும்.
""",
        .helpOptimizeTooltip: """
YOLO முடக்கப்பட்ட நிலையில் என்கோடிங் செய்த பிறகு, சுருக்கப்பட்ட கோப்புறையைப் பயன்படுத்தி அசல் கோப்புறையை புதுப்பிக்கிறது. ஒவ்வொரு பொருந்தும் கோப்புக்கும், சுருக்கப்பட்ட பதிப்பு சிறியதாக இருந்தால் அது அசல் கோப்பை மாற்றும். அதைவிடப் பெரிய அல்லது அதே அளவுள்ள சுருக்கப்பட்ட கோப்புகள் தவிர்க்கப்படும். இந்த செயலை மீண்டும் செய்ய முடியாது.
""",

        // Alerts
        .alertYoloTitle: "எச்சரிக்கை: YOLO முறை",
        .alertYoloConfirm: "உறுதி செய்",
        .alertYoloCancel: "ரத்து",
        .alertYoloMessage: "YOLO முறை செயல்படுத்தப்பட்டிருக்கும் போது, உங்கள் அசல் கோப்புகள் மேலெழுதப்படலாம் மற்றும் பழைய கோப்புகள் நீக்கப்படலாம். இந்த செயலை மீண்டும் செய்ய முடியாது. நீங்கள் நிச்சயமாக தொடர விரும்புகிறீர்களா?",
        .alertErrorTitle: "பிழை",
        .alertErrorOk: "OK",
        .alertErrorUnknown: "அறியப்படாத பிழை ஒன்று ஏற்பட்டுள்ளது.",
        .alertSettingsLockedTitle: "அமைப்புகளை மாற்ற முடியாது",
        .alertSettingsLockedMessage: "ஒரு தொகுதி இயக்கப்பட்டுக்கொண்டிருக்கும் போது அமைப்புகளை மாற்ற முடியாது. தற்போதைய செயல் முடியும் வரை காத்திருக்கவும்.",
        .alertSettingsLockedOk: "OK",

        // Settings & install
        .settingsTitle: "அமைப்புகள்",
        .settingsLanguageSectionTitle: "மொழி",
        .settingsLanguageLabel: "ஆப் மொழி",
        .settingsLanguagePickerLabel: "மொழி",
        .settingsLanguageDescription: "“System” என்பது உங்கள் macOS மொழியைப் பின்பற்றும். மற்ற விருப்பங்கள், அந்த மொழிக்கு மொழிபெயர்ப்பு கிடைத்தால் ஆப்பை அந்த மொழியில் காட்ட வற்புறுத்தும்.",
        .settingsHBPathSectionTitle: "HandBrakeCLI பாதை",
        .settingsHBPathDescription: "HandBrakeCLI இயல்புநிலை இடங்களில் காணப்படவில்லை. நீங்கள் அதை கையேடு முறையில் நிறுவியிருந்தால், HandBrakeCLI பைனரிக்கான முழுப் பாதையை வழங்கவும்.",
        .settingsHBPathPlaceholder: "/usr/local/bin/HandBrakeCLI",
        .settingsHBPathInstalled: "நிறுவப்பட்டது",
        .settingsHBPathCheck: "சரிபார்",
        .settingsHBPathError: "இந்த பாதையில் இயங்கக்கூடிய HandBrakeCLI கிடைக்கவில்லை.",

        .installHomebrewSectionTitle: "Homebrew அமைப்பு",
        .installHomebrewDescription: "உங்கள் கணினியில் Homebrew இன்னும் இல்லாவிடில் முதலில் Homebrew‑ஐ நிறுவவும்:",
        .installHomebrewSnippetTitle: "Homebrew‑ஐ நிறுவு",
        .installHBSectionTitle: "HandBrakeCLI நிறுவல்",
        .installHBDescription: "Homebrew நிறுவப்பட்ட பிறகு, கீழ்கண்ட கட்டளையால் HandBrakeCLI‑ஐ நிறுவவும்:",
        .installHBSnippetTitle: "HandBrakeCLI‑ஐ நிறுவு",
        .installVerificationTitle: "சரிபார்ப்பு",
        .installVerificationDescription: "HandBrake Batch Compressor, HandBrakeCLI‑ஐ பின்வரும் இயல்புநிலை பாதைகளில் தேடும்:",
        .installVerificationInstalled: "நிறுவப்பட்டது",
        .installVerificationCheck: "நிறுவலைச் சரிபார்",
        .installVerificationGoodToGo: "எல்லாம் தயார். HandBrakeCLI நிறுவப்பட்டுள்ளது மற்றும் தானாகக் கண்டறியப்படும்.",
        .installVerificationAutoPick: "HandBrakeCLI இந்த இடங்களில் ஏதேனும் ஒன்றில் நிறுவப்பட்டிருந்தால், அடுத்த முறை இயக்கும் போது ஆப் அதை தானாகக் கண்டறியும்.",
        .installManualPathHint: "HandBrakeCLI‑ஐ ஒரு வழக்கத்துக்கு மாறான இடத்தில் கையேடு முறையில் நிறுவியிருந்தால், அமைப்புகளில் இருந்து அந்த பாதையைச் சுட்டிக்காட்டலாம்.",

        // Help/info section subheadings
        .helpAboutSectionTitle: "பற்றி",
        .yoloInfoSectionWhatTitle: "YOLO முறை என்ன செய்கிறது",
        .yoloInfoSectionImportantTitle: "முக்கியம்",
        .optimizeInfoSectionWhatTitle: "இந்த கட்டளை என்ன செய்கிறது",
        .optimizeInfoSectionWhenTitle: "எப்போது பயன்படுத்த வேண்டும்",

        // Help/info body text
        .yoloInfoBodyWhat: """
YOLO முறை செயல்படுத்தப்பட்டிருக்கும்போது, HandBrake Batch Compressor ஒவ்வொரு புதிய என்கோட் செய்யப்பட்ட கோப்பையும் \
அதன் அசல் கோப்புடன் ஒப்பிட்டு எந்த கோப்பு வைத்திருக்கவேண்டும் என்பதை தானாக முடிவு செய்கிறது:

- என்கோட் செய்யப்பட்ட கோப்பு அசல் கோப்பை விடச் சிறியதாக இருந்தால், அசல் கோப்பு நீக்கப்பட்டு புதிய கோப்பு வைத்துக்கொள்ளப்படும்.
- என்கோட் செய்யப்பட்ட கோப்பு பெரியதாக இருந்தால், அசல் கோப்பு வைத்துக்கொள்ளப்பட்டு என்கோட் செய்யப்பட்ட கோப்பு நீக்கப்படும்.
- என்கோடிங் தோல்வியடைந்தாலும் அல்லது வெளியீட்டு கோப்பு வெறுமையாக இருந்தாலும், அசல் கோப்பு வைத்துக்கொள்ளப்பட்டு தோல்வியடைந்த வெளியீடு நீக்கப்படும்.
""",
        .yoloInfoBodyImportant: """
YOLO முறை தொகுதி இயங்கும் நேரத்தில் தானாக செயல்படும். சிறிய என்கோட் செய்யப்பட்ட பதிப்பு கிடைக்கும் உடனே \
அசல் கோப்புகள் நீக்கப்படக்கூடும். இந்த செயலை மீண்டும் செய்ய முடியாது என்பதால், YOLO முறையை இயக்குவதற்கு முன் \
காப்புப்பிரதிகள் உள்ளனவா அல்லது அசல் கோப்புகளை இழப்பது உங்களுக்கு ஏற்றதா என்பதை உறுதிப்படுத்திக் கொள்ளுங்கள்.
""",
        .optimizeInfoBodyWhat: """
YOLO முறை அணைக்கப்பட்ட நிலையில் என்கோடிங் செய்த பிறகு, HandBrake Batch Compressor அனைத்து என்கோட் செய்யப்பட்ட கோப்புகளையும் \
தனியான சுருக்கப்பட்ட கோப்புறையில் (உதாரணமாக: `compressedMyVideos`) எழுதுகிறது. அசல் கோப்புறை மாறாமல் இருக்கும்.

“அசல் கோப்புறையை மேம்படுத்து” என்ற கட்டளை பின்வருவனவற்றைச் செய்கிறது:

- சுருக்கப்பட்ட கோப்புறையில் என்கோட் செய்யப்பட்ட கோப்புகளைத் தேடுகிறது.
- ஒவ்வொரு என்கோட் செய்யப்பட்ட கோப்பிற்கும் பொருந்தும் அசல் கோப்பை கண்டுபிடிக்கிறது.
- கோப்பு அளவுகளை ஒப்பிட்டு, என்கோட் செய்யப்பட்ட கோப்பு சிறியதாக இருந்தால் மட்டுமே அசல் கோப்பை மாற்றுகிறது.
- என்கோட் செய்யப்பட்ட கோப்பு பெரியதாக இருந்தாலும் அல்லது அதே அளவில் இருந்தாலும், அசல் கோப்பு மாற்றப்படாது.
""",
        .optimizeInfoBodyWhen: """
நீங்கள் பின்வருவனவற்றைச் செய்ய விரும்பும்போது இந்த கட்டளையைப் பயன்படுத்துங்கள்:

- முதலில் சுருக்கப்பட்ட கோப்புறையில் உள்ள என்கோட் செய்யப்பட்ட கோப்புகளின் தரத்தைச் சரிபார்க்க.
- பின்னர், முடிவில் திருப்தியடைந்த பிறகு, கோப்புகளை கையேடு முறையில் நகர்த்தாமல், சிறிய பதிப்புகளை அசல் கோப்புறையில் பயன்படுத்தி \
  வட்டு இடத்தைச் சேமிக்க.

இந்த செயல் உங்கள் அசல் கோப்புறையை மாற்றும் மற்றும் மீண்டும் செய்ய முடியாது. அதை இயக்குவதற்கு முன், \
சுருக்கப்பட்ட கோப்புறையின் முடிவில் நீங்கள் திருப்தியாக இருப்பதை உறுதிப்படுத்திக் கொள்ளுங்கள்.
""",

        // Error bodies
        .errorNoVideosBody: "தேர்ந்தெடுக்கப்பட்ட கோப்புறையில் எந்த வீடியோ கோப்புகளும் காணப்படவில்லை.",
        .errorHandBrakeMissingBodyFormat: """
HandBrakeCLI பின்வரும் இடங்களில் எங்கும் காணப்படவில்லை:

%@

தயவுசெய்து Homebrew மற்றும் HandBrakeCLI‑ஐ நிறுவவும்.
நிறுவல் வழிமுறைகளைப் பார்க்க, மேல்புற வலது மூலையில் உள்ள “How to install HandBrake” பொத்தானை கிளிக் செய்க.
""",
        .errorHandBrakeFailedBodyFormat: """
HandBrakeCLI பின்வரும் கோப்பை செயலாக்கும்போது தோல்வியடைந்தது:

%@ 

விவரங்கள்: %@
""",

        // Generic buttons
        .buttonCopy: "நகலெடு",
        .buttonCopied: "நகலெடுக்கப்பட்டது",

        // Log messages
        .logEncodeCancelled: "என்கோடிங் பயனர் மூலம் ரத்துசெய்யப்பட்டது",
        .logEncodeStartedYoloOn: "---- என்கோடிங் தொடங்கப்பட்டது (YOLO: ON) ----",
        .logEncodeStartedYoloOff: "---- என்கோடிங் தொடங்கப்பட்டது (YOLO: OFF) ----",
        .logSleepAssertionFailedFormat: "Sleep assertion உருவாக்கத் தவறிவிட்டது: %d",
        .logFailedToCreateDirectoryFormat: "அடைவை உருவாக்கத் தவறிவிட்டது: %@ - %@",
        .logErrorRunningHandBrakeFormat: "❌ HandBrakeCLI இயக்கும்போது பிழை %@: %@",
        .logCompressedFolderMissingFormat: "சுருக்கப்பட்ட கோப்புறை கிடைக்கவில்லை: %@",
        .logYoloReplacedOriginalFormat: "%@ → Input: %@, Output: %@ → வெற்றி, அசல் கோப்பு நீக்கப்பட்டது",
        .logYoloOriginalDeleteFailedFormat: "அசல் கோப்பை நீக்க முடியவில்லை: %@ - %@",
        .logYoloTempMoveFailedFormat: "தற்காலிக கோப்பை நகர்த்த முடியவில்லை: %@ → %@ - %@",
        .logYoloSkippedLargerOrEqualFormat: "%@ → Input: %@, Output: %@ → தவிர்க்கப்பட்டது (output ≥ input)",
        .logYoloEncodeFailedFormat: "%@ → Input: %@, Output: 0.0 MB → தவிர்க்கப்பட்டது (என்கோடிங் தோல்வியடைந்தது)",
        .logYoloFailedOutputDeleteFailedFormat: "தோல்வியடைந்த output கோப்பை நீக்க முடியவில்லை: %@ - %@",
        .logOutputDeleteFailedFormat: "output கோப்பை நீக்க முடியவில்லை: %@ - %@",
        .logEncodeSuccessFormat: "%@ → Input: %@, Output: %@ → என்கோடிங் வெற்றிகரமாக முடிந்தது",
        .logEncodeSkippedLargerOrEqualFormat: "%@ → Input: %@, Output: %@ → தவிர்க்கப்பட்டது (output பெரியதாக அல்லது சமமாக உள்ளது)",
        .logOptimizeUpdatedFormat: "மேம்படுத்தல்: %@ → அசல் %@, புதிய %@, புதுப்பிக்கப்பட்டது.",
        .logOptimizeErrorFormat: "மேம்படுத்தல்: %@ → பிழை: %@",
        .logOptimizeUnchangedFormat: "மேம்படுத்தல்: %@ → அசல் %@, புதிய %@, மாற்றமில்லை.",
        .logOptimizeCompletedFormat: "மேம்படுத்தல் முடிந்தது: %d கோப்புகள் புதுப்பிக்கப்பட்டன, %d கோப்புகள் மாற்றமில்லை.",

        // Menu
        .menuAboutApp: "HandBrake Batch Compressor குறித்து"
    ]
}

//
//  Localization+Telugu.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

extension LocalizationCatalog {
    /// Telugu translations for all known keys.
    ///
    /// These values are machine-translated and may need review by native speakers,
    /// but they are intended to be clear and user-friendly for a first release.
    static let telugu: [L10nKey: String] = [
        .appTitle: "HandBrake బ్యాచ్ కంప్రెసర్",
        .statusReady: "సిద్ధంగా ఉంది",
        .statusNoVideosFound: "వీడియో ఫైళ్లు ఏవి కనబడలేదు.",
        .statusHandBrakeMissing: "HandBrakeCLI కనబడలేదు",
        .statusCancelled: "రద్దు చేయబడింది ⛔️",
        .statusCompletedFormat: "పూర్తి ✅ %d ప్రాసెస్ చేశాం, %d స్కిప్ చేశాం (%dనిమి %dసె)",
        .statusSearchingFiles: "ఫైళ్లను శోధిస్తున్నాం…",
        .statusProcessingFormat: "ప్రాసెస్ అవుతోంది: %@",
        .buttonStart: "ప్రారంభించు",
        .buttonCancel: "రద్దు",
        .buttonSelectSourceFolder: "సోర్స్ ఫోల్డర్ ఎంపిక చేయండి",
        .toggleSaveRunLog: "రన్ లాగ్ ఫైల్‌ను సోర్స్ ఫోల్డర్‌లో సేవ్ చేయండి",
        .toggleYoloMode: "YOLO మోడ్ (ఆరిజినల్ ఫైళ్లను ఓవర్‌రైట్ చేయి)",
        .buttonOptimizeOriginalFolder: "ఆరిజినల్ ఫోల్డర్‌ను ఆప్టిమైజ్ చేయి",
        .helpAboutTitle: "HandBrake బ్యాచ్ కంప్రెసర్",
        .helpAboutBody: """
HandBrake బ్యాచ్ కంప్రెసర్ అనేది HandBrakeCLI ను ఉపయోగించి మొత్తం వీడియో ఫోల్డర్లను \
ఒకే క్లిక్‌తో కంప్రెస్ చేసే macOS యుటిలిటీ.

సోర్స్ ఫోల్డర్‌ని ఎంచుకుని “Start” పై క్లిక్ చేయండి — యాప్ అన్ని నెస్టడ్ సబ్‌ఫోల్డర్లలోకి వెళ్లి, \
సపోర్ట్ అయ్యే వీడియో ఫైళ్లను ఎన్‌కోడ్ చేస్తుంది మరియు ప్రోగ్రెస్‌ను చూపిస్తుంది. \
కాంప్లెక్స్ వర్క్‌ఫ్లోలు లేదా మాన్యువల్ క్యూ మేనేజ్‌మెంట్ అవసరం లేదు.
""",
        .yoloInfoTitle: "YOLO మోడ్",
        .optimizeInfoTitle: "ఆరిజినల్ ఫోల్డర్‌ను ఆప్టిమైజ్ చేయి",
        .installHandBrakeTitle: "HandBrake ను ఎలా ఇన్‌స్టాల్ చేయాలి",
        .buttonClose: "మూసివేయి",

        // General labels and tooltips
        .labelEncoder: "ఎన్‌కోడర్",
        .labelCustomEncoder: "ఎన్‌కోడర్:",
        .labelQuality: "క్వాలిటీ:",
        .labelFramerate: "ఫ్రేమ్ రేట్:",
        .labelExtraParams: "అదనపు పరామీటర్‌లు:",
        .placeholderQuality: "క్వాలిటీ",
        .placeholderFramerate: "ఫ్రేమ్ రేట్",
        .placeholderExtra: "ఎక్స్‌ట్రా",
        .labelElapsedTimeFormat: "గడిచిన సమయం: %dనిమి %dసె",
        .labelTotalProgressFormat: "మొత్తం: %d/%d",
        .labelCurrentFileFormat: "ప్రస్తుతం: %@",
        .labelStatusPrefix: "స్టేటస్:",
        .helpInstallTooltip: "Homebrew మరియు HandBrakeCLI ఇన్‌స్టాలేషన్ కోసం స్టెప్-బై-స్టెప్ గైడ్",
        .helpAboutTooltip: "యాప్ గురించి సమాచారం మరియు ఉపయోగానికి సహాయం",
        .helpSettingsTooltip: "సెట్టింగ్‌లు",
        .helpYoloTooltip: """
YOLO మోడ్‌లో కొత్తగా ఎన్‌కోడ్ చేసిన ఫైల్ ఆరిజినల్‌ కన్నా చిన్నదైతే మాత్రమే ఆరిజినల్ ఫైల్ ఓవర్‌రైట్ అవుతుంది. \
కొత్త ఫైల్ పెద్దదైతే లేదా ఎన్‌కోడింగ్ ఫెయిల్ అయితే, ఆరిజినల్ ఫైల్ అలాగే ఉంచబడుతుంది. \
ఈ మోడ్ ఆటోమేటిక్‌గా పనిచేస్తుంది మరియు పాత వెర్షన్‌లు శాశ్వతంగా డిలీట్ కావచ్చు.
""",
        .helpOptimizeTooltip: """
YOLO ఆఫ్‌లో ఎన్‌కోడ్ చేసిన తర్వాత, కంప్రెస్ చేసిన ఫోల్డర్‌ను ఉపయోగించి ఆరిజినల్ ఫోల్డర్‌ను అప్‌డేట్ చేస్తుంది. \
ప్రతి మ్యాచ్ అయ్యే ఫైల్ కోసం, కంప్రెస్ చేసిన వెర్షన్ చిన్నదైతే అది ఆరిజినల్‌ను రీప్లేస్ చేస్తుంది. \
పెద్దది లేదా సమాన సైజ్ ఉన్న కంప్రెస్ ఫైళ్లు స్కిప్ చేయబడతాయి. ఈ చర్యను తిరగదలిచలేరు.
""",

        // Alerts
        .alertYoloTitle: "హెచ్చరిక: YOLO మోడ్",
        .alertYoloConfirm: "కన్ఫర్మ్",
        .alertYoloCancel: "రద్దు",
        .alertYoloMessage: """
        YOLO మోడ్ ఆన్‌లో ఉన్నప్పుడు, మీ ఆరిజినల్ ఫైళ్లు ఓవర్‌రైట్ అవ్వచ్చు మరియు పాత ఫైళ్లు డిలీట్ కావచ్చు.
        ఈ చర్యను తిరిగి తీసుకోలేరు. నిజంగా కొనసాగాలనుకుంటున్నారా?
        """,
        .alertErrorTitle: "ఎరర్",
        .alertErrorOk: "OK",
        .alertErrorUnknown: "తెలియని లోపం సంభవించింది.",
        .alertSettingsLockedTitle: "సెట్టింగ్‌లను మార్చలేము",
        .alertSettingsLockedMessage: "ఒక బ్యాచ్ రన్ అవుతున్నప్పుడు సెట్టింగ్‌లను మార్చలేము. ప్రస్తుత ఆపరేషన్ పూర్తయ్యే వరకు వేచిచూడండి.",
        .alertSettingsLockedOk: "OK",

        // Settings & install
        .settingsTitle: "సెట్టింగ్‌లు",
        .settingsLanguageSectionTitle: "భాష",
        .settingsLanguageLabel: "యాప్ భాష",
        .settingsLanguagePickerLabel: "భాష",
        .settingsLanguageDescription: "“System” మీ macOS భాషను అనుసరిస్తుంది. మిగతా ఆప్షన్‌లు ట్రాన్స్‌లేషన్ అందుబాటులో ఉంటే ఆ భాషలో యాప్‌ను బలవంతంగా చూపిస్తాయి.",
        .settingsHBPathSectionTitle: "HandBrakeCLI పాత్",
        .settingsHBPathDescription: "HandBrakeCLI డిఫాల్ట్ లొకేషన్‌లలో కనబడలేదు. మీరు మాన్యువల్‌గా ఇన్‌స్టాల్ చేసి ఉంటే, HandBrakeCLI బైనరీకి పూర్తి పాత్ ఇవ్వండి.",
        .settingsHBPathPlaceholder: "/usr/local/bin/HandBrakeCLI",
        .settingsHBPathInstalled: "ఇన్‌స్టాల్ అయింది",
        .settingsHBPathCheck: "చెక్ చేయి",
        .settingsHBPathError: "ఈ పాత్‌లో ఎగ్జిక్యూటబుల్ HandBrakeCLI కనబడలేదు.",

        .installHomebrewSectionTitle: "Homebrew సెటప్",
        .installHomebrewDescription: "మీ సిస్టమ్‌లో Homebrew ఇంకా ఇన్‌స్టాల్ చేయలేదంటే, ముందుగా Homebrew ను ఇన్‌స్టాల్ చేయండి:",
        .installHomebrewSnippetTitle: "Homebrew ను ఇన్‌స్టాల్ చేయి",
        .installHBSectionTitle: "HandBrakeCLI ఇన్‌స్టాలేషన్",
        .installHBDescription: "Homebrew ఇన్‌స్టాల్ అయిన తర్వాత, క్రింది కమాండ్‌తో HandBrakeCLI ని ఇన్‌స్టాల్ చేయండి:",
        .installHBSnippetTitle: "HandBrakeCLI ను ఇన్‌స్టాల్ చేయి",
        .installVerificationTitle: "వెరిఫికేషన్",
        .installVerificationDescription: "HandBrake Batch Compressor, HandBrakeCLI కోసం క్రింది డిఫాల్ట్ పాత్‌లలో చూస్తుంది:",
        .installVerificationInstalled: "ఇన్‌స్టాల్ అయింది",
        .installVerificationCheck: "ఇన్‌స్టాలేషన్ చెక్ చేయి",
        .installVerificationGoodToGo: "అన్నీ సిద్ధమైనాయి. HandBrakeCLI ఇన్‌స్టాల్ అయింది మరియు ఆటోమేటిక్‌గా గుర్తించబడుతుంది.",
        .installVerificationAutoPick: "HandBrakeCLI ఈ లొకేషన్‌లలో ఏదైనా ఒకదాని లో ఇన్‌స్టాల్ అయినట్లయితే, యాప్ తదుపరి రన్‌లో దానిని ఆటోమేటిక్‌గా కనుగొంటుంది.",
        .installManualPathHint: "HandBrakeCLI ని నాన్-స్టాండర్డ్ లొకేషన్‌లో మాన్యువల్‌గా ఇన్‌స్టాల్ చేసి ఉంటే, ఆ పాత్‌ను సెట్టింగ్‌ల్లో ఇవ్వవచ్చు.",

        // Help/info section subheadings
        .helpAboutSectionTitle: "గురించి",
        .yoloInfoSectionWhatTitle: "YOLO మోడ్ ఏమి చేస్తుంది",
        .yoloInfoSectionImportantTitle: "ముఖ్యం",
        .optimizeInfoSectionWhatTitle: "ఈ కమాండ్ ఏమి చేస్తుంది",
        .optimizeInfoSectionWhenTitle: "ఎప్పుడు ఉపయోగించాలి",

        // Help/info body text
        .yoloInfoBodyWhat: """
YOLO మోడ్ ఆన్‌లో ఉన్నప్పుడు, HandBrake Batch Compressor ప్రతి కొత్తగా ఎన్‌కోడ్ చేసిన ఫైల్‌ను \
దాని ఆరిజినల్ ఫైల్‌తో పోల్చి ఏ ఫైల్‌ని ఉంచాలనేది ఆటోమేటిక్‌గా నిర్ణయిస్తుంది:

- ఎన్‌కోడ్ చేసిన ఫైల్ ఆరిజినల్ కంటే చిన్నదైతే, ఆరిజినల్ ఫైల్ డిలీట్ అవుతుంది, కొత్త ఫైల్ ఉంచబడుతుంది.
- ఎన్‌కోడ్ చేసిన ఫైల్ పెద్దదైతే, ఆరిజినల్ ఫైల్ ఉంచబడుతుంది, ఎన్‌కోడ్ చేసిన ఫైల్ డిలీట్ అవుతుంది.
- ఎన్‌కోడింగ్ ఫెయిల్ అయితే లేదా ఔట్‌పుట్ ఫైల్ ఖాళీగా ఉంటే, ఆరిజినల్ ఫైల్ ఉంచబడుతుంది, ఫెయిలైన ఔట్‌పుట్ డిలీట్ అవుతుంది.
""",
        .yoloInfoBodyImportant: """
YOLO మోడ్ బ్యాచ్ రన్ అవుతున్నప్పుడు ఆటోమేటిక్‌గా పనిచేస్తుంది. చిన్న ఎన్‌కోడ్ వెర్షన్ అందుబాటులో వచ్చిన వెంటనే \
ఆరిజినల్ ఫైళ్లు డిలీట్ కావచ్చు. ఈ చర్యను తిరిగి తీసుకోలేరు, కాబట్టి YOLO మోడ్ ఆన్ చేసే ముందు \
మీ వద్ద బ్యాకప్ ఉందో లేదా ఆరిజినల్ ఫైళ్లు కోల్పోవడాన్ని అంగీకరిస్తున్నారో చూసుకోండి.
""",
        .optimizeInfoBodyWhat: """
YOLO మోడ్ ఆఫ్‌లో ఎన్‌కోడ్ చేసిన తర్వాత, HandBrake Batch Compressor అన్ని ఎన్‌కోడ్ ఫైళ్లను \
ప్రత్యేక కంప్రెస్‌డ్ ఫోల్డర్‌లో (ఉదాహరణకు: `compressedMyVideos`) రాస్తుంది. ఆరిజినల్ ఫోల్డర్ మారదు.

“ఆరిజినల్ ఫోల్డర్‌ను ఆప్టిమైజ్ చేయి” కమాండ్ ఇలా చేస్తుంది:

- కంప్రెస్‌డ్ ఫోల్డర్ లోని ఎన్‌కోడ్ ఫైళ్లను స్కాన్ చేస్తుంది.
- ప్రతి ఎన్‌కోడ్ ఫైల్‌కు సంబంధించిన ఆరిజినల్ ఫైల్‌ను కనుగొంటుంది.
- ఫైల్ సైజ్‌లను పోల్చి, ఎన్‌కోడ్ ఫైల్ చిన్నదైతే మాత్రమే ఆరిజినల్ ఫైల్‌ను రీప్లేస్ చేస్తుంది.
- ఎన్‌కోడ్ ఫైల్ పెద్దదిగా లేదా సమాన సైజ్‌లో ఉంటే, ఆరిజినల్ ఫైల్ యథాతథంగా ఉంచబడుతుంది.
""",
        .optimizeInfoBodyWhen: """
ఈ కమాండ్‌ను మీరు ఈ సందర్భాల్లో ఉపయోగించండి:

- ముందుగా కంప్రెస్‌డ్ ఫోల్డర్‌లోని ఎన్‌కోడ్ ఫైళ్ల క్వాలిటీని చెక్ చేయాలనుకుంటే.
- తరువాత ఫలితాలతో సంతృప్తి చెందినప్పుడు, ఫైళ్లను చేతితో మార్చకుండా, చిన్న వెర్షన్‌లను ఆరిజినల్ ఫోల్డర్‌కు వర్తింపజేసి \
  డిస్క్ స్పేస్ సేవ్ చేయాలనుకుంటే.

ఈ ఆపరేషన్ మీ ఆరిజినల్ ఫోల్డర్‌లో మార్పులు చేస్తుంది మరియు తిరిగి తీసుకోలేరు. \
రన్ చేయడానికి ముందు కంప్రెస్‌డ్ ఫోల్డర్‌లోని ఫలితాలతో సంతృప్తిగా ఉన్నారా చూసుకోండి.
""",

        // Error bodies
        .errorNoVideosBody: "ఎంచుకున్న ఫోల్డర్‌లో ఎలాంటి వీడియో ఫైళ్లు కనబడలేదు.",
        .errorHandBrakeMissingBodyFormat: """
HandBrakeCLI క్రింది స్థానాలలో ఎక్కడా కనబడలేదు:

%@

దయచేసి Homebrew మరియు HandBrakeCLI ను ఇన్‌స్టాల్ చేయండి.
ఇన్‌స్టాలేషన్ సూచనలను చూడడానికి, కుడి పైన ఉన్న “How to install HandBrake” బటన్‌పై క్లిక్ చేయండి.
""",
        .errorHandBrakeFailedBodyFormat: """
HandBrakeCLI క్రింది ఫైల్‌ను ప్రాసెస్ చేసే సమయంలో విఫలమైంది:

%@ 

వివరాలు: %@
""",

        // Generic buttons
        .buttonCopy: "కాపీ",
        .buttonCopied: "కాపీ చేయబడింది",

        // Log messages
        .logEncodeCancelled: "ఎన్‌కోడింగ్ యూజర్ ద్వారా రద్దు చేయబడింది",
        .logEncodeStartedYoloOn: "---- ఎన్‌కోడ్ ప్రారంభం (YOLO: ON) ----",
        .logEncodeStartedYoloOff: "---- ఎన్‌కోడ్ ప్రారంభం (YOLO: OFF) ----",
        .logSleepAssertionFailedFormat: "స్లీప్ అసర్షన్ సృష్టించడం విఫలమైంది: %d",
        .logFailedToCreateDirectoryFormat: "డైరెక్టరీ సృష్టించడం విఫలమైంది: %@ - %@",
        .logErrorRunningHandBrakeFormat: "❌ HandBrakeCLI నడుపుతున్నప్పుడు లోపం %@: %@",
        .logCompressedFolderMissingFormat: "కంప్రెస్‌డ్ ఫోల్డర్ కనబడలేదు: %@",
        .logYoloReplacedOriginalFormat: "%@ → Input: %@, Output: %@ → విజయవంతం, ఆరిజినల్ డిలీట్ చేయబడింది",
        .logYoloOriginalDeleteFailedFormat: "ఆరిజినల్ ఫైల్‌ను డిలీట్ చేయలేకపోయాం: %@ - %@",
        .logYoloTempMoveFailedFormat: "టెంపరరీ ఫైల్‌ను తరలించలేకపోయాం: %@ → %@ - %@",
        .logYoloSkippedLargerOrEqualFormat: "%@ → Input: %@, Output: %@ → స్కిప్ (output ≥ input)",
        .logYoloEncodeFailedFormat: "%@ → Input: %@, Output: 0.0 MB → స్కిప్ (ఎన్‌కోడింగ్ విఫలమైంది)",
        .logYoloFailedOutputDeleteFailedFormat: "ఫెయిల్ అయిన output ఫైల్‌ను డిలీట్ చేయలేకపోయాం: %@ - %@",
        .logOutputDeleteFailedFormat: "output ఫైల్‌ను డిలీట్ చేయలేకపోయాం: %@ - %@",
        .logEncodeSuccessFormat: "%@ → Input: %@, Output: %@ → ఎన్‌కోడింగ్ సక్సెస్",
        .logEncodeSkippedLargerOrEqualFormat: "%@ → Input: %@, Output: %@ → స్కిప్ (output పెద్దదిగా లేదా సమానంగా ఉంది)",
        .logOptimizeUpdatedFormat: "ఆప్టిమైజ్: %@ → ఆరిజినల్ %@, కొత్త %@, అప్‌డేట్ అయ్యింది.",
        .logOptimizeErrorFormat: "ఆప్టిమైజ్: %@ → లోపం: %@",
        .logOptimizeUnchangedFormat: "ఆప్టిమైజ్: %@ → ఆరిజినల్ %@, కొత్త %@, మార్పు లేదు.",
        .logOptimizeCompletedFormat: "ఆప్టిమైజ్ పూర్తి: %d ఫైళ్లు అప్‌డేట్ అయ్యాయి, %d మార్పు లేకుండా ఉన్నాయి.",

        // Menu
        .menuAboutApp: "HandBrake Batch Compressor గురించి"
    ]
}

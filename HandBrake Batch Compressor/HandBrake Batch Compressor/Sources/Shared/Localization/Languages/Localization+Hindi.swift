//
//  Localization+Hindi.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

extension LocalizationCatalog {
    /// Hindi translations for all known keys.
    ///
    /// These values are machine-translated and may need review by native speakers,
    /// but they are intended to be clear and user-friendly for a first release.
    static let hindi: [L10nKey: String] = [
        .appTitle: "HandBrake बैच कंप्रेसर",
        .statusReady: "तैयार",
        .statusNoVideosFound: "कोई वीडियो फ़ाइल नहीं मिली।",
        .statusHandBrakeMissing: "HandBrakeCLI नहीं मिला",
        .statusCancelled: "रद्द किया गया ⛔️",
        .statusCompletedFormat: "पूरा हुआ ✅ %d संसाधित, %d छोड़े गए (%dमि %dसे)",
        .statusSearchingFiles: "फ़ाइलें खोजी जा रही हैं…",
        .statusProcessingFormat: "प्रोसेस हो रहा है: %@",
        .buttonStart: "शुरू करें",
        .buttonCancel: "रद्द करें",
        .buttonSelectSourceFolder: "स्रोत फ़ोल्डर चुनें",
        .toggleSaveRunLog: "रन लॉग फ़ाइल को स्रोत फ़ोल्डर में सहेजें",
        .toggleYoloMode: "YOLO मोड (मूल फ़ाइलों पर ओवरराइट)",
        .buttonOptimizeOriginalFolder: "मूल फ़ोल्डर को ऑप्टिमाइज़ करें",
        .helpAboutTitle: "HandBrake बैच कंप्रेसर",
        .helpAboutBody: """
HandBrake बैच कंप्रेसर HandBrakeCLI के साथ पूरे वीडियो फ़ोल्डरों को कंप्रेस करने के लिए एक वन‑क्लिक macOS यूटिलिटी है।

स्रोत फ़ोल्डर चुनें और “Start” दबाएँ — ऐप सभी नेस्टेड सबफ़ोल्डरों को स्कैन करता है, समर्थित वीडियो फ़ाइलों को एन्कोड करता है और आपके लिए प्रगति दिखाता है। आपको जटिल वर्कफ़्लो या कतारों को प्रबंधित करने की ज़रूरत नहीं होती।
""",
        .yoloInfoTitle: "YOLO मोड",
        .optimizeInfoTitle: "मूल फ़ोल्डर को ऑप्टिमाइज़ करें",
        .installHandBrakeTitle: "HandBrake कैसे इंस्टॉल करें",
        .buttonClose: "बंद करें",

        // General labels and tooltips
        .labelEncoder: "एनकोडर",
        .labelCustomEncoder: "एनकोडर:",
        .labelQuality: "क्वालिटी:",
        .labelFramerate: "फ़्रेम रेट:",
        .labelExtraParams: "अतिरिक्त पैरामीटर:",
        .placeholderQuality: "क्वालिटी",
        .placeholderFramerate: "फ़्रेम रेट",
        .placeholderExtra: "अतिरिक्त",
        .labelElapsedTimeFormat: "बीता समय: %dमि %dसे",
        .labelTotalProgressFormat: "कुल: %d/%d",
        .labelCurrentFileFormat: "वर्तमान: %@",
        .labelStatusPrefix: "स्थिति:",
        .helpInstallTooltip: "Homebrew और HandBrakeCLI इंस्टॉलेशन के लिए चरणबद्ध गाइड",
        .helpAboutTooltip: "जानकारी और उपयोग सहायता",
        .helpSettingsTooltip: "सेटिंग्स",
        .helpYoloTooltip: """
YOLO मोड केवल तभी मूल फ़ाइलों को ओवरराइट करता है जब नई एन्कोड की गई फ़ाइल छोटी हो। यदि नई फ़ाइल बड़ी है या एन्कोड विफल हो जाता है, तो मूल फ़ाइल सुरक्षित रहती है। यह मोड स्वतः चलता है और पुराने संस्करण स्थायी रूप से हट सकते हैं।
""",
        .helpOptimizeTooltip: """
YOLO बंद करके एन्कोड करने के बाद, कंप्रेस्ड फ़ोल्डर का उपयोग मूल फ़ोल्डर को अपडेट करने के लिए किया जाता है। प्रत्येक मिलते‑जुलते फ़ाइल के लिए, यदि कंप्रेस्ड संस्करण छोटा है तो वह मूल फ़ाइल की जगह लेता है। समान या बड़ी कंप्रेस्ड फ़ाइलें छोड़ दी जाती हैं। यह क्रिया वापस नहीं ली जा सकती।
""",

        // Alerts
        .alertYoloTitle: "चेतावनी: YOLO मोड",
        .alertYoloConfirm: "पुष्टि करें",
        .alertYoloCancel: "रद्द करें",
        .alertYoloMessage: "जब YOLO मोड सक्षम होता है, आपकी मूल फ़ाइलें ओवरराइट हो सकती हैं और पुराने फ़ाइलें हटाई जा सकती हैं। यह क्रिया वापस नहीं ली जा सकती। क्या आप वाकई जारी रखना चाहते हैं?",
        .alertErrorTitle: "त्रुटि",
        .alertErrorOk: "ठीक है",
        .alertErrorUnknown: "एक अज्ञात त्रुटि हुई।",
        .alertSettingsLockedTitle: "सेटिंग्स उपलब्ध नहीं",
        .alertSettingsLockedMessage: "बैच चल रहा होने पर सेटिंग्स बदली नहीं जा सकतीं। कृपया वर्तमान प्रक्रिया के समाप्त होने की प्रतीक्षा करें।",
        .alertSettingsLockedOk: "ठीक है",

        // Settings & install
        .settingsTitle: "सेटिंग्स",
        .settingsLanguageSectionTitle: "भाषा",
        .settingsLanguageLabel: "ऐप भाषा",
        .settingsLanguagePickerLabel: "भाषा",
        .settingsLanguageDescription: "“System” आपके macOS की भाषा का अनुसरण करता है। अन्य विकल्प, जहाँ अनुवाद उपलब्ध हों, ऐप को उस भाषा में मजबूती से चलाते हैं।",
        .settingsHBPathSectionTitle: "HandBrakeCLI पथ",
        .settingsHBPathDescription: "डिफ़ॉल्ट लोकेशनों में HandBrakeCLI नहीं मिला। यदि आपने इसे मैन्युअल रूप से इंस्टॉल किया है, तो HandBrakeCLI बाइनरी का पूरा पथ दें।",
        .settingsHBPathPlaceholder: "/usr/local/bin/HandBrakeCLI",
        .settingsHBPathInstalled: "इंस्टॉल किया गया",
        .settingsHBPathCheck: "जाँचें",
        .settingsHBPathError: "इस पथ पर कोई निष्पादन योग्य HandBrakeCLI नहीं मिला।",

        .installHomebrewSectionTitle: "Homebrew सेटअप",
        .installHomebrewDescription: "यदि आपके सिस्टम पर Homebrew पहले से इंस्टॉल नहीं है, तो पहले इसे इंस्टॉल करें:",
        .installHomebrewSnippetTitle: "Homebrew इंस्टॉल करें",
        .installHBSectionTitle: "HandBrakeCLI इंस्टॉलेशन",
        .installHBDescription: "Homebrew इंस्टॉल हो जाने के बाद, HandBrakeCLI को निम्न कमांड से इंस्टॉल करें:",
        .installHBSnippetTitle: "HandBrakeCLI इंस्टॉल करें",
        .installVerificationTitle: "वेरिफ़िकेशन",
        .installVerificationDescription: "HandBrake बैच कंप्रेसर निम्न डिफ़ॉल्ट पथों पर HandBrakeCLI खोजेगा:",
        .installVerificationInstalled: "इंस्टॉल किया गया",
        .installVerificationCheck: "इंस्टॉलेशन जाँचें",
        .installVerificationGoodToGo: "सब तैयार है। HandBrakeCLI इंस्टॉल है और ऐप इसे अपने‑आप उपयोग करेगा।",
        .installVerificationAutoPick: "यदि HandBrakeCLI इन लोकेशनों में से किसी एक पर इंस्टॉल है, तो ऐप अगली बार चलने पर इसे अपने‑आप पाएगा।",
        .installManualPathHint: "यदि आपने HandBrakeCLI को किसी नॉन‑स्टैंडर्ड लोकेशन पर मैन्युअल रूप से इंस्टॉल किया है, तो आप इसे सेटिंग्स से निर्दिष्ट कर सकते हैं।",

        // Help/info section subheadings
        .helpAboutSectionTitle: "About",
        .yoloInfoSectionWhatTitle: "YOLO मोड क्या करता है",
        .yoloInfoSectionImportantTitle: "महत्वपूर्ण",
        .optimizeInfoSectionWhatTitle: "यह कमांड क्या करता है",
        .optimizeInfoSectionWhenTitle: "इसे कब उपयोग करें",

        // Help/info body text
        .yoloInfoBodyWhat: """
जब YOLO मोड सक्षम होता है, HandBrake बैच कंप्रेसर हर नए एन्कोड किए गए फ़ाइल की \
उसकी मूल फ़ाइल से तुलना करता है और स्वचालित रूप से तय करता है कि किसे रखना है:

- यदि एन्कोड की गई फ़ाइल मूल से छोटी है, तो मूल फ़ाइल हटाई जाती है और नई फ़ाइल रखी जाती है।
- यदि एन्कोड की गई फ़ाइल बड़ी है, तो मूल फ़ाइल रखी जाती है और एन्कोड की गई फ़ाइल हटाई जाती है।
- यदि एन्कोड विफल हो जाता है या आउटपुट फ़ाइल खाली है, तो मूल फ़ाइल रखी जाती है और असफल आउटपुट हटाया जाता है।
""",
        .yoloInfoBodyImportant: """
YOLO मोड बैच चलने के दौरान स्वतः चलता है। जैसे ही कोई छोटा एन्कोडेड संस्करण उपलब्ध होता है, मूल फ़ाइलें हटाई जा सकती हैं। यह क्रिया वापस नहीं ली जा सकती, इसलिए YOLO मोड सक्षम करने से पहले सुनिश्चित करें कि आपके पास बैकअप है या आप मूल फ़ाइलों के खोने के लिए तैयार हैं।
""",
        .optimizeInfoBodyWhat: """
YOLO मोड बंद करके एन्कोड करने के बाद, HandBrake बैच कंप्रेसर सभी एन्कोडेड फ़ाइलों को एक अलग कंप्रेस्ड फ़ोल्डर (उदाहरण के लिए: `compressedMyVideos`) में लिखता है। मूल फ़ोल्डर अपरिवर्तित रहता है।

“मूल फ़ोल्डर को ऑप्टिमाइज़ करें” कमांड तब:

- कंप्रेस्ड फ़ोल्डर में एन्कोडेड फ़ाइलों को स्कैन करता है।
- हर एन्कोडेड फ़ाइल के लिए मिलती‑जुलती मूल फ़ाइल ढूँढता है।
- फ़ाइल आकारों की तुलना करता है और केवल तभी मूल फ़ाइल को बदलता है जब एन्कोडेड फ़ाइल छोटी हो।
- जब एन्कोडेड फ़ाइल बड़ी या बराबर आकार की हो, तो मूल फ़ाइल को अपरिवर्तित छोड़ देता है।
""",
        .optimizeInfoBodyWhen: """
इस कमांड का उपयोग तब करें जब आप:

- पहले कंप्रेस्ड फ़ोल्डर में एन्कोडेड फ़ाइलों की क्वालिटी जाँचना चाहते हैं।
- और फिर संतुष्ट होने पर, छोटे संस्करणों को मूल फ़ोल्डर पर लागू करके बिना फ़ाइलों को manually मूव किए डिस्क स्पेस बचाना चाहते हैं।

यह ऑपरेशन आपके मूल फ़ोल्डर को बदलता है और इसे वापस नहीं लिया जा सकता। इसे चलाने से पहले सुनिश्चित करें कि आप कंप्रेस्ड फ़ोल्डर के परिणामों से खुश हैं।
""",

        // Error bodies
        .errorNoVideosBody: "चयनित फ़ोल्डर में कोई वीडियो फ़ाइल नहीं मिली।",
        .errorHandBrakeMissingBodyFormat: """
HandBrakeCLI यहाँ नहीं मिला:

%@

कृपया Homebrew और HandBrakeCLI इंस्टॉल करें।
इंस्टॉलेशन निर्देशों के लिए ऊपर‑दाएँ कोने में “HandBrake कैसे इंस्टॉल करें” बटन पर क्लिक करें।
""",
        .errorHandBrakeFailedBodyFormat: """
HandBrakeCLI प्रोसेस करते समय विफल हो गया:

%@ 

विवरण: %@
""",

        // Generic buttons
        .buttonCopy: "कॉपी",
        .buttonCopied: "कॉपी किया गया",

        // Log messages
        .logEncodeCancelled: "एन्कोड उपयोगकर्ता द्वारा रद्द किया गया",
        .logEncodeStartedYoloOn: "---- एन्कोड शुरू (YOLO: चालू) ----",
        .logEncodeStartedYoloOff: "---- एन्कोड शुरू (YOLO: बंद) ----",
        .logSleepAssertionFailedFormat: "स्लीप असर्शन बनाने में विफल: %d",
        .logFailedToCreateDirectoryFormat: "डायरेक्टरी बनाने में विफल: %@ - %@",
        .logErrorRunningHandBrakeFormat: "❌ HandBrakeCLI चलाने में त्रुटि %@: %@",
        .logCompressedFolderMissingFormat: "कंप्रेस्ड फ़ोल्डर नहीं मिला: %@",
        .logYoloReplacedOriginalFormat: "%@ → इनपुट: %@, आउटपुट: %@ → सफल, मूल हटाया गया",
        .logYoloOriginalDeleteFailedFormat: "मूल फ़ाइल हटाई नहीं जा सकी: %@ - %@",
        .logYoloTempMoveFailedFormat: "टेम्प फ़ाइल मूव नहीं की जा सकी: %@ → %@ - %@",
        .logYoloSkippedLargerOrEqualFormat: "%@ → इनपुट: %@, आउटपुट: %@ → छोड़ा गया (आउटपुट ≥ इनपुट)",
        .logYoloEncodeFailedFormat: "%@ → इनपुट: %@, आउटपुट: 0.0 MB → छोड़ा गया (एन्कोड विफल)",
        .logYoloFailedOutputDeleteFailedFormat: "विफल आउटपुट फ़ाइल हटाई नहीं जा सकी: %@ - %@",
        .logOutputDeleteFailedFormat: "आउटपुट फ़ाइल हटाई नहीं जा सकी: %@ - %@",
        .logEncodeSuccessFormat: "%@ → इनपुट: %@, आउटपुट: %@ → एन्कोड सफल",
        .logEncodeSkippedLargerOrEqualFormat: "%@ → इनपुट: %@, आउटपुट: %@ → छोड़ा गया (आउटपुट बड़ा या बराबर)",
        .logOptimizeUpdatedFormat: "ऑप्टिमाइज़: %@ → मूल %@, नया %@, अपडेट किया गया।",
        .logOptimizeErrorFormat: "ऑप्टिमाइज़: %@ → त्रुटि: %@",
        .logOptimizeUnchangedFormat: "ऑप्टिमाइज़: %@ → मूल %@, नया %@, बिना बदलाव।",
        .logOptimizeCompletedFormat: "ऑप्टिमाइज़ पूरा: %d फ़ाइलें अपडेट, %d बिना बदलाव।",

        // Menu
        .menuAboutApp: "About HandBrake Batch Compressor"
    ]
}

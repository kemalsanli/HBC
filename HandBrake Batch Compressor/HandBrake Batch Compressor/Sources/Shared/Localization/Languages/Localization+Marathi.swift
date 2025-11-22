//
//  Localization+Marathi.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

extension LocalizationCatalog {
    /// Marathi translations for all known keys.
    ///
    /// These values are machine-translated and may need review by native speakers,
    /// but they are intended to be clear and user-friendly for a first release.
    static let marathi: [L10nKey: String] = [
        .appTitle: "HandBrake बॅच कॉम्प्रेसर",
        .statusReady: "तयार",
        .statusNoVideosFound: "कोणतीही व्हिडिओ फाईल सापडली नाही.",
        .statusHandBrakeMissing: "HandBrakeCLI सापडला नाही",
        .statusCancelled: "रद्द केले ⛔️",
        .statusCompletedFormat: "पूर्ण ✅ %d प्रक्रिया झाल्या, %d वगळल्या (%dमि %dसे)",
        .statusSearchingFiles: "फाईल्स शोधत आहोत…",
        .statusProcessingFormat: "प्रक्रिया चालू: %@",
        .buttonStart: "सुरू करा",
        .buttonCancel: "रद्द करा",
        .buttonSelectSourceFolder: "स्रोत फोल्डर निवडा",
        .toggleSaveRunLog: "रन लॉग फाईल स्रोत फोल्डरमध्ये सेव्ह करा",
        .toggleYoloMode: "YOLO मोड (मूळ फाईल्स ओव्हरराइट करा)",
        .buttonOptimizeOriginalFolder: "मूळ फोल्डर ऑप्टिमाइझ करा",
        .helpAboutTitle: "HandBrake बॅच कॉम्प्रेसर",
        .helpAboutBody: """
HandBrake बॅच कॉम्प्रेसर हा HandBrakeCLI वापरून पूर्ण व्हिडिओ फोल्डर्स \
एकाच क्लिकमध्ये कॉम्प्रेस करण्यासाठीचा macOS युटिलिटी आहे.

स्रोत फोल्डर निवडा आणि Start दाबा — अ‍ॅप सर्व नेस्टेड सबफोल्डर्स स्कॅन करते, \
समर्थित व्हिडिओ फाईल्स एन्कोड करते आणि तुमच्यासाठी प्रगती दाखवते. \
कोणत्याही कॉम्प्लेक्स वर्कफ्लोज किंवा मॅन्युअल क्यू मॅनेजमेंटची गरज नाही.
""",
        .yoloInfoTitle: "YOLO मोड",
        .optimizeInfoTitle: "मूळ फोल्डर ऑप्टिमाइझ करा",
        .installHandBrakeTitle: "HandBrake कसे इन्स्टॉल करावे",
        .buttonClose: "बंद करा",

        // General labels and tooltips
        .labelEncoder: "एन्कोडर",
        .labelCustomEncoder: "एन्कोडर:",
        .labelQuality: "गुणवत्ता:",
        .labelFramerate: "फ्रेमरेट:",
        .labelExtraParams: "अतिरिक्त पॅरामीटर्स:",
        .placeholderQuality: "गुणवत्ता",
        .placeholderFramerate: "फ्रेमरेट",
        .placeholderExtra: "अतिरिक्त",
        .labelElapsedTimeFormat: "झालेला वेळ: %dमि %dसे",
        .labelTotalProgressFormat: "एकूण: %d/%d",
        .labelCurrentFileFormat: "सध्या: %@",
        .labelStatusPrefix: "स्थिती:",
        .helpInstallTooltip: "Homebrew आणि HandBrakeCLI इन्स्टॉलेशनसाठी स्टेप-बाय-स्टेप मार्गदर्शक",
        .helpAboutTooltip: "अ‍ॅपची माहिती आणि वापराची मदत",
        .helpSettingsTooltip: "सेटिंग्ज",
        .helpYoloTooltip: """
YOLO मोडमध्ये नवीन एन्कोड केलेली फाईल मूळ फाईलपेक्षा लहान असली तरच मूळ फाईल ओव्हरराइट होते. \
नवीन फाईल मोठी असल्यास किंवा एन्कोड फेल झाल्यास, मूळ फाईल तशीच ठेवली जाते. \
हा मोड स्वयंचलित आहे आणि जुन्या आवृत्त्या कायमच्या डिलीट होऊ शकतात.
""",
        .helpOptimizeTooltip: """
YOLO बंद ठेवून एन्कोड केल्यानंतर, कॉम्प्रेस्ड फोल्डर वापरून मूळ फोल्डर अपडेट केला जातो. \
प्रत्येक जुळणाऱ्या फाईलसाठी, कॉम्प्रेस्ड आवृत्ती लहान असल्यास ती मूळ फाईलची जागा घेते. \
मोठ्या किंवा समान आकाराच्या कॉम्प्रेस्ड फाईल्स वगळल्या जातात. ही कृती पूर्ववत करता येत नाही.
""",

        // Alerts
        .alertYoloTitle: "इशारा: YOLO मोड",
        .alertYoloConfirm: "खात्री करा",
        .alertYoloCancel: "रद्द करा",
        .alertYoloMessage: """
YOLO मोड सुरू असताना तुमच्या मूळ फाईल्सवर ओव्हरराइट होऊ शकते आणि जुन्या फाईल्स डिलीट केल्या जाऊ शकतात.
ही कृती पूर्ववत करता येत नाही. तुम्हाला नक्की पुढे जायचे आहे का?
""",
        .alertErrorTitle: "त्रुटी",
        .alertErrorOk: "OK",
        .alertErrorUnknown: "अज्ञात त्रुटी झाली.",
        .alertSettingsLockedTitle: "सेटिंग्ज उपलब्ध नाहीत",
        .alertSettingsLockedMessage: "बॅच चालू असताना सेटिंग्ज बदलता येणार नाहीत. कृपया सध्याची प्रक्रिया पूर्ण होईपर्यंत प्रतीक्षा करा.",
        .alertSettingsLockedOk: "OK",

        // Settings & install
        .settingsTitle: "सेटिंग्ज",
        .settingsLanguageSectionTitle: "भाषा",
        .settingsLanguageLabel: "अ‍ॅप भाषा",
        .settingsLanguagePickerLabel: "भाषा",
        .settingsLanguageDescription: "“System” तुमच्या macOS भाषेचा वापर करते. इतर पर्यायांसाठी उपलब्ध असल्यास अ‍ॅप त्या भाषेत प्रदर्शित होईल.",
        .settingsHBPathSectionTitle: "HandBrakeCLI पाथ",
        .settingsHBPathDescription: "HandBrakeCLI डीफॉल्ट ठिकाणी सापडला नाही. तुम्ही ते मॅन्युअली इन्स्टॉल केले असल्यास, HandBrakeCLI बायनरीचा पूर्ण पाथ द्या.",
        .settingsHBPathPlaceholder: "/usr/local/bin/HandBrakeCLI",
        .settingsHBPathInstalled: "इन्स्टॉल केले",
        .settingsHBPathCheck: "तपासा",
        .settingsHBPathError: "या पाथवर कोणताही executable HandBrakeCLI सापडला नाही.",

        .installHomebrewSectionTitle: "Homebrew सेटअप",
        .installHomebrewDescription: "तुमच्या सिस्टिमवर Homebrew इन्स्टॉल नसेल तर प्रथम Homebrew इन्स्टॉल करा:",
        .installHomebrewSnippetTitle: "Homebrew इन्स्टॉल करा",
        .installHBSectionTitle: "HandBrakeCLI इन्स्टॉलेशन",
        .installHBDescription: "Homebrew इन्स्टॉल झाल्यावर, खालील कमांडने HandBrakeCLI इन्स्टॉल करा:",
        .installHBSnippetTitle: "HandBrakeCLI इन्स्टॉल करा",
        .installVerificationTitle: "तपासणी",
        .installVerificationDescription: "HandBrake Batch Compressor खालील डीफॉल्ट पाथवर HandBrakeCLI शोधेल:",
        .installVerificationInstalled: "इन्स्टॉल केले",
        .installVerificationCheck: "इन्स्टॉलेशन तपासा",
        .installVerificationGoodToGo: "सगळे तयार आहे. HandBrakeCLI इन्स्टॉल केले गेले आहे आणि आपोआप ओळखले जाईल.",
        .installVerificationAutoPick: "HandBrakeCLI या ठिकाणांपैकी एखाद्या ठिकाणी इन्स्टॉल केले असल्यास, अ‍ॅप पुढील रनवर ते आपोआप ओळखेल.",
        .installManualPathHint: "HandBrakeCLI तुम्ही non-standard ठिकाणी मॅन्युअली इन्स्टॉल केले असल्यास, त्या पाथकडे निर्देश सेटिंग्जमधून करू शकता.",

        // Help/info section subheadings
        .helpAboutSectionTitle: "बद्दल",
        .yoloInfoSectionWhatTitle: "YOLO मोड काय करतो",
        .yoloInfoSectionImportantTitle: "महत्त्वाचे",
        .optimizeInfoSectionWhatTitle: "हा कमांड काय करतो",
        .optimizeInfoSectionWhenTitle: "कधी वापरावे",

        // Help/info body text
        .yoloInfoBodyWhat: """
YOLO मोड सक्षम असताना, HandBrake Batch Compressor प्रत्येक नवीन एन्कोड केलेल्या फाईलची \
तिच्या मूळ फाईलशी तुलना करून कोणती आवृत्ती ठेवायची ते आपोआप ठरवतो:

- एन्कोड केलेली फाईल मूळ फाईलपेक्षा लहान असल्यास, मूळ फाईल डिलीट केली जाते आणि नवीन फाईल ठेवली जाते.
- एन्कोड केलेली फाईल मोठी असल्यास, मूळ फाईल ठेवली जाते आणि एन्कोड केलेली फाईल डिलीट केली जाते.
- एन्कोड फेल झाल्यास किंवा आउटपुट फाईल रिकामी असल्यास, मूळ फाईल ठेवली जाते आणि फेल झालेले आउटपुट डिलीट केले जाते.
""",
        .yoloInfoBodyImportant: """
YOLO मोड बॅच चालू असताना स्वयंचलितपणे कार्य करतो. लहान एन्कोड केलेली आवृत्ती उपलब्ध होताच \
मूळ फाईल्स डिलीट केल्या जाऊ शकतात. ही कृती पूर्ववत करता येत नाही, त्यामुळे YOLO मोड सक्षम करण्यापूर्वी \
तुमच्याकडे बॅकअप आहे किंवा मूळ फाईल्स गमावायला तुम्ही तयार आहात याची खात्री करा.
""",
        .optimizeInfoBodyWhat: """
YOLO मोड बंद ठेवून एन्कोड केल्यानंतर, HandBrake Batch Compressor सर्व एन्कोड केलेल्या फाईल्स \
स्वतंत्र कॉम्प्रेस्ड फोल्डरमध्ये (उदा.: `compressedMyVideos`) लिहितो. मूळ फोल्डर बदलत नाही.

“Optimize Original Folder” कमांड नंतर खालील गोष्टी करते:

- कॉम्प्रेस्ड फोल्डरमध्ये एन्कोड केलेल्या फाईल्स स्कॅन करते.
- प्रत्येक एन्कोड फाईलसाठी जुळणारी मूळ फाईल शोधते.
- फाईल साईजची तुलना करून, एन्कोड फाईल लहान असल्यासच मूळ फाईल बदलते.
- एन्कोड फाईल मोठी किंवा समान आकाराची असल्यास, मूळ फाईल तशीच ठेवते.
""",
        .optimizeInfoBodyWhen: """
खालील वेळी हा कमांड वापरा:

- आधी कॉम्प्रेस्ड फोल्डरमधील एन्कोड फाईल्सची गुणवत्ता तपासू इच्छित असाल.
- त्यानंतर, परिणामांवर समाधान झाल्यावर, फाईल्स मॅन्युअली हलवण्याशिवाय, लहान आवृत्त्या \
  मूळ फोल्डरवर लागू करून डिस्क स्पेस वाचवू इच्छित असाल.

ही ऑपरेशन तुमच्या मूळ फोल्डरमध्ये बदल करते आणि ते पूर्ववत करता येत नाही. \
हा कमांड चालवण्यापूर्वी कॉम्प्रेस्ड फोल्डरमधील परिणामांबद्दल तुम्ही समाधानी आहात याची खात्री करा.
""",

        // Error bodies
        .errorNoVideosBody: "निवडलेल्या फोल्डरमध्ये कोणतीही व्हिडिओ फाईल्स सापडल्या नाहीत.",
        .errorHandBrakeMissingBodyFormat: """
HandBrakeCLI येथे सापडला नाही:

%@

कृपया Homebrew आणि HandBrakeCLI इन्स्टॉल करा.
इन्स्टॉलेशन सूचना पाहण्यासाठी, वर उजव्या कोपऱ्यातील “How to install HandBrake” बटणावर क्लिक करा.
""",
        .errorHandBrakeFailedBodyFormat: """
HandBrakeCLI खालील फाईल प्रक्रिया करताना फेल झाला:

%@ 

तपशील: %@
""",

        // Generic buttons
        .buttonCopy: "कॉपी करा",
        .buttonCopied: "कॉपी झाले",

        // Log messages
        .logEncodeCancelled: "एन्कोडिंग वापरकर्त्याने रद्द केले",
        .logEncodeStartedYoloOn: "---- एन्कोडिंग सुरू (YOLO: ON) ----",
        .logEncodeStartedYoloOff: "---- एन्कोडिंग सुरू (YOLO: OFF) ----",
        .logSleepAssertionFailedFormat: "Sleep assertion तयार करण्यात अपयश: %d",
        .logFailedToCreateDirectoryFormat: "डिरेक्टरी तयार करण्यात अपयश: %@ - %@",
        .logErrorRunningHandBrakeFormat: "❌ HandBrakeCLI चालवताना त्रुटी %@: %@",
        .logCompressedFolderMissingFormat: "कॉम्प्रेस्ड फोल्डर सापडला नाही: %@",
        .logYoloReplacedOriginalFormat: "%@ → Input: %@, Output: %@ → यशस्वी, मूळ डिलीट केले",
        .logYoloOriginalDeleteFailedFormat: "मूळ फाईल डिलीट करता आली नाही: %@ - %@",
        .logYoloTempMoveFailedFormat: "तात्पुरती फाईल हलवता आली नाही: %@ → %@ - %@",
        .logYoloSkippedLargerOrEqualFormat: "%@ → Input: %@, Output: %@ → वगळले (output ≥ input)",
        .logYoloEncodeFailedFormat: "%@ → Input: %@, Output: 0.0 MB → वगळले (एन्कोड फेल झाला)",
        .logYoloFailedOutputDeleteFailedFormat: "फेल झालेली output फाईल डिलीट करता आली नाही: %@ - %@",
        .logOutputDeleteFailedFormat: "output फाईल डिलीट करता आली नाही: %@ - %@",
        .logEncodeSuccessFormat: "%@ → Input: %@, Output: %@ → एन्कोडिंग यशस्वी",
        .logEncodeSkippedLargerOrEqualFormat: "%@ → Input: %@, Output: %@ → वगळले (output मोठा किंवा समान आहे)",
        .logOptimizeUpdatedFormat: "ऑप्टिमाइज: %@ → मूळ %@, नवीन %@, अपडेट केले.",
        .logOptimizeErrorFormat: "ऑप्टिमाइज: %@ → त्रुटी: %@",
        .logOptimizeUnchangedFormat: "ऑप्टिमाइज: %@ → मूळ %@, नवीन %@, बदल नाही.",
        .logOptimizeCompletedFormat: "ऑप्टिमाइज पूर्ण: %d फाईल्स अपडेट झाल्या, %d फाईल्स बदलल्याच नाहीत.",

        // Menu
        .menuAboutApp: "HandBrake Batch Compressor बद्दल"
    ]
}

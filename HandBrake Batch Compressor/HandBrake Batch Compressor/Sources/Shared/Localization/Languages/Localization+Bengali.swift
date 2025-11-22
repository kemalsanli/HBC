//
//  Localization+Bengali.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

extension LocalizationCatalog {
    /// Bengali translations for all known keys.
    ///
    /// These values are machine-translated and may need review by native speakers,
    /// but they are intended to be clear and user-friendly for a first release.
    static let bengali: [L10nKey: String] = [
        .appTitle: "HandBrake ব্যাচ কমপ্রেসর",
        .statusReady: "প্রস্তুত",
        .statusNoVideosFound: "কোনও ভিডিও ফাইল পাওয়া যায়নি।",
        .statusHandBrakeMissing: "HandBrakeCLI পাওয়া যায়নি",
        .statusCancelled: "বাতিল করা হয়েছে ⛔️",
        .statusCompletedFormat: "সম্পন্ন ✅ %dটি প্রক্রিয়াকৃত, %dটি বাদ দেওয়া হয়েছে (%dমি %dসে)",
        .statusSearchingFiles: "ফাইল খোঁজা হচ্ছে…",
        .statusProcessingFormat: "প্রসেস হচ্ছে: %@",
        .buttonStart: "শুরু করুন",
        .buttonCancel: "বাতিল",
        .buttonSelectSourceFolder: "সোর্স ফোল্ডার নির্বাচন করুন",
        .toggleSaveRunLog: "রান লগ ফাইল সোর্স ফোল্ডারে সংরক্ষণ করুন",
        .toggleYoloMode: "YOLO মোড (অরিজিনাল ফাইল ওভাররাইট)",
        .buttonOptimizeOriginalFolder: "অরিজিনাল ফোল্ডার অপটিমাইজ করুন",
        .helpAboutTitle: "HandBrake ব্যাচ কমপ্রেসর",
        .helpAboutBody: """
HandBrake ব্যাচ কমপ্রেসর হল HandBrakeCLI দিয়ে সম্পূর্ণ ভিডিও ফোল্ডার কমপ্রেস করার জন্য একটি এক‑ক্লিক macOS ইউটিলিটি।

একটি সোর্স ফোল্ডার নির্বাচন করুন এবং “Start” চাপুন — অ্যাপটি সব নেস্টেড সাবফোল্ডার ঘুরে সমর্থিত ভিডিও ফাইলগুলো এনকোড করে এবং আপনার জন্য প্রগ্রেস ট্র্যাক করে। কোনও জটিল ওয়ার্কফ্লো বা কিউ ম্যানেজ করার প্রয়োজন নেই।
""",
        .yoloInfoTitle: "YOLO মোড",
        .optimizeInfoTitle: "অরিজিনাল ফোল্ডার অপটিমাইজ করুন",
        .installHandBrakeTitle: "HandBrake কীভাবে ইনস্টল করবেন",
        .buttonClose: "বন্ধ করুন",

        // General labels and tooltips
        .labelEncoder: "এনকোডার",
        .labelCustomEncoder: "এনকোডার:",
        .labelQuality: "কোয়ালিটি:",
        .labelFramerate: "ফ্রেমরেট:",
        .labelExtraParams: "অতিরিক্ত প্যারামিটার:",
        .placeholderQuality: "কোয়ালিটি",
        .placeholderFramerate: "ফ্রেমরেট",
        .placeholderExtra: "এক্সট্রা",
        .labelElapsedTimeFormat: "কেটে যাওয়া সময়: %dমি %dসে",
        .labelTotalProgressFormat: "মোট: %d/%d",
        .labelCurrentFileFormat: "বর্তমান: %@",
        .labelStatusPrefix: "স্ট্যাটাস:",
        .helpInstallTooltip: "Homebrew এবং HandBrakeCLI ইনস্টলের জন্য ধাপে ধাপে গাইড",
        .helpAboutTooltip: "অ্যাপ সম্পর্কে তথ্য এবং ব্যবহারের সাহায্য",
        .helpSettingsTooltip: "সেটিংস",
        .helpYoloTooltip: """
YOLO মোড শুধুমাত্র তখনই অরিজিনাল ফাইলগুলো ওভাররাইট করে যখন নতুন এনকোড করা ফাইলটি আকারে ছোট হয়। নতুন ফাইল যদি বড় হয় বা এনকোড ব্যর্থ হয়, তাহলে অরিজিনাল ফাইল অপরিবর্তিত থাকে। এই মোড স্বয়ংক্রিয়ভাবে চলে এবং পুরোনো সংস্করণগুলি স্থায়ীভাবে মুছে যেতে পারে।
""",
        .helpOptimizeTooltip: """
YOLO বন্ধ রেখে এনকোড করার পর কমপ্রেসড ফোল্ডার ব্যবহার করে অরিজিনাল ফোল্ডার আপডেট করা হয়। প্রতিটি মিলিত ফাইলের জন্য, যদি কমপ্রেসড ভার্সনটি ছোট হয় তবে সেটি অরিজিনাল ফাইলের জায়গা নেয়। সমান বা বড় সাইজের কমপ্রেসড ফাইলগুলি বাদ দেওয়া হয়। এই কাজটি ফিরিয়ে নেওয়া যায় না।
""",

        // Alerts
        .alertYoloTitle: "সতর্কতা: YOLO মোড",
        .alertYoloConfirm: "নিশ্চিত করুন",
        .alertYoloCancel: "বাতিল",
        .alertYoloMessage: "YOLO মোড চালু থাকলে আপনার অরিজিনাল ফাইলগুলো ওভাররাইট হতে পারে এবং পুরোনো ফাইলগুলো ডিলিট হয়ে যেতে পারে। এই কাজটি ফিরিয়ে নেওয়া যায় না। আপনি কি সত্যিই চালিয়ে যেতে চান?",
        .alertErrorTitle: "ত্রুটি",
        .alertErrorOk: "ঠিক আছে",
        .alertErrorUnknown: "একটি অজানা ত্রুটি ঘটেছে।",
        .alertSettingsLockedTitle: "সেটিংস উপলব্ধ নয়",
        .alertSettingsLockedMessage: "একটি ব্যাচ চলার সময় সেটিংস পরিবর্তন করা যায় না। অনুগ্রহ করে বর্তমান অপারেশন শেষ হওয়া পর্যন্ত অপেক্ষা করুন।",
        .alertSettingsLockedOk: "ঠিক আছে",

        // Settings & install
        .settingsTitle: "সেটিংস",
        .settingsLanguageSectionTitle: "ভাষা",
        .settingsLanguageLabel: "অ্যাপ ভাষা",
        .settingsLanguagePickerLabel: "ভাষা",
        .settingsLanguageDescription: "“System” আপনার macOS‑এর ভাষা অনুসরণ করে। অন্য অপশনগুলো, যেখানে অনুবাদ উপলব্ধ, অ্যাপকে জোর করে সেই ভাষা ব্যবহার করায়।",
        .settingsHBPathSectionTitle: "HandBrakeCLI পাথ",
        .settingsHBPathDescription: "ডিফল্ট অবস্থানে HandBrakeCLI পাওয়া যায়নি। আপনি যদি এটি ম্যানুয়ালি ইনস্টল করে থাকেন, তবে HandBrakeCLI বাইনারির সম্পূর্ণ পাথ দিন।",
        .settingsHBPathPlaceholder: "/usr/local/bin/HandBrakeCLI",
        .settingsHBPathInstalled: "ইনস্টল করা আছে",
        .settingsHBPathCheck: "পরীক্ষা করুন",
        .settingsHBPathError: "এই পাথে কোনও এক্সিকিউটেবল HandBrakeCLI পাওয়া যায়নি।",

        .installHomebrewSectionTitle: "Homebrew সেটআপ",
        .installHomebrewDescription: "আপনার সিস্টেমে যদি আগে থেকেই Homebrew ইনস্টল না থাকে, তবে প্রথমে এটি ইনস্টল করুন:",
        .installHomebrewSnippetTitle: "Homebrew ইনস্টল করুন",
        .installHBSectionTitle: "HandBrakeCLI ইনস্টলেশন",
        .installHBDescription: "Homebrew ইনস্টল হয়ে গেলে, HandBrakeCLI ইনস্টল করতে এই কমান্ড ব্যবহার করুন:",
        .installHBSnippetTitle: "HandBrakeCLI ইনস্টল করুন",
        .installVerificationTitle: "ভেরিফিকেশন",
        .installVerificationDescription: "HandBrake ব্যাচ কমপ্রেসর ডিফল্টভাবে নিম্নলিখিত পাথগুলোতে HandBrakeCLI খুঁজবে:",
        .installVerificationInstalled: "ইনস্টল করা আছে",
        .installVerificationCheck: "ইনস্টলেশন পরীক্ষা করুন",
        .installVerificationGoodToGo: "সব ঠিক আছে। HandBrakeCLI ইনস্টল হয়েছে এবং অ্যাপ স্বয়ংক্রিয়ভাবে এটি ব্যবহার করবে।",
        .installVerificationAutoPick: "HandBrakeCLI যদি এই লোকেশনগুলোর যেকোনও একটিতে ইনস্টল করা থাকে, তাহলে অ্যাপ পরবর্তী রান‑এ স্বয়ংক্রিয়ভাবে এটি খুঁজে পাবে।",
        .installManualPathHint: "আপনি যদি HandBrakeCLI‑কে কোনও নন‑স্ট্যান্ডার্ড লোকেশনে ম্যানুয়ালি ইনস্টল করে থাকেন, তবে সেটিংস থেকে সেই পাথটি নির্দিষ্ট করতে পারেন।",

        // Help/info section subheadings
        .helpAboutSectionTitle: "About",
        .yoloInfoSectionWhatTitle: "YOLO মোড কী করে",
        .yoloInfoSectionImportantTitle: "গুরুত্বপূর্ণ",
        .optimizeInfoSectionWhatTitle: "এই কমান্ড কী করে",
        .optimizeInfoSectionWhenTitle: "কখন এটি ব্যবহার করবেন",

        // Help/info body text
        .yoloInfoBodyWhat: """
YOLO মোড চালু থাকলে HandBrake ব্যাচ কমপ্রেসর প্রতিটি নতুন এনকোড করা ফাইলকে \
তার অরিজিনাল ফাইলের সাথে তুলনা করে এবং স্বয়ংক্রিয়ভাবে ঠিক করে কোনটি রাখা হবে:

- যদি এনকোড করা ফাইল অরিজিনালের চেয়ে ছোট হয়, তাহলে অরিজিনাল ফাইল ডিলিট হয়ে যায় এবং নতুন ফাইল রাখা হয়।
- যদি এনকোড করা ফাইল বড় হয়, তাহলে অরিজিনাল ফাইল রাখা হয় এবং এনকোড করা ফাইল ডিলিট হয়।
- যদি এনকোড ব্যর্থ হয় বা আউটপুট ফাইল ফাঁকা হয়, তাহলে অরিজিনাল ফাইল রাখা হয় এবং ব্যর্থ আউটপুট ডিলিট হয়।
""",
        .yoloInfoBodyImportant: """
YOLO মোড ব্যাচ চলাকালীন স্বয়ংক্রিয়ভাবে কাজ করে। একটি ছোট এনকোডেড ভার্সন উপলব্ধ হওয়ার সাথে সাথেই অরিজিনাল ফাইলগুলো ডিলিট হয়ে যেতে পারে। এই কাজটি ফিরিয়ে নেওয়া যায় না, তাই YOLO মোড চালু করার আগে নিশ্চিত হোন যে আপনার ব্যাকআপ আছে অথবা আপনি অরিজিনাল ফাইল হারাতে আপত্তি করছেন না।
""",
        .optimizeInfoBodyWhat: """
YOLO মোড বন্ধ রেখে এনকোড করার পরে HandBrake ব্যাচ কমপ্রেসর সব এনকোড করা ফাইলকে \
একটি আলাদা কমপ্রেসড ফোল্ডারে লেখে (উদাহরণ: `compressedMyVideos`)। অরিজিনাল ফোল্ডার অপরিবর্তিত থাকে।

“অরিজিনাল ফোল্ডার অপটিমাইজ করুন” কমান্ডটি তখন:

- কমপ্রেসড ফোল্ডারে এনকোড করা ফাইলগুলো স্ক্যান করে।
- প্রতিটি এনকোড করা ফাইলের জন্য মিলযুক্ত অরিজিনাল ফাইল খুঁজে বের করে।
- ফাইল সাইজ তুলনা করে এবং শুধুমাত্র তখনই অরিজিনাল ফাইল প্রতিস্থাপন করে যখন এনকোড করা ফাইলটি ছোট হয়।
- যখন এনকোড করা ফাইল বড় বা সমান আকারের হয়, তখন অরিজিনাল ফাইল অপরিবর্তিত থাকে।
""",
        .optimizeInfoBodyWhen: """
এই কমান্ডটি ব্যবহার করুন যখন আপনি চান:

- প্রথমে কমপ্রেসড ফোল্ডারে এনকোড করা ফাইলগুলোর কোয়ালিটি পরীক্ষা করতে।
- এবং তারপর সন্তুষ্ট হলে, ছোট সাইজের ভার্সনগুলোকে অরিজিনাল ফোল্ডারে প্রয়োগ করে ফাইলগুলো manually সরানো ছাড়াই ডিস্ক স্পেস সেভ করতে।

এই অপারেশন আপনার অরিজিনাল ফোল্ডার পরিবর্তন করে এবং এটি ফিরিয়ে নেওয়া যায় না। এই কমান্ড চালানোর আগে নিশ্চিত হোন যে আপনি কমপ্রেসড ফোল্ডারের ফলাফল নিয়ে সন্তুষ্ট।
""",

        // Error bodies
        .errorNoVideosBody: "নির্বাচিত ফোল্ডারে কোনও ভিডিও ফাইল পাওয়া যায়নি।",
        .errorHandBrakeMissingBodyFormat: """
নিম্নলিখিত স্থানে HandBrakeCLI পাওয়া যায়নি:

%@

অনুগ্রহ করে Homebrew এবং HandBrakeCLI ইনস্টল করুন।
ইনস্টলেশনের নির্দেশনার জন্য উপরের ডান কোণের “HandBrake কীভাবে ইনস্টল করবেন” বোতামে ক্লিক করুন।
""",
        .errorHandBrakeFailedBodyFormat: """
প্রসেস করার সময় HandBrakeCLI ব্যর্থ হয়েছে:

%@ 

বিস্তারিত: %@
""",

        // Generic buttons
        .buttonCopy: "কপি করুন",
        .buttonCopied: "কপি হয়েছে",

        // Log messages
        .logEncodeCancelled: "এনকোড ব্যবহারকারী দ্বারা বাতিল করা হয়েছে",
        .logEncodeStartedYoloOn: "---- এনকোড শুরু (YOLO: চালু) ----",
        .logEncodeStartedYoloOff: "---- এনকোড শুরু (YOLO: বন্ধ) ----",
        .logSleepAssertionFailedFormat: "স্লীপ অ্যাসারশন তৈরি করতে ব্যর্থ: %d",
        .logFailedToCreateDirectoryFormat: "ডিরেক্টরি তৈরি করতে ব্যর্থ: %@ - %@",
        .logErrorRunningHandBrakeFormat: "❌ HandBrakeCLI চালাতে ত্রুটি %@: %@",
        .logCompressedFolderMissingFormat: "কমপ্রেসড ফোল্ডার পাওয়া যায়নি: %@",
        .logYoloReplacedOriginalFormat: "%@ → ইনপুট: %@, আউটপুট: %@ → সফল, অরিজিনাল ডিলিট করা হয়েছে",
        .logYoloOriginalDeleteFailedFormat: "অরিজিনাল ফাইল ডিলিট করা যায়নি: %@ - %@",
        .logYoloTempMoveFailedFormat: "টেম্প ফাইল সরানো যায়নি: %@ → %@ - %@",
        .logYoloSkippedLargerOrEqualFormat: "%@ → ইনপুট: %@, আউটপুট: %@ → বাদ দেওয়া হয়েছে (আউটপুট ≥ ইনপুট)",
        .logYoloEncodeFailedFormat: "%@ → ইনপুট: %@, আউটপুট: 0.0 MB → বাদ দেওয়া হয়েছে (এনকোড ব্যর্থ)",
        .logYoloFailedOutputDeleteFailedFormat: "ব্যর্থ আউটপুট ফাইল ডিলিট করা যায়নি: %@ - %@",
        .logOutputDeleteFailedFormat: "আউটপুট ফাইল ডিলিট করা যায়নি: %@ - %@",
        .logEncodeSuccessFormat: "%@ → ইনপুট: %@, আউটপুট: %@ → এনকোড সফল",
        .logEncodeSkippedLargerOrEqualFormat: "%@ → ইনপুট: %@, আউটপুট: %@ → বাদ দেওয়া হয়েছে (আউটপুট বড় বা সমান)",
        .logOptimizeUpdatedFormat: "অপটিমাইজ: %@ → অরিজিনাল %@, নতুন %@, আপডেট করা হয়েছে।",
        .logOptimizeErrorFormat: "অপটিমাইজ: %@ → ত্রুটি: %@",
        .logOptimizeUnchangedFormat: "অপটিমাইজ: %@ → অরিজিনাল %@, নতুন %@, অপরিবর্তিত।",
        .logOptimizeCompletedFormat: "অপটিমাইজ সম্পন্ন: %dটি ফাইল আপডেট, %dটি অপরিবর্তিত।",

        // Menu
        .menuAboutApp: "HandBrake Batch Compressor সম্পর্কে"
    ]
}

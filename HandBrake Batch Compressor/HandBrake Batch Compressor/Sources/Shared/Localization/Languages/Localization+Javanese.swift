//
//  Localization+Javanese.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

extension LocalizationCatalog {
    /// Javanese translations for all known keys.
    ///
    /// These values are machine-translated / adapted and may need review by native speakers,
    /// but they are intended to be clear and user-friendly for a first release.
    static let javanese: [L10nKey: String] = [
        .appTitle: "HandBrake Batch Compressor",
        .statusReady: "Wis siap",
        .statusNoVideosFound: "Ora ana file video sing ketemu.",
        .statusHandBrakeMissing: "HandBrakeCLI ora ketemu",
        .statusCancelled: "Dibatalkan ⛔️",
        .statusCompletedFormat: "Rampung ✅ %d diproses, %d dilewati (%dm %ds)",
        .statusSearchingFiles: "Nggoleki file…",
        .statusProcessingFormat: "Ngolah: %@",
        .buttonStart: "Mulai",
        .buttonCancel: "Batal",
        .buttonSelectSourceFolder: "Pilih folder sumber",
        .toggleSaveRunLog: "Simpen file log ing folder sumber",
        .toggleYoloMode: "Mode YOLO (ngganti file asli)",
        .buttonOptimizeOriginalFolder: "Optimalake folder asli",
        .helpAboutTitle: "HandBrake Batch Compressor",
        .helpAboutBody: """
HandBrake Batch Compressor iku utilitas macOS siji-klik kanggo ngompres sak folder video nganggo HandBrakeCLI.

Pilih folder sumber lan pencet Start — app bakal nyusuri kabeh subfolder, ng-encode file video sing didhukung, lan nuduhaké progres kanggo sampeyan. Ora perlu alur kerja kompleks utawa ngatur antrian kanthi manual.
""",
        .yoloInfoTitle: "Mode YOLO",
        .optimizeInfoTitle: "Optimalake folder asli",
        .installHandBrakeTitle: "Cara nginstal HandBrake",
        .buttonClose: "Tutup",

        // General labels and tooltips
        .labelEncoder: "Encoder",
        .labelCustomEncoder: "Encoder:",
        .labelQuality: "Kualitas:",
        .labelFramerate: "Framerate:",
        .labelExtraParams: "Paramèter ekstra:",
        .placeholderQuality: "Kualitas",
        .placeholderFramerate: "Framerate",
        .placeholderExtra: "Ekstra",
        .labelElapsedTimeFormat: "Wektu lumaku: %dm %ds",
        .labelTotalProgressFormat: "Total: %d/%d",
        .labelCurrentFileFormat: "Saiki: %@",
        .labelStatusPrefix: "Status:",
        .helpInstallTooltip: "Pandhuan langkah demi langkah kanggo nginstal Homebrew lan HandBrakeCLI",
        .helpAboutTooltip: "Info bab app lan pitulungan panggunaan",
        .helpSettingsTooltip: "Setelan",
        .helpYoloTooltip: """
Mode YOLO mung ngganti file asli yen file anyar sing wis di-encode luwih cilik. Yen file anyar luwih gedhé utawa encode gagal, file asli bakal dijaga. Mode iki otomatis lan bisa mbusak versi lawas kanthi permanèn.
""",
        .helpOptimizeTooltip: """
Nggunakake folder sing wis dikompres kanggo nganyari folder asli sawisé encode karo YOLO dipateni. Kanggo saben file sing cocog, yen versi kompres luwih cilik, bakal ngganti file asli. File kompres sing luwih gedhé utawa padha ukurané bakal dilewati. Tumindak iki ora bisa dibalekaké.
""",

        // Alerts
        .alertYoloTitle: "Pènget: Mode YOLO",
        .alertYoloConfirm: "Konfirmasi",
        .alertYoloCancel: "Batal",
        .alertYoloMessage: """
Nalika mode YOLO diaktifaké, file asli sampeyan bisa KETINDHIH lan file lawas bisa DI-BUSAK. Tumindak iki ORA BISA DIBALEKAKÉ. Apa sampeyan yakin arep nerusaké?
""",
        .alertErrorTitle: "Kesalahan",
        .alertErrorOk: "OK",
        .alertErrorUnknown: "Kesalahan sing ora dikenal wis kedadeyan.",
        .alertSettingsLockedTitle: "Setelan ora kasedhiya",
        .alertSettingsLockedMessage: "Setelan ora bisa diganti nalika batch lagi mlaku. Enteni nganti operasi saiki rampung.",
        .alertSettingsLockedOk: "OK",

        // Settings & install
        .settingsTitle: "Setelan",
        .settingsLanguageSectionTitle: "Basa",
        .settingsLanguageLabel: "Basa app",
        .settingsLanguagePickerLabel: "Basa",
        .settingsLanguageDescription: "“System” bakal ngetutaké basa macOS sampeyan. Pilihan liyane bakal meksa app nganggo basa kasebut yen terjemahan kasedhiya.",
        .settingsHBPathSectionTitle: "Path HandBrakeCLI",
        .settingsHBPathDescription: "HandBrakeCLI ora ditemokaké ing lokasi standar. Yen sampeyan nginstal kanthi manual, tulisen path lengkap menyang biner HandBrakeCLI.",
        .settingsHBPathPlaceholder: "/usr/local/bin/HandBrakeCLI",
        .settingsHBPathInstalled: "Wis keinstal",
        .settingsHBPathCheck: "Mriksa",
        .settingsHBPathError: "Ora ana HandBrakeCLI sing bisa dieksekusi ing path iki.",

        .installHomebrewSectionTitle: "Setup Homebrew",
        .installHomebrewDescription: "Dhik instalké dhisik Homebrew yen durung ana ing sistem sampeyan:",
        .installHomebrewSnippetTitle: "Instal Homebrew",
        .installHBSectionTitle: "Instalasi HandBrakeCLI",
        .installHBDescription: "Sawisé Homebrew keinstal, instalké HandBrakeCLI nganggo perintah iki:",
        .installHBSnippetTitle: "Instal HandBrakeCLI",
        .installVerificationTitle: "Verifikasi",
        .installVerificationDescription: "HandBrake Batch Compressor bakal nggoleki HandBrakeCLI ing path standar iki:",
        .installVerificationInstalled: "Wis keinstal",
        .installVerificationCheck: "Mriksa instalasi",
        .installVerificationGoodToGo: "Kabeh siap. HandBrakeCLI wis keinstal lan bakal otomatis dideteksi.",
        .installVerificationAutoPick: "Yèn HandBrakeCLI keinstal ing salah siji lokasi iki, app bakal nemokaké kanthi otomatis ing run sabanjuré.",
        .installManualPathHint: "Yèn kowe nginstal HandBrakeCLI kanthi manual ing lokasi sing ora standar, kowe bisa nyetel path‑é saka Setelan.",

        // Help/info section subheadings
        .helpAboutSectionTitle: "Bab app",
        .yoloInfoSectionWhatTitle: "Apa sing ditindakaké mode YOLO",
        .yoloInfoSectionImportantTitle: "Penting",
        .optimizeInfoSectionWhatTitle: "Apa sing ditindakaké prentah iki",
        .optimizeInfoSectionWhenTitle: "Nalika kudu digunakaké",

        // Help/info body text
        .yoloInfoBodyWhat: """
Nalika mode YOLO diaktifaké, HandBrake Batch Compressor mbandhingaké saben file anyar sing wis di-encode \
karo file asliné lan kanthi otomatis mutusaké endi sing kudu dijaga:

- Yen file encode luwih cilik tinimbang asli, file asli dibusak lan file anyar dijaga.
- Yen file encode luwih gedhé, file asli dijaga lan file encode dibusak.
- Yen encode gagal utawa file output kosong, file asli dijaga lan output sing gagal dibusak.
""",
        .yoloInfoBodyImportant: """
Mode YOLO mlaku kanthi otomatis nalika batch lagi mlaku. File asli bisa dihapus \
saiki uga nalika versi encode sing luwih cilik wis kasedhiya. Tumindak iki ora bisa dibalekaké, mula priksa manawa \
kowe wis duwe backup utawa gelem nampa risiko kelangan file asli sadurunge ngaktifaké mode YOLO.
""",
        .optimizeInfoBodyWhat: """
Sawisé ng-encode kanthi mode YOLO dipateni, HandBrake Batch Compressor nulis kabeh file encode \
mlebu folder terpisah sing wis dikompres (umpamané: `compressedMyVideos`). Folder asli tetep tanpa owah-owahan.
  
Prentah "Optimize Original Folder" banjur:
  
- Nglacak folder kompres kanggo golek file encode.
- Goleki file asli sing cocog kanggo saben file encode.
- Mbandhingaké ukuran file lan mung ngganti asli yen file encode luwih cilik.
- Ninggalaké file asli tanpa owah-owahan yèn file encode luwih gedhé utawa padha ukurané.
""",
        .optimizeInfoBodyWhen: """
Gunakna prentah iki nalika kowe pengin:
  
- Dhisik mriksa kualitas file encode ing folder kompres.
- Banjur, sawisé wareg, nerapaké versi sing luwih cilik bali menyang folder asli \
  supaya ngirit papan disk tanpa mindhah file kanthi manual.
  
Operasi iki ngganti folder asli lan ora bisa dibalekaké. Pastèkna kowe wis wareg \
karo asil ing folder kompres sadurunge mlakuaké prentah iki.
""",

        // Error bodies
        .errorNoVideosBody: "Ora ana file video ing folder sing dipilih.",
        .errorHandBrakeMissingBodyFormat: """
HandBrakeCLI ora bisa ditemokaké ing:
  
%@
  
Mangga instalké Homebrew lan HandBrakeCLI.
Klik tombol “How to install HandBrake” ing pojok tengen ndhuwur kanggo pandhuan instalasi.
""",
        .errorHandBrakeFailedBodyFormat: """
HandBrakeCLI gagal nalika ngolah:
  
%@ 
  
Rincian: %@
""",

        // Generic buttons
        .buttonCopy: "Salin",
        .buttonCopied: "Wis disalin",

        // Log messages
        .logEncodeCancelled: "Encode dibatalaké pangguna",
        .logEncodeStartedYoloOn: "---- Encode diwiwiti (YOLO: ON) ----",
        .logEncodeStartedYoloOff: "---- Encode diwiwiti (YOLO: OFF) ----",
        .logSleepAssertionFailedFormat: "Gagal nggawe sleep assertion: %d",
        .logFailedToCreateDirectoryFormat: "Gagal nggawe direktori: %@ - %@",
        .logErrorRunningHandBrakeFormat: "❌ Kesalahan nalika mlakuaké HandBrakeCLI kanggo %@: %@",
        .logCompressedFolderMissingFormat: "Folder kompres ora ketemu: %@",
        .logYoloReplacedOriginalFormat: "%@ → Input: %@, Output: %@ → sukses, asli dibusak",
        .logYoloOriginalDeleteFailedFormat: "File asli ora bisa dibusak: %@ - %@",
        .logYoloTempMoveFailedFormat: "File sementara ora bisa dipindhah: %@ → %@ - %@",
        .logYoloSkippedLargerOrEqualFormat: "%@ → Input: %@, Output: %@ → dilewati (output ≥ input)",
        .logYoloEncodeFailedFormat: "%@ → Input: %@, Output: 0.0 MB → dilewati (encode gagal)",
        .logYoloFailedOutputDeleteFailedFormat: "File output gagal ora bisa dibusak: %@ - %@",
        .logOutputDeleteFailedFormat: "File output ora bisa dibusak: %@ - %@",
        .logEncodeSuccessFormat: "%@ → Input: %@, Output: %@ → encode sukses",
        .logEncodeSkippedLargerOrEqualFormat: "%@ → Input: %@, Output: %@ → dilewati (output luwih gedhé utawa padha)",
        .logOptimizeUpdatedFormat: "Optimize: %@ → asli %@, anyar %@, wis dianyari.",
        .logOptimizeErrorFormat: "Optimize: %@ → KESALAHAN: %@",
        .logOptimizeUnchangedFormat: "Optimize: %@ → asli %@, anyar %@, ora owah.",
        .logOptimizeCompletedFormat: "Optimize rampung: %d file dianyari, %d tanpa owah-owahan.",

        // Menu
        .menuAboutApp: "Bab HandBrake Batch Compressor"
    ]
}

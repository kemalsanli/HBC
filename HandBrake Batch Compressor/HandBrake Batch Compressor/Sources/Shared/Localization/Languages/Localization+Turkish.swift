//
//  Localization+Turkish.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

/// Turkish translations for all known keys.
///
/// These can be refined over time. If a key is missing here, the
/// English string is used as a fallback.
extension LocalizationCatalog {
    static let turkish: [L10nKey: String] = [
        .appTitle: "HandBrake Toplu Sıkıştırıcı",
        .statusReady: "Hazır",
        .statusNoVideosFound: "Seçilen klasörde video dosyası bulunamadı.",
        .statusHandBrakeMissing: "HandBrakeCLI bulunamadı",
        .statusCancelled: "İptal edildi ⛔️",
        .statusCompletedFormat: "Tamamlandı ✅ %d dosya işlendi, %d dosya atlandı (%ddk %ds)",
        .statusSearchingFiles: "Dosyalar aranıyor…",
        .statusProcessingFormat: "İşleniyor: %@",
        .buttonStart: "Başlat",
        .buttonCancel: "İptal",
        .buttonSelectSourceFolder: "Kaynak Klasörü Seç",
        .toggleSaveRunLog: "Çalışma kayıt dosyasını kaynak klasöre kaydet",
        .toggleYoloMode: "YOLO modu (orijinal dosyaların üzerine yaz)",
        .buttonOptimizeOriginalFolder: "Orijinal Klasörü Optimize Et",
        .helpAboutTitle: "HandBrake Toplu Sıkıştırıcı",
        .helpAboutBody: """
HandBrake Toplu Sıkıştırıcı, HandBrakeCLI kullanarak tüm video klasörlerini tek tıkla sıkıştırmak için tasarlanmış bir macOS aracıdır.

Bir kaynak klasör seçin ve Başlat’a basın — uygulama tüm alt klasörleri dolaşır, desteklenen video dosyalarını kodlar ve ilerlemeyi sizin için takip eder. Karmaşık iş akışları veya kuyruklar yoktur.
""",
        .yoloInfoTitle: "YOLO Modu",
        .optimizeInfoTitle: "Orijinal Klasörü Optimize Et",
        .installHandBrakeTitle: "HandBrake nasıl kurulur",
        .buttonClose: "Kapat",

        // General labels and tooltips
        .labelEncoder: "Kodlayıcı",
        .labelCustomEncoder: "Kodlayıcı:",
        .labelQuality: "Kalite:",
        .labelFramerate: "Kare hızı:",
        .labelExtraParams: "Ek parametreler:",
        .placeholderQuality: "Kalite",
        .placeholderFramerate: "Kare hızı",
        .placeholderExtra: "Ekstra",
        .labelElapsedTimeFormat: "Geçen süre: %ddk %ds",
        .labelTotalProgressFormat: "Toplam: %d/%d",
        .labelCurrentFileFormat: "Şu an: %@",
        .labelStatusPrefix: "Durum:",
        .helpInstallTooltip: "Homebrew ve HandBrakeCLI kurulumu için adım adım rehber",
        .helpAboutTooltip: "Hakkında ve kullanım bilgisi",
        .helpSettingsTooltip: "Ayarlar",
        .helpYoloTooltip: """
YOLO modu, yeni oluşturulan video dosyası orijinalden daha az yer kaplıyorsa orijinal dosyanın yerine geçmesini sağlar. Yeni dosya daha büyükse ya da kodlama başarısız olursa orijinal dosya aynen korunur. Bu işlem otomatik gerçekleşir ve silinen orijinal dosyalar geri getirilemez.
""",
        .helpOptimizeTooltip: """
Sıkıştırılmış klasörü kullanarak, YOLO kapalıyken yapılan kodlamadan sonra orijinal klasörü günceller. Her eşleşen dosya için, sıkıştırılmış sürüm daha küçükse orijinal dosyanın yerini alır. Daha büyük veya eşit boyuttaki sıkıştırılmış dosyalar atılır. Bu işlem geri alınamaz.
""",

        // Alerts
        .alertYoloTitle: "Uyarı: YOLO Modu",
        .alertYoloConfirm: "Onayla",
        .alertYoloCancel: "Vazgeç",
        .alertYoloMessage: "YOLO modu etkinleştirildiğinde, orijinal dosyalarınızın ÜZERİNE YAZILABİLİR ve eski dosyalar SİLİNEBİLİR. Bu işlem GERİ ALINAMAZ. Devam etmek istediğinizden emin misiniz?",
        .alertErrorTitle: "Hata",
        .alertErrorOk: "Tamam",
        .alertErrorUnknown: "Bilinmeyen bir hata oluştu.",
        .alertSettingsLockedTitle: "Ayarlar kullanılamıyor",
        .alertSettingsLockedMessage: "Bir toplu işlem çalışırken ayarlar değiştirilemez. Lütfen mevcut işlem tamamlanana kadar bekleyin.",
        .alertSettingsLockedOk: "Tamam",

        // Settings & install
        .settingsTitle: "Ayarlar",
        .settingsLanguageSectionTitle: "Dil",
        .settingsLanguageLabel: "Uygulama dili",
        .settingsLanguagePickerLabel: "Dil",
        .settingsLanguageDescription: "“Sistem” seçeneği macOS dilinizi takip eder. Diğer seçenekler, çeviri olduğu sürece uygulamayı o dilde kullanmaya zorlar.",
        .settingsHBPathSectionTitle: "HandBrakeCLI Yolu",
        .settingsHBPathDescription: "HandBrakeCLI varsayılan konumlarda bulunamadı. Manuel kurulum yaptıysanız, HandBrakeCLI ikili dosyasının tam yolunu girin.",
        .settingsHBPathPlaceholder: "/usr/local/bin/HandBrakeCLI",
        .settingsHBPathInstalled: "Yüklü",
        .settingsHBPathCheck: "Kontrol et",
        .settingsHBPathError: "Bu yolda çalıştırılabilir bir HandBrakeCLI bulunamadı.",

        .installHomebrewSectionTitle: "Homebrew kurulumu",
        .installHomebrewDescription: "Önce sisteminizde Homebrew yüklü değilse Homebrew kurulumunu yapın:",
        .installHomebrewSnippetTitle: "Homebrew kur",
        .installHBSectionTitle: "HandBrakeCLI kurulumu",
        .installHBDescription: "Homebrew kurulduktan sonra HandBrakeCLI’yi şu komutla yükleyin:",
        .installHBSnippetTitle: "HandBrakeCLI kur",
        .installVerificationTitle: "Doğrulama",
        .installVerificationDescription: "HandBrake Toplu Sıkıştırıcı, HandBrakeCLI’yi şu varsayılan yollarda arar:",
        .installVerificationInstalled: "Yüklü",
        .installVerificationCheck: "Kurulumu kontrol et",
        .installVerificationGoodToGo: "Hazırsınız. HandBrakeCLI yüklü ve uygulama tarafından otomatik olarak kullanılacak.",
        .installVerificationAutoPick: "HandBrakeCLI bu konumlardan birinde yüklüyse, uygulama bir sonraki çalıştırmada otomatik olarak bulacaktır.",
        .installManualPathHint: "HandBrakeCLI’yi standart olmayan bir konuma manuel kurduysanız, Ayarlar menüsünden bu yolu tanımlayabilirsiniz.",

        // Help/info section subheadings
        .helpAboutSectionTitle: "Hakkında",
        .yoloInfoSectionWhatTitle: "YOLO modu ne yapar?",
        .yoloInfoSectionImportantTitle: "Önemli",
        .optimizeInfoSectionWhatTitle: "Bu komut ne yapar?",
        .optimizeInfoSectionWhenTitle: "Ne zaman kullanmalı?",

        // Help/info body text
        .yoloInfoBodyWhat: """
YOLO modu etkinleştirildiğinde, HandBrake Toplu Sıkıştırıcı her yeni kodlanmış dosyayı \
orijinaliyle karşılaştırır ve hangisinin korunacağına otomatik olarak karar verir:

- Kodlanmış dosya orijinalden küçükse, orijinal dosya silinir ve yeni dosya saklanır.
- Kodlanmış dosya daha büyükse, orijinal dosya korunur ve kodlanmış dosya silinir.
- Kodlama başarısız olursa veya çıktı dosyası boşsa, orijinal dosya korunur ve başarısız çıktı silinir.
""",
        .yoloInfoBodyImportant: """
YOLO modu, toplu işlem çalışırken otomatik olarak davranır. Daha küçük bir kodlanmış sürüm bulunduğunda \
orijinal dosyalar hemen silinebilir. Bu işlem geri alınamaz; bu nedenle YOLO modunu açmadan önce mutlaka \
yedeklerinizin olduğundan ya da orijinal dosyaları kaybetmeyi göze aldığınızdan emin olun.
""",
        .optimizeInfoBodyWhat: """
YOLO modu kapalıyken kodlama yaptıktan sonra, HandBrake Toplu Sıkıştırıcı tüm kodlanmış dosyaları \
ayrı bir sıkıştırılmış klasöre (örneğin: `compressedMyVideos`) yazar. Orijinal klasör değişmeden kalır.

"Orijinal Klasörü Optimize Et" komutu ise:

- Sıkıştırılmış klasördeki kodlanmış dosyaları tarar.
- Her kodlanmış dosya için eşleşen orijinal dosyayı bulur.
- Dosya boyutlarını karşılaştırır ve yalnızca kodlanmış dosya daha küçükse orijinali değiştirir.
- Kodlanmış dosya daha büyük ya da aynı boyuttaysa orijinal dosyayı olduğu gibi bırakır.
""",
        .optimizeInfoBodyWhen: """
Bu komutu şu durumlarda kullanmak isteyebilirsiniz:

- Önce sıkıştırılmış klasördeki kodlanmış dosyaların kalitesini gözle kontrol etmek,
- Daha sonra memnun kaldığınızda, daha küçük sürümleri elle uğraşmadan orijinal klasöre geri uygulayarak \
  disk alanı kazanmak.

Bu işlem orijinal klasörünüzde değişiklik yapar ve geri alınamaz. Komutu çalıştırmadan önce \
sıkıştırılmış klasördeki sonuçlardan memnun olduğunuzdan emin olun.
""",

        // Error bodies
        .errorNoVideosBody: "Seçilen klasörde hiçbir video dosyası bulunamadı.",
        .errorHandBrakeMissingBodyFormat: """
HandBrakeCLI şu konumda bulunamadı:

%@

Lütfen önce Homebrew ve HandBrakeCLI kurulumunu yapın.
Sağ üstteki “HandBrake nasıl kurulur” düğmesine tıklayarak kurulum adımlarını görebilirsiniz.
""",
        .errorHandBrakeFailedBodyFormat: """
HandBrakeCLI aşağıdaki dosya işlenirken hata verdi:

%@ 

Detaylar: %@
""",

        // Generic buttons
        .buttonCopy: "Kopyala",
        .buttonCopied: "Kopyalandı",

        // Log messages
        .logEncodeCancelled: "Kodlama kullanıcı tarafından iptal edildi",
        .logEncodeStartedYoloOn: "---- Kodlama başladı (YOLO: AÇIK) ----",
        .logEncodeStartedYoloOff: "---- Kodlama başladı (YOLO: KAPALI) ----",
        .logSleepAssertionFailedFormat: "Uyku engelleme isteği oluşturulamadı: %d",
        .logFailedToCreateDirectoryFormat: "Klasör oluşturulamadı: %@ - %@",
        .logErrorRunningHandBrakeFormat: "❌ HandBrakeCLI şu dosya için çalıştırılamadı: %@ - %@",
        .logCompressedFolderMissingFormat: "Sıkıştırılmış klasör bulunamadı: %@",
        .logYoloReplacedOriginalFormat: "%@ → Girdi: %@, Çıktı: %@ → başarılı, orijinal silindi",
        .logYoloOriginalDeleteFailedFormat: "Orijinal dosya silinemedi: %@ - %@",
        .logYoloTempMoveFailedFormat: "Geçici dosya taşınamadı: %@ → %@ - %@",
        .logYoloSkippedLargerOrEqualFormat: "%@ → Girdi: %@, Çıktı: %@ → atlandı (çıktı ≥ girdi)",
        .logYoloEncodeFailedFormat: "%@ → Girdi: %@, Çıktı: 0.0 MB → atlandı (kodlama başarısız)",
        .logYoloFailedOutputDeleteFailedFormat: "Başarısız çıktı dosyası silinemedi: %@ - %@",
        .logOutputDeleteFailedFormat: "Çıktı dosyası silinemedi: %@ - %@",
        .logEncodeSuccessFormat: "%@ → Girdi: %@, Çıktı: %@ → kodlama başarılı",
        .logEncodeSkippedLargerOrEqualFormat: "%@ → Girdi: %@, Çıktı: %@ → atlandı (çıktı daha büyük veya eşit)",
        .logOptimizeUpdatedFormat: "Optimize: %@ → orijinal %@, yeni %@, güncellendi.",
        .logOptimizeErrorFormat: "Optimize: %@ → HATA: %@",
        .logOptimizeUnchangedFormat: "Optimize: %@ → orijinal %@, yeni %@, değişmedi.",
        .logOptimizeCompletedFormat: "Optimize tamamlandı: %d dosya güncellendi, %d dosya değişmedi.",

        // Menu
        .menuAboutApp: "HandBrake Batch Compressor Hakkında"
    ]
}

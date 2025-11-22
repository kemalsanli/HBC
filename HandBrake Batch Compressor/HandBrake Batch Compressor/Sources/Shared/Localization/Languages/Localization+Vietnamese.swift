//
//  Localization+Vietnamese.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

extension LocalizationCatalog {
    /// Vietnamese translations for all known keys.
    ///
    /// These values are machine-translated and may need review by native speakers,
    /// but they are intended to be clear and user-friendly for a first release.
    static let vietnamese: [L10nKey: String] = [
        .appTitle: "Trình Nén Hàng Loạt HandBrake",
        .statusReady: "Sẵn sàng",
        .statusNoVideosFound: "Không tìm thấy tệp video nào.",
        .statusHandBrakeMissing: "Không tìm thấy HandBrakeCLI",
        .statusCancelled: "Đã hủy ⛔️",
        .statusCompletedFormat: "Hoàn tất ✅ %d tệp đã xử lý, %d tệp bị bỏ qua (%dph %dgiây)",
        .statusSearchingFiles: "Đang tìm tệp…",
        .statusProcessingFormat: "Đang xử lý: %@",
        .buttonStart: "Bắt đầu",
        .buttonCancel: "Hủy",
        .buttonSelectSourceFolder: "Chọn thư mục nguồn",
        .toggleSaveRunLog: "Lưu tệp nhật ký chạy trong thư mục nguồn",
        .toggleYoloMode: "Chế độ YOLO (ghi đè tệp gốc)",
        .buttonOptimizeOriginalFolder: "Tối ưu hóa thư mục gốc",
        .helpAboutTitle: "Trình Nén Hàng Loạt HandBrake",
        .helpAboutBody: """
Trình Nén Hàng Loạt HandBrake là tiện ích macOS chỉ với một lần nhấp để nén toàn bộ thư mục video bằng HandBrakeCLI.

Chỉ cần chọn thư mục nguồn và nhấn Bắt đầu — ứng dụng sẽ duyệt qua tất cả các thư mục con lồng nhau, mã hóa các tệp video được hỗ trợ và theo dõi tiến trình cho bạn. Không cần cấu hình quy trình phức tạp hay tự quản lý hàng đợi.
""",
        .yoloInfoTitle: "Chế độ YOLO",
        .optimizeInfoTitle: "Tối ưu hóa thư mục gốc",
        .installHandBrakeTitle: "Cách cài đặt HandBrake",
        .buttonClose: "Đóng",

        // General labels and tooltips
        .labelEncoder: "Bộ mã hóa",
        .labelCustomEncoder: "Bộ mã hóa:",
        .labelQuality: "Chất lượng:",
        .labelFramerate: "Tốc độ khung hình:",
        .labelExtraParams: "Tham số bổ sung:",
        .placeholderQuality: "Chất lượng",
        .placeholderFramerate: "Tốc độ khung hình",
        .placeholderExtra: "Bổ sung",
        .labelElapsedTimeFormat: "Thời gian đã trôi qua: %dph %dgiây",
        .labelTotalProgressFormat: "Tổng: %d/%d",
        .labelCurrentFileFormat: "Hiện tại: %@",
        .labelStatusPrefix: "Trạng thái:",
        .helpInstallTooltip: "Hướng dẫn từng bước để cài đặt Homebrew và HandBrakeCLI",
        .helpAboutTooltip: "Thông tin về ứng dụng và trợ giúp sử dụng",
        .helpSettingsTooltip: "Cài đặt",
        .helpYoloTooltip: """
Chế độ YOLO chỉ ghi đè tệp gốc khi tệp mới được mã hóa có kích thước nhỏ hơn. Nếu tệp mới lớn hơn hoặc việc mã hóa thất bại, tệp gốc sẽ được giữ nguyên. Chế độ này hoạt động tự động và có thể xóa vĩnh viễn các phiên bản cũ.
""",
        .helpOptimizeTooltip: """
Sử dụng thư mục đã nén để cập nhật thư mục gốc sau khi mã hóa với YOLO tắt. Với mỗi tệp tương ứng, nếu phiên bản đã nén nhỏ hơn, nó sẽ thay thế tệp gốc. Các tệp đã nén có kích thước lớn hơn hoặc bằng sẽ bị bỏ qua. Hành động này không thể hoàn tác.
""",

        // Alerts
        .alertYoloTitle: "Cảnh báo: Chế độ YOLO",
        .alertYoloConfirm: "Xác nhận",
        .alertYoloCancel: "Hủy",
        .alertYoloMessage: "Khi chế độ YOLO được bật, tệp gốc của bạn có thể bị GHI ĐÈ và các tệp cũ có thể bị XÓA. Hành động này KHÔNG THỂ HOÀN TÁC. Bạn có chắc chắn muốn tiếp tục không?",
        .alertErrorTitle: "Lỗi",
        .alertErrorOk: "OK",
        .alertErrorUnknown: "Đã xảy ra lỗi không xác định.",
        .alertSettingsLockedTitle: "Không thể thay đổi cài đặt",
        .alertSettingsLockedMessage: "Không thể thay đổi cài đặt trong khi một lô đang chạy. Vui lòng đợi cho đến khi thao tác hiện tại kết thúc.",
        .alertSettingsLockedOk: "OK",

        // Settings & install
        .settingsTitle: "Cài đặt",
        .settingsLanguageSectionTitle: "Ngôn ngữ",
        .settingsLanguageLabel: "Ngôn ngữ ứng dụng",
        .settingsLanguagePickerLabel: "Ngôn ngữ",
        .settingsLanguageDescription: "“System” sẽ sử dụng ngôn ngữ macOS của bạn. Các tùy chọn khác sẽ buộc ứng dụng dùng ngôn ngữ đó khi có bản dịch.",
        .settingsHBPathSectionTitle: "Đường dẫn HandBrakeCLI",
        .settingsHBPathDescription: "Không tìm thấy HandBrakeCLI tại các vị trí mặc định. Nếu bạn đã cài đặt thủ công, hãy cung cấp đường dẫn đầy đủ tới tệp thực thi HandBrakeCLI.",
        .settingsHBPathPlaceholder: "/usr/local/bin/HandBrakeCLI",
        .settingsHBPathInstalled: "Đã cài đặt",
        .settingsHBPathCheck: "Kiểm tra",
        .settingsHBPathError: "Không tìm thấy HandBrakeCLI có thể thực thi tại đường dẫn này.",

        .installHomebrewSectionTitle: "Thiết lập Homebrew",
        .installHomebrewDescription: "Trước tiên hãy cài đặt Homebrew nếu nó chưa có trên hệ thống của bạn:",
        .installHomebrewSnippetTitle: "Cài đặt Homebrew",
        .installHBSectionTitle: "Cài đặt HandBrakeCLI",
        .installHBDescription: "Sau khi cài đặt Homebrew, hãy cài đặt HandBrakeCLI với lệnh:",
        .installHBSnippetTitle: "Cài đặt HandBrakeCLI",
        .installVerificationTitle: "Xác minh",
        .installVerificationDescription: "HandBrake Batch Compressor sẽ tìm HandBrakeCLI tại các đường dẫn mặc định sau:",
        .installVerificationInstalled: "Đã cài đặt",
        .installVerificationCheck: "Kiểm tra cài đặt",
        .installVerificationGoodToGo: "Mọi thứ đã sẵn sàng. HandBrakeCLI đã được cài đặt và sẽ được nhận diện tự động.",
        .installVerificationAutoPick: "Nếu HandBrakeCLI được cài đặt ở một trong các vị trí này, ứng dụng sẽ tự động phát hiện trong lần chạy tiếp theo.",
        .installManualPathHint: "Nếu bạn đã cài đặt HandBrakeCLI thủ công ở vị trí không chuẩn, bạn có thể chỉ định đường dẫn trong phần Cài đặt.",

        // Help/info section subheadings
        .helpAboutSectionTitle: "Giới thiệu",
        .yoloInfoSectionWhatTitle: "Chế độ YOLO làm gì",
        .yoloInfoSectionImportantTitle: "Quan trọng",
        .optimizeInfoSectionWhatTitle: "Lệnh này làm gì",
        .optimizeInfoSectionWhenTitle: "Khi nào nên sử dụng",

        // Help/info body text
        .yoloInfoBodyWhat: """
Khi chế độ YOLO được bật, HandBrake Batch Compressor sẽ so sánh từng tệp vừa được mã hóa \
với tệp gốc và tự động quyết định tệp nào sẽ được giữ lại:

- Nếu tệp được mã hóa nhỏ hơn tệp gốc, tệp gốc sẽ bị xóa và tệp mới được giữ lại.
- Nếu tệp được mã hóa lớn hơn, tệp gốc sẽ được giữ lại và tệp được mã hóa sẽ bị xóa.
- Nếu việc mã hóa thất bại hoặc tệp đầu ra trống, tệp gốc sẽ được giữ lại và tệp đầu ra bị lỗi sẽ bị xóa.
""",
        .yoloInfoBodyImportant: """
Chế độ YOLO hoạt động tự động trong khi lô đang chạy. Tệp gốc có thể bị xóa \
ngay khi có phiên bản đã mã hóa nhỏ hơn. Hành động này không thể hoàn tác, vì vậy hãy đảm bảo \
bạn đã sao lưu hoặc chấp nhận nguy cơ mất tệp gốc trước khi bật chế độ YOLO.
""",
        .optimizeInfoBodyWhat: """
Sau khi mã hóa với chế độ YOLO tắt, HandBrake Batch Compressor sẽ ghi tất cả tệp đã mã hóa \
vào một thư mục nén riêng (ví dụ: `compressedMyVideos`). Thư mục gốc vẫn không thay đổi.

Lệnh “Tối ưu hóa thư mục gốc” sẽ:

- Quét thư mục nén để tìm các tệp đã mã hóa.
- Tìm tệp gốc tương ứng cho mỗi tệp đã mã hóa.
- So sánh kích thước tệp và chỉ thay thế tệp gốc nếu tệp đã mã hóa nhỏ hơn.
- Giữ nguyên tệp gốc nếu tệp đã mã hóa lớn hơn hoặc có cùng kích thước.
""",
        .optimizeInfoBodyWhen: """
Hãy sử dụng lệnh này khi bạn muốn:

- Trước hết kiểm tra chất lượng các tệp đã mã hóa trong thư mục nén.
- Sau đó, khi đã hài lòng, áp dụng các phiên bản nhỏ hơn trở lại thư mục gốc \
  để tiết kiệm dung lượng đĩa mà không cần tự di chuyển tệp.

Thao tác này sẽ thay đổi thư mục gốc và không thể hoàn tác. Hãy chắc chắn rằng bạn hài lòng \
với kết quả trong thư mục nén trước khi chạy lệnh.
""",

        // Error bodies
        .errorNoVideosBody: "Không tìm thấy tệp video nào trong thư mục đã chọn.",
        .errorHandBrakeMissingBodyFormat: """
Không thể tìm thấy HandBrakeCLI tại:

%@

Vui lòng cài đặt Homebrew và HandBrakeCLI.
Nhấp vào nút “How to install HandBrake” ở góc trên bên phải để xem hướng dẫn cài đặt.
""",
        .errorHandBrakeFailedBodyFormat: """
HandBrakeCLI gặp lỗi khi xử lý:

%@ 

Chi tiết: %@
""",

        // Generic buttons
        .buttonCopy: "Sao chép",
        .buttonCopied: "Đã sao chép",

        // Log messages
        .logEncodeCancelled: "Mã hóa đã bị người dùng hủy",
        .logEncodeStartedYoloOn: "---- Bắt đầu mã hóa (YOLO: BẬT) ----",
        .logEncodeStartedYoloOff: "---- Bắt đầu mã hóa (YOLO: TẮT) ----",
        .logSleepAssertionFailedFormat: "Không thể tạo sleep assertion: %d",
        .logFailedToCreateDirectoryFormat: "Không thể tạo thư mục: %@ - %@",
        .logErrorRunningHandBrakeFormat: "❌ Lỗi khi chạy HandBrakeCLI cho %@: %@",
        .logCompressedFolderMissingFormat: "Không tìm thấy thư mục đã nén: %@",
        .logYoloReplacedOriginalFormat: "%@ → Đầu vào: %@, Đầu ra: %@ → thành công, tệp gốc đã xóa",
        .logYoloOriginalDeleteFailedFormat: "Không thể xóa tệp gốc: %@ - %@",
        .logYoloTempMoveFailedFormat: "Không thể di chuyển tệp tạm: %@ → %@ - %@",
        .logYoloSkippedLargerOrEqualFormat: "%@ → Đầu vào: %@, Đầu ra: %@ → bỏ qua (đầu ra ≥ đầu vào)",
        .logYoloEncodeFailedFormat: "%@ → Đầu vào: %@, Đầu ra: 0.0 MB → bỏ qua (mã hóa thất bại)",
        .logYoloFailedOutputDeleteFailedFormat: "Không thể xóa tệp đầu ra bị lỗi: %@ - %@",
        .logOutputDeleteFailedFormat: "Không thể xóa tệp đầu ra: %@ - %@",
        .logEncodeSuccessFormat: "%@ → Đầu vào: %@, Đầu ra: %@ → mã hóa thành công",
        .logEncodeSkippedLargerOrEqualFormat: "%@ → Đầu vào: %@, Đầu ra: %@ → bỏ qua (đầu ra lớn hơn hoặc bằng)",
        .logOptimizeUpdatedFormat: "Tối ưu hóa: %@ → gốc %@, mới %@, đã cập nhật.",
        .logOptimizeErrorFormat: "Tối ưu hóa: %@ → LỖI: %@",
        .logOptimizeUnchangedFormat: "Tối ưu hóa: %@ → gốc %@, mới %@, không thay đổi.",
        .logOptimizeCompletedFormat: "Đã hoàn tất tối ưu hóa: %d tệp được cập nhật, %d tệp không thay đổi.",

        // Menu
        .menuAboutApp: "Giới thiệu HandBrake Batch Compressor"
    ]
}

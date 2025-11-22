//
//  Localization+ChineseSimplified.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

extension LocalizationCatalog {
    /// Chinese (Simplified) translations for all known keys.
    ///
    /// These values are machine-translated and may need review by native speakers,
    /// but they are intended to be clear and user-friendly for a first release.
    static let chineseSimplified: [L10nKey: String] = [
        .appTitle: "HandBrake 批量压缩器",
        .statusReady: "就绪",
        .statusNoVideosFound: "未找到视频文件。",
        .statusHandBrakeMissing: "未找到 HandBrakeCLI",
        .statusCancelled: "已取消 ⛔️",
        .statusCompletedFormat: "已完成 ✅ 已处理 %d 个，已跳过 %d 个（%d 分 %d 秒）",
        .statusSearchingFiles: "正在搜索文件…",
        .statusProcessingFormat: "正在处理：%@",
        .buttonStart: "开始",
        .buttonCancel: "取消",
        .buttonSelectSourceFolder: "选择源文件夹",
        .toggleSaveRunLog: "将运行日志保存到源文件夹",
        .toggleYoloMode: "YOLO 模式（覆盖原始文件）",
        .buttonOptimizeOriginalFolder: "优化原始文件夹",
        .helpAboutTitle: "HandBrake 批量压缩器",
        .helpAboutBody: """
HandBrake 批量压缩器是一款用于配合 HandBrakeCLI 压缩整个视频文件夹的一键式 macOS 工具。

选择一个源文件夹并点击“开始”，应用会遍历所有子文件夹，对支持的视频文件进行编码，并为你跟踪进度。你无需管理复杂的流程或队列。
""",
        .yoloInfoTitle: "YOLO 模式",
        .optimizeInfoTitle: "优化原始文件夹",
        .installHandBrakeTitle: "如何安装 HandBrake",
        .buttonClose: "关闭",

        // General labels and tooltips
        .labelEncoder: "编码器",
        .labelCustomEncoder: "编码器：",
        .labelQuality: "质量：",
        .labelFramerate: "帧率：",
        .labelExtraParams: "额外参数：",
        .placeholderQuality: "质量",
        .placeholderFramerate: "帧率",
        .placeholderExtra: "额外",
        .labelElapsedTimeFormat: "已用时间：%d 分 %d 秒",
        .labelTotalProgressFormat: "总计：%d/%d",
        .labelCurrentFileFormat: "当前：%@",
        .labelStatusPrefix: "状态：",
        .helpInstallTooltip: "Homebrew 与 HandBrakeCLI 的分步安装指南",
        .helpAboutTooltip: "关于和使用说明",
        .helpSettingsTooltip: "设置",
        .helpYoloTooltip: """
YOLO 模式仅在新编码文件更小时才覆盖原始文件。如果新文件更大或编码失败，则保留原始文件。该模式自动运行，旧版本可能会被永久删除。
""",
        .helpOptimizeTooltip: """
在关闭 YOLO 模式进行编码后，使用压缩文件夹更新原始文件夹。对于每个匹配的文件，如果压缩版本更小，则替换原文件；更大或相同大小的压缩文件会被丢弃。此操作无法撤销。
""",

        // Alerts
        .alertYoloTitle: "警告：YOLO 模式",
        .alertYoloConfirm: "确认",
        .alertYoloCancel: "取消",
        .alertYoloMessage: "启用 YOLO 模式时，你的原始文件可能会被覆盖，旧文件可能会被删除。此操作无法撤销。确定要继续吗？",
        .alertErrorTitle: "错误",
        .alertErrorOk: "好",
        .alertErrorUnknown: "发生未知错误。",
        .alertSettingsLockedTitle: "设置不可用",
        .alertSettingsLockedMessage: "运行批处理期间无法更改设置。请等待当前操作完成。",
        .alertSettingsLockedOk: "好",

        // Settings & install
        .settingsTitle: "设置",
        .settingsLanguageSectionTitle: "语言",
        .settingsLanguageLabel: "应用语言",
        .settingsLanguagePickerLabel: "语言",
        .settingsLanguageDescription: "“系统”会跟随你的 macOS 语言。其他选项会在有翻译时强制使用该语言。",
        .settingsHBPathSectionTitle: "HandBrakeCLI 路径",
        .settingsHBPathDescription: "在默认位置未找到 HandBrakeCLI。如果你手动安装，请提供 HandBrakeCLI 可执行文件的完整路径。",
        .settingsHBPathPlaceholder: "/usr/local/bin/HandBrakeCLI",
        .settingsHBPathInstalled: "已安装",
        .settingsHBPathCheck: "检查",
        .settingsHBPathError: "在此路径下未找到可执行的 HandBrakeCLI。",

        .installHomebrewSectionTitle: "Homebrew 设置",
        .installHomebrewDescription: "如果你的系统中尚未安装 Homebrew，请先安装：",
        .installHomebrewSnippetTitle: "安装 Homebrew",
        .installHBSectionTitle: "HandBrakeCLI 安装",
        .installHBDescription: "安装 Homebrew 之后，使用以下命令安装 HandBrakeCLI：",
        .installHBSnippetTitle: "安装 HandBrakeCLI",
        .installVerificationTitle: "验证",
        .installVerificationDescription: "HandBrake 批量压缩器会在以下默认路径中查找 HandBrakeCLI：",
        .installVerificationInstalled: "已安装",
        .installVerificationCheck: "检查安装",
        .installVerificationGoodToGo: "一切就绪。HandBrakeCLI 已安装，应用会自动识别。",
        .installVerificationAutoPick: "如果 HandBrakeCLI 安装在这些位置之一，应用会在下一次运行时自动找到它。",
        .installManualPathHint: "如果你将 HandBrakeCLI 手动安装在非标准位置，可以在“设置”中指定它。",

        // Help/info section subheadings
        .helpAboutSectionTitle: "关于",
        .yoloInfoSectionWhatTitle: "YOLO 模式的作用",
        .yoloInfoSectionImportantTitle: "重要信息",
        .optimizeInfoSectionWhatTitle: "此命令的作用",
        .optimizeInfoSectionWhenTitle: "何时使用",

        // Help/info body text
        .yoloInfoBodyWhat: """
当启用 YOLO 模式时，HandBrake 批量压缩器会将每个新编码文件 \
与其原始文件进行比较，并自动决定保留哪一个：

- 如果编码后的文件比原始文件小，则删除原始文件并保留新文件。
- 如果编码后的文件更大，则保留原始文件并删除编码文件。
- 如果编码失败或输出文件为空，则保留原始文件并删除失败的输出。
""",
        .yoloInfoBodyImportant: """
YOLO 模式在批处理运行期间会自动工作。一旦有更小的编码版本可用，原始文件可能会被删除。此操作无法撤销，因此在启用 YOLO 模式之前，请确保你有备份或已经准备好放弃原始文件。
""",
        .optimizeInfoBodyWhat: """
在关闭 YOLO 模式进行编码后，HandBrake 批量压缩器会将所有编码后的文件写入一个单独的压缩文件夹（例如：`compressedMyVideos`）。原始文件夹保持不变。

“优化原始文件夹”命令将：

- 扫描压缩文件夹中的编码文件。
- 为每个编码文件找到匹配的原始文件。
- 比较文件大小，仅在编码文件更小时替换原始文件。
- 当编码文件更大或大小相同时，保留原始文件不变。
""",
        .optimizeInfoBodyWhen: """
当你希望：

- 先在压缩文件夹中检查编码文件的质量。
- 然后在满意之后，将较小的版本应用回原始文件夹，以在无需手动移动文件的情况下节省磁盘空间时，请使用此命令。

此操作会修改你的原始文件夹且无法撤销。在运行该命令之前，请确保你对压缩文件夹中的结果感到满意。
""",

        // Error bodies
        .errorNoVideosBody: "在所选文件夹中未找到视频文件。",
        .errorHandBrakeMissingBodyFormat: """
在以下位置未找到 HandBrakeCLI：

%@

请安装 Homebrew 和 HandBrakeCLI。
点击右上角的“如何安装 HandBrake”按钮查看安装说明。
""",
        .errorHandBrakeFailedBodyFormat: """
HandBrakeCLI 在处理时失败：

%@ 

详细信息：%@
""",

        // Generic buttons
        .buttonCopy: "复制",
        .buttonCopied: "已复制",

        // Log messages
        .logEncodeCancelled: "编码已被用户取消",
        .logEncodeStartedYoloOn: "---- 已开始编码（YOLO：开启） ----",
        .logEncodeStartedYoloOff: "---- 已开始编码（YOLO：关闭） ----",
        .logSleepAssertionFailedFormat: "无法创建防休眠断言：%d",
        .logFailedToCreateDirectoryFormat: "无法创建目录：%@ - %@",
        .logErrorRunningHandBrakeFormat: "❌ 运行 HandBrakeCLI 时出错：%@：%@",
        .logCompressedFolderMissingFormat: "未找到压缩文件夹：%@",
        .logYoloReplacedOriginalFormat: "%@ → 输入：%@，输出：%@ → 成功，原文件已删除",
        .logYoloOriginalDeleteFailedFormat: "无法删除原始文件：%@ - %@",
        .logYoloTempMoveFailedFormat: "无法移动临时文件：%@ → %@ - %@",
        .logYoloSkippedLargerOrEqualFormat: "%@ → 输入：%@，输出：%@ → 已跳过（输出 ≥ 输入）",
        .logYoloEncodeFailedFormat: "%@ → 输入：%@，输出：0.0 MB → 已跳过（编码失败）",
        .logYoloFailedOutputDeleteFailedFormat: "无法删除失败的输出文件：%@ - %@",
        .logOutputDeleteFailedFormat: "无法删除输出文件：%@ - %@",
        .logEncodeSuccessFormat: "%@ → 输入：%@，输出：%@ → 编码成功",
        .logEncodeSkippedLargerOrEqualFormat: "%@ → 输入：%@，输出：%@ → 已跳过（输出大于或等于原始文件）",
        .logOptimizeUpdatedFormat: "优化：%@ → 原始 %@，新 %@，已更新。",
        .logOptimizeErrorFormat: "优化：%@ → 错误：%@",
        .logOptimizeUnchangedFormat: "优化：%@ → 原始 %@，新 %@，未更改。",
        .logOptimizeCompletedFormat: "优化完成：已更新 %d 个文件，%d 个未更改。",

        // Menu
        .menuAboutApp: "关于 HandBrake 批量压缩器"
    ]
}

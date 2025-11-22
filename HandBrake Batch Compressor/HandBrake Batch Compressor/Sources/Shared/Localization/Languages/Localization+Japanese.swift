//
//  Localization+Japanese.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

extension LocalizationCatalog {
    /// Japanese translations for all known keys.
    ///
    /// These values are machine-translated and may need review by native speakers,
    /// but they are intended to be clear and user-friendly for a first release.
    static let japanese: [L10nKey: String] = [
        .appTitle: "HandBrake バッチコンプレッサー",
        .statusReady: "準備完了",
        .statusNoVideosFound: "動画ファイルが見つかりませんでした。",
        .statusHandBrakeMissing: "HandBrakeCLI が見つかりません",
        .statusCancelled: "キャンセルされました ⛔️",
        .statusCompletedFormat: "完了 ✅ %d 件処理、%d 件スキップ（%d分 %d秒）",
        .statusSearchingFiles: "ファイルを検索中…",
        .statusProcessingFormat: "処理中: %@",
        .buttonStart: "開始",
        .buttonCancel: "キャンセル",
        .buttonSelectSourceFolder: "ソースフォルダを選択",
        .toggleSaveRunLog: "実行ログファイルをソースフォルダに保存する",
        .toggleYoloMode: "YOLO モード（元のファイルを上書き）",
        .buttonOptimizeOriginalFolder: "元のフォルダを最適化",
        .helpAboutTitle: "HandBrake バッチコンプレッサー",
        .helpAboutBody: """
HandBrake バッチコンプレッサーは、HandBrakeCLI を使って動画フォルダ全体を一括圧縮するための、ワンクリック macOS ユーティリティです。

ソースフォルダを選択して「開始」を押すだけで、アプリがすべての入れ子になったサブフォルダを走査し、サポートされている動画ファイルをエンコードしながら進捗を表示します。複雑なワークフローやキューを管理する必要はありません。
""",
        .yoloInfoTitle: "YOLO モード",
        .optimizeInfoTitle: "元のフォルダを最適化",
        .installHandBrakeTitle: "HandBrake のインストール方法",
        .buttonClose: "閉じる",

        // General labels and tooltips
        .labelEncoder: "エンコーダ",
        .labelCustomEncoder: "エンコーダ:",
        .labelQuality: "品質:",
        .labelFramerate: "フレームレート:",
        .labelExtraParams: "追加パラメータ:",
        .placeholderQuality: "品質",
        .placeholderFramerate: "フレームレート",
        .placeholderExtra: "追加",
        .labelElapsedTimeFormat: "経過時間: %d分 %d秒",
        .labelTotalProgressFormat: "合計: %d/%d",
        .labelCurrentFileFormat: "現在: %@",
        .labelStatusPrefix: "ステータス:",
        .helpInstallTooltip: "Homebrew と HandBrakeCLI をインストールするためのステップバイステップガイド",
        .helpAboutTooltip: "アプリについてと使い方のヘルプ",
        .helpSettingsTooltip: "設定",
        .helpYoloTooltip: """
YOLO モードは、新しくエンコードされたファイルが元のファイルより小さい場合にのみ元のファイルを上書きします。新しいファイルが大きい場合やエンコードに失敗した場合は、元のファイルが保持されます。このモードは自動で動作し、古いバージョンが完全に削除されることがあります。
""",
        .helpOptimizeTooltip: """
YOLO を無効にしてエンコードした後、圧縮フォルダを使って元のフォルダを更新します。一致する各ファイルについて、圧縮版が小さい場合にのみ元のファイルを置き換えます。サイズが同じか大きい圧縮ファイルは破棄されます。この操作は元に戻せません。
""",

        // Alerts
        .alertYoloTitle: "警告: YOLO モード",
        .alertYoloConfirm: "確認",
        .alertYoloCancel: "キャンセル",
        .alertYoloMessage: "YOLO モードが有効な場合、元のファイルが上書きされ、古いファイルが削除されることがあります。この操作は取り消すことができません。本当に続行しますか？",
        .alertErrorTitle: "エラー",
        .alertErrorOk: "OK",
        .alertErrorUnknown: "不明なエラーが発生しました。",
        .alertSettingsLockedTitle: "設定は使用できません",
        .alertSettingsLockedMessage: "バッチ処理の実行中は設定を変更できません。現在の処理が終了するまでお待ちください。",
        .alertSettingsLockedOk: "OK",

        // Settings & install
        .settingsTitle: "設定",
        .settingsLanguageSectionTitle: "言語",
        .settingsLanguageLabel: "アプリの言語",
        .settingsLanguagePickerLabel: "言語",
        .settingsLanguageDescription: "「System」は macOS の言語設定に従います。その他のオプションは、翻訳が利用可能な場合にアプリをその言語で強制的に表示します。",
        .settingsHBPathSectionTitle: "HandBrakeCLI のパス",
        .settingsHBPathDescription: "デフォルトの場所に HandBrakeCLI が見つかりませんでした。手動でインストールした場合は、HandBrakeCLI バイナリへのフルパスを指定してください。",
        .settingsHBPathPlaceholder: "/usr/local/bin/HandBrakeCLI",
        .settingsHBPathInstalled: "インストール済み",
        .settingsHBPathCheck: "確認",
        .settingsHBPathError: "このパスには実行可能な HandBrakeCLI が見つかりませんでした。",

        .installHomebrewSectionTitle: "Homebrew セットアップ",
        .installHomebrewDescription: "システムに Homebrew がまだインストールされていない場合は、まず Homebrew をインストールしてください:",
        .installHomebrewSnippetTitle: "Homebrew をインストール",
        .installHBSectionTitle: "HandBrakeCLI のインストール",
        .installHBDescription: "Homebrew のインストール後、次のコマンドで HandBrakeCLI をインストールします:",
        .installHBSnippetTitle: "HandBrakeCLI をインストール",
        .installVerificationTitle: "検証",
        .installVerificationDescription: "HandBrake バッチコンプレッサーは、次のデフォルトパスで HandBrakeCLI を探します:",
        .installVerificationInstalled: "インストール済み",
        .installVerificationCheck: "インストールを確認",
        .installVerificationGoodToGo: "準備完了です。HandBrakeCLI はインストールされており、自動的に検出されます。",
        .installVerificationAutoPick: "HandBrakeCLI がこれらの場所のいずれかにインストールされている場合、次回の実行時にアプリが自動的に検出します。",
        .installManualPathHint: "HandBrakeCLI を標準外の場所に手動でインストールした場合は、設定からそのパスを指定できます。",

        // Help/info section subheadings
        .helpAboutSectionTitle: "概要",
        .yoloInfoSectionWhatTitle: "YOLO モードの動作",
        .yoloInfoSectionImportantTitle: "重要",
        .optimizeInfoSectionWhatTitle: "このコマンドの動作",
        .optimizeInfoSectionWhenTitle: "使用するタイミング",

        // Help/info body text
        .yoloInfoBodyWhat: """
YOLO モードを有効にすると、HandBrake バッチコンプレッサーは各新規エンコードファイルを \
元のファイルと比較し、どちらを保持するか自動的に判断します:

- エンコードされたファイルが元のファイルより小さい場合、元のファイルは削除され、新しいファイルが保持されます。
- エンコードされたファイルが大きい場合、元のファイルが保持され、エンコードされたファイルは削除されます。
- エンコードに失敗した場合や出力ファイルが空の場合、元のファイルが保持され、失敗した出力は削除されます。
""",
        .yoloInfoBodyImportant: """
YOLO モードはバッチ処理中に自動的に動作します。より小さいエンコード版が利用可能になると、元のファイルはすぐに削除される可能性があります。この操作は元に戻せないため、YOLO モードを有効にする前にバックアップを用意するか、元のファイルを失っても問題ないことを確認してください。
""",
        .optimizeInfoBodyWhat: """
YOLO モードを無効にしてエンコードした後、HandBrake バッチコンプレッサーはすべてのエンコード済みファイルを \
別の圧縮フォルダ（例: `compressedMyVideos`）に書き込みます。元のフォルダは変更されません。

「元のフォルダを最適化」コマンドは次のことを行います:

- 圧縮フォルダ内のエンコード済みファイルをスキャンします。
- 各エンコード済みファイルに対応する元のファイルを見つけます。
- ファイルサイズを比較し、エンコード済みファイルが小さい場合にのみ元のファイルを置き換えます。
- エンコード済みファイルが大きい場合や同じサイズの場合は、元のファイルを変更しません。
""",
        .optimizeInfoBodyWhen: """
次のような場合にこのコマンドを使用してください:

- まず圧縮フォルダ内のエンコード済みファイルの品質を確認したいとき。
- その後、結果に満足したら、手動でファイルを移動することなく、より小さいバージョンを元のフォルダに適用してディスク容量を節約したいとき。

この操作は元のフォルダの内容を変更し、元に戻すことはできません。実行する前に、圧縮フォルダ内の結果に満足していることを確認してください。
""",

        // Error bodies
        .errorNoVideosBody: "選択したフォルダ内に動画ファイルは見つかりませんでした。",
        .errorHandBrakeMissingBodyFormat: """
HandBrakeCLI は次の場所で見つかりませんでした:

%@

Homebrew と HandBrakeCLI をインストールしてください。
インストール手順を表示するには、右上の「How to install HandBrake」ボタンをクリックしてください。
""",
        .errorHandBrakeFailedBodyFormat: """
HandBrakeCLI の処理中にエラーが発生しました:

%@ 

詳細: %@
""",

        // Generic buttons
        .buttonCopy: "コピー",
        .buttonCopied: "コピーしました",

        // Log messages
        .logEncodeCancelled: "エンコードはユーザーによりキャンセルされました",
        .logEncodeStartedYoloOn: "---- エンコード開始 (YOLO: ON) ----",
        .logEncodeStartedYoloOff: "---- エンコード開始 (YOLO: OFF) ----",
        .logSleepAssertionFailedFormat: "スリープ抑止アサーションの作成に失敗しました: %d",
        .logFailedToCreateDirectoryFormat: "ディレクトリの作成に失敗しました: %@ - %@",
        .logErrorRunningHandBrakeFormat: "❌ HandBrakeCLI 実行時のエラー %@: %@",
        .logCompressedFolderMissingFormat: "圧縮フォルダが見つかりません: %@",
        .logYoloReplacedOriginalFormat: "%@ → 入力: %@, 出力: %@ → 成功、元のファイルを削除しました",
        .logYoloOriginalDeleteFailedFormat: "元のファイルを削除できませんでした: %@ - %@",
        .logYoloTempMoveFailedFormat: "一時ファイルを移動できませんでした: %@ → %@ - %@",
        .logYoloSkippedLargerOrEqualFormat: "%@ → 入力: %@, 出力: %@ → スキップ（出力 ≥ 入力）",
        .logYoloEncodeFailedFormat: "%@ → 入力: %@, 出力: 0.0 MB → スキップ（エンコード失敗）",
        .logYoloFailedOutputDeleteFailedFormat: "失敗した出力ファイルを削除できませんでした: %@ - %@",
        .logOutputDeleteFailedFormat: "出力ファイルを削除できませんでした: %@ - %@",
        .logEncodeSuccessFormat: "%@ → 入力: %@, 出力: %@ → エンコード成功",
        .logEncodeSkippedLargerOrEqualFormat: "%@ → 入力: %@, 出力: %@ → スキップ（出力が同じか大きい）",
        .logOptimizeUpdatedFormat: "最適化: %@ → 元 %@, 新 %@, 更新済み。",
        .logOptimizeErrorFormat: "最適化: %@ → エラー: %@",
        .logOptimizeUnchangedFormat: "最適化: %@ → 元 %@, 新 %@, 変更なし。",
        .logOptimizeCompletedFormat: "最適化完了: %d 件のファイルを更新、%d 件は変更なし。",

        // Menu
        .menuAboutApp: "HandBrake Batch Compressor について"
    ]
}

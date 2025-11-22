//
//  Localization+Korean.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

extension LocalizationCatalog {
    /// Korean translations for all known keys.
    ///
    /// These values are machine-translated and may need review by native speakers,
    /// but they are intended to be clear and user-friendly for a first release.
    static let korean: [L10nKey: String] = [
        .appTitle: "HandBrake 배치 압축기",
        .statusReady: "준비 완료",
        .statusNoVideosFound: "동영상 파일을 찾을 수 없습니다.",
        .statusHandBrakeMissing: "HandBrakeCLI를 찾을 수 없습니다",
        .statusCancelled: "취소됨 ⛔️",
        .statusCompletedFormat: "완료 ✅ %d개 처리, %d개 건너뜀 (%d분 %d초)",
        .statusSearchingFiles: "파일 검색 중…",
        .statusProcessingFormat: "처리 중: %@",
        .buttonStart: "시작",
        .buttonCancel: "취소",
        .buttonSelectSourceFolder: "소스 폴더 선택",
        .toggleSaveRunLog: "실행 로그 파일을 소스 폴더에 저장",
        .toggleYoloMode: "YOLO 모드 (원본 파일 덮어쓰기)",
        .buttonOptimizeOriginalFolder: "원본 폴더 최적화",
        .helpAboutTitle: "HandBrake 배치 압축기",
        .helpAboutBody: """
HandBrake 배치 압축기는 HandBrakeCLI를 사용하여 전체 동영상 폴더를 한 번에 압축하는 원클릭 macOS 유틸리티입니다.

소스 폴더를 선택하고 ‘Start’를 누르면, 앱이 모든 하위 폴더를 순회하면서 지원되는 동영상 파일을 인코딩하고 진행 상황을 표시합니다. 복잡한 워크플로우나 큐를 직접 관리할 필요가 없습니다.
""",
        .yoloInfoTitle: "YOLO 모드",
        .optimizeInfoTitle: "원본 폴더 최적화",
        .installHandBrakeTitle: "HandBrake 설치 방법",
        .buttonClose: "닫기",

        // General labels and tooltips
        .labelEncoder: "인코더",
        .labelCustomEncoder: "인코더:",
        .labelQuality: "품질:",
        .labelFramerate: "프레임레이트:",
        .labelExtraParams: "추가 파라미터:",
        .placeholderQuality: "품질",
        .placeholderFramerate: "프레임레이트",
        .placeholderExtra: "추가",
        .labelElapsedTimeFormat: "경과 시간: %d분 %d초",
        .labelTotalProgressFormat: "전체: %d/%d",
        .labelCurrentFileFormat: "현재: %@",
        .labelStatusPrefix: "상태:",
        .helpInstallTooltip: "Homebrew 및 HandBrakeCLI 설치를 위한 단계별 안내",
        .helpAboutTooltip: "앱 정보 및 사용 도움말",
        .helpSettingsTooltip: "설정",
        .helpYoloTooltip: """
YOLO 모드는 새로 인코딩된 파일이 원본보다 작을 때만 원본 파일을 덮어씁니다. 새 파일이 더 크거나 인코딩이 실패하면 원본 파일이 유지됩니다. 이 모드는 자동으로 동작하며, 오래된 버전이 영구적으로 삭제될 수 있습니다.
""",
        .helpOptimizeTooltip: """
YOLO를 끄고 인코딩한 후, 압축 폴더를 사용해 원본 폴더를 업데이트합니다. 각 일치하는 파일에 대해 압축된 버전이 더 작으면 원본 파일을 교체합니다. 크기가 같거나 더 큰 압축 파일은 건너뜁니다. 이 작업은 되돌릴 수 없습니다.
""",

        // Alerts
        .alertYoloTitle: "경고: YOLO 모드",
        .alertYoloConfirm: "확인",
        .alertYoloCancel: "취소",
        .alertYoloMessage: "YOLO 모드가 활성화되면 원본 파일이 덮어쓰기되거나 오래된 파일이 삭제될 수 있습니다. 이 작업은 되돌릴 수 없습니다. 정말 계속하시겠습니까?",
        .alertErrorTitle: "오류",
        .alertErrorOk: "확인",
        .alertErrorUnknown: "알 수 없는 오류가 발생했습니다.",
        .alertSettingsLockedTitle: "설정을 사용할 수 없습니다",
        .alertSettingsLockedMessage: "배치 작업이 실행 중일 때는 설정을 변경할 수 없습니다. 현재 작업이 완료될 때까지 기다려 주세요.",
        .alertSettingsLockedOk: "확인",

        // Settings & install
        .settingsTitle: "설정",
        .settingsLanguageSectionTitle: "언어",
        .settingsLanguageLabel: "앱 언어",
        .settingsLanguagePickerLabel: "언어",
        .settingsLanguageDescription: "“System”은 macOS 시스템 언어를 따릅니다. 다른 옵션은 번역이 제공되는 경우 앱을 해당 언어로 강제 표시합니다.",
        .settingsHBPathSectionTitle: "HandBrakeCLI 경로",
        .settingsHBPathDescription: "기본 위치에서 HandBrakeCLI를 찾을 수 없습니다. 수동으로 설치했다면 HandBrakeCLI 바이너리의 전체 경로를 입력하세요.",
        .settingsHBPathPlaceholder: "/usr/local/bin/HandBrakeCLI",
        .settingsHBPathInstalled: "설치됨",
        .settingsHBPathCheck: "확인",
        .settingsHBPathError: "이 경로에서 실행 가능한 HandBrakeCLI를 찾을 수 없습니다.",

        .installHomebrewSectionTitle: "Homebrew 설정",
        .installHomebrewDescription: "시스템에 Homebrew가 아직 설치되어 있지 않다면 먼저 Homebrew를 설치하세요:",
        .installHomebrewSnippetTitle: "Homebrew 설치",
        .installHBSectionTitle: "HandBrakeCLI 설치",
        .installHBDescription: "Homebrew 설치 후 다음 명령으로 HandBrakeCLI를 설치하세요:",
        .installHBSnippetTitle: "HandBrakeCLI 설치",
        .installVerificationTitle: "확인",
        .installVerificationDescription: "HandBrake Batch Compressor는 다음 기본 경로에서 HandBrakeCLI를 찾습니다:",
        .installVerificationInstalled: "설치됨",
        .installVerificationCheck: "설치 확인",
        .installVerificationGoodToGo: "모든 준비가 완료되었습니다. HandBrakeCLI가 설치되어 있으며 자동으로 인식됩니다.",
        .installVerificationAutoPick: "HandBrakeCLI가 이 위치 중 하나에 설치되어 있으면, 앱이 다음 실행 시 자동으로 이를 감지합니다.",
        .installManualPathHint: "HandBrakeCLI를 비표준 위치에 수동으로 설치했다면, 설정에서 해당 경로를 지정할 수 있습니다.",

        // Help/info section subheadings
        .helpAboutSectionTitle: "정보",
        .yoloInfoSectionWhatTitle: "YOLO 모드의 동작",
        .yoloInfoSectionImportantTitle: "중요",
        .optimizeInfoSectionWhatTitle: "이 명령이 하는 작업",
        .optimizeInfoSectionWhenTitle: "언제 사용해야 하는지",

        // Help/info body text
        .yoloInfoBodyWhat: """
YOLO 모드를 활성화하면 HandBrake 배치 압축기는 새로 인코딩된 각 파일을 \
원본 파일과 비교하여 어떤 파일을 유지할지 자동으로 결정합니다:

- 인코딩된 파일이 원본보다 작으면 원본 파일을 삭제하고 새 파일을 유지합니다.
- 인코딩된 파일이 더 크면 원본 파일을 유지하고 인코딩된 파일을 삭제합니다.
- 인코딩이 실패하거나 출력 파일이 비어 있으면 원본 파일을 유지하고 실패한 출력 파일을 삭제합니다.
""",
        .yoloInfoBodyImportant: """
YOLO 모드는 배치 작업이 실행되는 동안 자동으로 동작합니다. 더 작은 인코딩 버전이 생성되는 즉시 \
원본 파일이 삭제될 수 있습니다. 이 작업은 되돌릴 수 없으므로, YOLO 모드를 활성화하기 전에 \
반드시 백업을 준비했거나 원본 파일을 잃어도 괜찮은지 확인하세요.
""",
        .optimizeInfoBodyWhat: """
YOLO 모드를 끈 상태에서 인코딩한 후 HandBrake 배치 압축기는 모든 인코딩된 파일을 \
별도의 압축 폴더(예: `compressedMyVideos`)에 기록합니다. 원본 폴더는 변경되지 않습니다.

“원본 폴더 최적화” 명령은 다음을 수행합니다:

- 압축 폴더에서 인코딩된 파일을 스캔합니다.
- 각 인코딩된 파일에 대해 대응하는 원본 파일을 찾습니다.
- 파일 크기를 비교하여, 인코딩된 파일이 더 작을 때에만 원본 파일을 교체합니다.
- 인코딩된 파일이 더 크거나 같은 크기인 경우 원본 파일을 그대로 둡니다.
""",
        .optimizeInfoBodyWhen: """
다음과 같은 경우 이 명령을 사용하세요:

- 먼저 압축 폴더에서 인코딩된 파일의 품질을 확인하고 싶을 때.
- 그리고 결과에 만족하면, 파일을 수동으로 옮기지 않고도 더 작은 버전을 원본 폴더에 적용해 \
  디스크 공간을 절약하고 싶을 때.

이 작업은 원본 폴더의 내용을 변경하며 되돌릴 수 없습니다. 실행하기 전에 반드시 \
압축 폴더의 결과에 만족하는지 확인하세요.
""",

        // Error bodies
        .errorNoVideosBody: "선택한 폴더에서 동영상 파일을 찾을 수 없습니다.",
        .errorHandBrakeMissingBodyFormat: """
다음 위치에서 HandBrakeCLI를 찾을 수 없습니다:

%@

Homebrew와 HandBrakeCLI를 설치해 주세요.
설치 방법을 보려면 오른쪽 상단의 “How to install HandBrake” 버튼을 클릭하세요.
""",
        .errorHandBrakeFailedBodyFormat: """
다음을 처리하는 동안 HandBrakeCLI가 실패했습니다:

%@ 

세부 정보: %@
""",

        // Generic buttons
        .buttonCopy: "복사",
        .buttonCopied: "복사됨",

        // Log messages
        .logEncodeCancelled: "인코딩이 사용자에 의해 취소되었습니다",
        .logEncodeStartedYoloOn: "---- 인코딩 시작 (YOLO: ON) ----",
        .logEncodeStartedYoloOff: "---- 인코딩 시작 (YOLO: OFF) ----",
        .logSleepAssertionFailedFormat: "슬립 억제 어서션 생성에 실패했습니다: %d",
        .logFailedToCreateDirectoryFormat: "디렉터리 생성에 실패했습니다: %@ - %@",
        .logErrorRunningHandBrakeFormat: "❌ HandBrakeCLI 실행 오류 %@: %@",
        .logCompressedFolderMissingFormat: "압축 폴더를 찾을 수 없습니다: %@",
        .logYoloReplacedOriginalFormat: "%@ → 입력: %@, 출력: %@ → 성공, 원본 삭제됨",
        .logYoloOriginalDeleteFailedFormat: "원본 파일을 삭제하지 못했습니다: %@ - %@",
        .logYoloTempMoveFailedFormat: "임시 파일을 이동하지 못했습니다: %@ → %@ - %@",
        .logYoloSkippedLargerOrEqualFormat: "%@ → 입력: %@, 출력: %@ → 건너뜀 (출력 ≥ 입력)",
        .logYoloEncodeFailedFormat: "%@ → 입력: %@, 출력: 0.0 MB → 건너뜀 (인코딩 실패)",
        .logYoloFailedOutputDeleteFailedFormat: "실패한 출력 파일을 삭제하지 못했습니다: %@ - %@",
        .logOutputDeleteFailedFormat: "출력 파일을 삭제하지 못했습니다: %@ - %@",
        .logEncodeSuccessFormat: "%@ → 입력: %@, 출력: %@ → 인코딩 성공",
        .logEncodeSkippedLargerOrEqualFormat: "%@ → 입력: %@, 출력: %@ → 건너뜀 (출력이 더 크거나 같음)",
        .logOptimizeUpdatedFormat: "최적화: %@ → 원본 %@, 새 %@, 업데이트됨.",
        .logOptimizeErrorFormat: "최적화: %@ → 오류: %@",
        .logOptimizeUnchangedFormat: "최적화: %@ → 원본 %@, 새 %@, 변경 없음.",
        .logOptimizeCompletedFormat: "최적화 완료: %d개 파일 업데이트, %d개 파일 변경 없음.",

        // Menu
        .menuAboutApp: "HandBrake Batch Compressor 정보"
    ]
}

//
//  Localization+Russian.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

extension LocalizationCatalog {
    /// Russian translations for all known keys.
    ///
    /// These values are machine-translated and may need review by native speakers,
    /// but they are intended to be clear and user-friendly for a first release.
    static let russian: [L10nKey: String] = [
        .appTitle: "Пакетный компрессор HandBrake",
        .statusReady: "Готово",
        .statusNoVideosFound: "Видео‑файлы не найдены.",
        .statusHandBrakeMissing: "HandBrakeCLI не найден",
        .statusCancelled: "Отменено ⛔️",
        .statusCompletedFormat: "Завершено ✅ обработано: %d, пропущено: %d (%dм %dс)",
        .statusSearchingFiles: "Поиск файлов…",
        .statusProcessingFormat: "Обработка: %@",
        .buttonStart: "Старт",
        .buttonCancel: "Отмена",
        .buttonSelectSourceFolder: "Выбрать исходную папку",
        .toggleSaveRunLog: "Сохранять файл лога в исходной папке",
        .toggleYoloMode: "Режим YOLO (перезаписывать исходные файлы)",
        .buttonOptimizeOriginalFolder: "Оптимизировать исходную папку",
        .helpAboutTitle: "Пакетный компрессор HandBrake",
        .helpAboutBody: """
Пакетный компрессор HandBrake — это однокликовая утилита для macOS, которая сжимает целые папки с видео с помощью HandBrakeCLI.

Выберите исходную папку и нажмите «Start» — приложение обходит все вложенные подпапки, кодирует поддерживаемые видео‑файлы и показывает прогресс. Не нужно настраивать сложные сценарии или управлять очередями.
""",
        .yoloInfoTitle: "Режим YOLO",
        .optimizeInfoTitle: "Оптимизировать исходную папку",
        .installHandBrakeTitle: "Как установить HandBrake",
        .buttonClose: "Закрыть",

        // General labels and tooltips
        .labelEncoder: "Кодировщик",
        .labelCustomEncoder: "Кодировщик:",
        .labelQuality: "Качество:",
        .labelFramerate: "Частота кадров:",
        .labelExtraParams: "Дополнительные параметры:",
        .placeholderQuality: "Качество",
        .placeholderFramerate: "Частота кадров",
        .placeholderExtra: "Дополнительно",
        .labelElapsedTimeFormat: "Прошло времени: %dм %dс",
        .labelTotalProgressFormat: "Всего: %d/%d",
        .labelCurrentFileFormat: "Текущий: %@",
        .labelStatusPrefix: "Статус:",
        .helpInstallTooltip: "Пошаговая инструкция по установке Homebrew и HandBrakeCLI",
        .helpAboutTooltip: "Информация о приложении и справка по использованию",
        .helpSettingsTooltip: "Настройки",
        .helpYoloTooltip: """
Режим YOLO перезаписывает исходные файлы только в том случае, если новый закодированный файл меньше. Если новый файл больше или кодирование завершается с ошибкой, исходный файл сохраняется. Режим работает автоматически, и старые версии могут быть удалены без возможности восстановления.
""",
        .helpOptimizeTooltip: """
Использует сжатую папку для обновления исходной папки после кодирования с отключенным режимом YOLO. Для каждого совпадающего файла, если сжатая версия меньше, она заменяет исходный файл. Более крупные или равные по размеру сжатые файлы отбрасываются. Это действие нельзя отменить.
""",

        // Alerts
        .alertYoloTitle: "Предупреждение: режим YOLO",
        .alertYoloConfirm: "Подтвердить",
        .alertYoloCancel: "Отмена",
        .alertYoloMessage: "Когда режим YOLO включен, ваши исходные файлы могут быть ПЕРЕЗАПИСАНЫ, а старые файлы — УДАЛЕНЫ. Это действие НЕ МОЖНО ОТМЕНИТЬ. Вы уверены, что хотите продолжить?",
        .alertErrorTitle: "Ошибка",
        .alertErrorOk: "OK",
        .alertErrorUnknown: "Произошла неизвестная ошибка.",
        .alertSettingsLockedTitle: "Настройки недоступны",
        .alertSettingsLockedMessage: "Нельзя изменять настройки во время выполнения пакетной обработки. Дождитесь завершения текущей операции.",
        .alertSettingsLockedOk: "OK",

        // Settings & install
        .settingsTitle: "Настройки",
        .settingsLanguageSectionTitle: "Язык",
        .settingsLanguageLabel: "Язык приложения",
        .settingsLanguagePickerLabel: "Язык",
        .settingsLanguageDescription: "«System» следует языку macOS. Другие варианты принудительно используют выбранный язык, если для него есть переводы.",
        .settingsHBPathSectionTitle: "Путь к HandBrakeCLI",
        .settingsHBPathDescription: "HandBrakeCLI не был найден в стандартных путях. Если вы установили его вручную, укажите полный путь к исполняемому файлу HandBrakeCLI.",
        .settingsHBPathPlaceholder: "/usr/local/bin/HandBrakeCLI",
        .settingsHBPathInstalled: "Установлено",
        .settingsHBPathCheck: "Проверить",
        .settingsHBPathError: "Исполняемый файл HandBrakeCLI по этому пути не найден.",

        .installHomebrewSectionTitle: "Настройка Homebrew",
        .installHomebrewDescription: "Сначала установите Homebrew, если он ещё не установлен в системе:",
        .installHomebrewSnippetTitle: "Установить Homebrew",
        .installHBSectionTitle: "Установка HandBrakeCLI",
        .installHBDescription: "После установки Homebrew установите HandBrakeCLI с помощью команды:",
        .installHBSnippetTitle: "Установить HandBrakeCLI",
        .installVerificationTitle: "Проверка",
        .installVerificationDescription: "Пакетный компрессор HandBrake ищет HandBrakeCLI по следующим стандартным путям:",
        .installVerificationInstalled: "Установлено",
        .installVerificationCheck: "Проверить установку",
        .installVerificationGoodToGo: "Всё готово. HandBrakeCLI установлен и будет автоматически обнаружен.",
        .installVerificationAutoPick: "Если HandBrakeCLI установлен в одном из этих мест, приложение автоматически найдёт его при следующем запуске.",
        .installManualPathHint: "Если вы установили HandBrakeCLI вручную в нестандартное место, вы можете указать путь к нему в Настройках.",

        // Help/info section subheadings
        .helpAboutSectionTitle: "О программе",
        .yoloInfoSectionWhatTitle: "Что делает режим YOLO",
        .yoloInfoSectionImportantTitle: "Важно",
        .optimizeInfoSectionWhatTitle: "Что делает эта команда",
        .optimizeInfoSectionWhenTitle: "Когда её использовать",

        // Help/info body text
        .yoloInfoBodyWhat: """
Когда режим YOLO включён, Пакетный компрессор HandBrake сравнивает каждый новый закодированный файл \
с его исходной версией и автоматически решает, какой файл сохранить:

- Если закодированный файл меньше исходного, исходный файл удаляется, а новый сохраняется.
- Если закодированный файл больше, сохраняется исходный файл, а закодированный удаляется.
- Если кодирование завершается с ошибкой или выходной файл пустой, исходный файл сохраняется, а неудачный результат удаляется.
""",
        .yoloInfoBodyImportant: """
Режим YOLO работает автоматически во время выполнения пакетной обработки. Исходные файлы могут быть удалены \
сразу после появления более компактной закодированной версии. Это действие нельзя отменить, поэтому убедитесь, \
что у вас есть резервные копии или вы готовы к потере исходных файлов перед включением режима YOLO.
""",
        .optimizeInfoBodyWhat: """
После кодирования с отключённым режимом YOLO Пакетный компрессор HandBrake записывает все закодированные файлы \
в отдельную сжатую папку (например: `compressedMyVideos`). Исходная папка остаётся без изменений.

Команда «Оптимизировать исходную папку» далее:

- Сканирует сжатую папку в поисках закодированных файлов.
- Находит соответствующий исходный файл для каждого закодированного.
- Сравнивает размеры файлов и заменяет исходный только если закодированный файл меньше.
- Оставляет исходный файл без изменений, если закодированный файл больше или того же размера.
""",
        .optimizeInfoBodyWhen: """
Используйте эту команду, когда вы хотите:

- Сначала проверить качество закодированных файлов в сжатой папке.
- А затем, когда будете довольны результатом, применить более компактные версии к исходной папке, \
  чтобы сэкономить место на диске без ручного переноса файлов.

Эта операция изменяет содержимое вашей исходной папки и не может быть отменена. Убедитесь, \
что вас устраивает результат в сжатой папке, прежде чем запускать команду.
""",

        // Error bodies
        .errorNoVideosBody: "В выбранной папке не найдено ни одного видео‑файла.",
        .errorHandBrakeMissingBodyFormat: """
HandBrakeCLI не удалось найти по следующим путям:

%@

Пожалуйста, установите Homebrew и HandBrakeCLI.
Нажмите кнопку «How to install HandBrake» в правом верхнем углу, чтобы открыть инструкции по установке.
""",
        .errorHandBrakeFailedBodyFormat: """
HandBrakeCLI завершился с ошибкой при обработке:

%@ 

Подробности: %@
""",

        // Generic buttons
        .buttonCopy: "Копировать",
        .buttonCopied: "Скопировано",

        // Log messages
        .logEncodeCancelled: "Кодирование отменено пользователем",
        .logEncodeStartedYoloOn: "---- Кодирование запущено (YOLO: ВКЛ.) ----",
        .logEncodeStartedYoloOff: "---- Кодирование запущено (YOLO: ВЫКЛ.) ----",
        .logSleepAssertionFailedFormat: "Не удалось создать запрет перехода в сон: %d",
        .logFailedToCreateDirectoryFormat: "Не удалось создать каталог: %@ - %@",
        .logErrorRunningHandBrakeFormat: "❌ Ошибка при запуске HandBrakeCLI для %@: %@",
        .logCompressedFolderMissingFormat: "Сжатая папка не найдена: %@",
        .logYoloReplacedOriginalFormat: "%@ → Вход: %@, Выход: %@ → успешно, исходный файл удалён",
        .logYoloOriginalDeleteFailedFormat: "Не удалось удалить исходный файл: %@ - %@",
        .logYoloTempMoveFailedFormat: "Не удалось переместить временный файл: %@ → %@ - %@",
        .logYoloSkippedLargerOrEqualFormat: "%@ → Вход: %@, Выход: %@ → пропущено (выход ≥ вход)",
        .logYoloEncodeFailedFormat: "%@ → Вход: %@, Выход: 0.0 MB → пропущено (ошибка кодирования)",
        .logYoloFailedOutputDeleteFailedFormat: "Не удалось удалить неудачный выходной файл: %@ - %@",
        .logOutputDeleteFailedFormat: "Не удалось удалить выходной файл: %@ - %@",
        .logEncodeSuccessFormat: "%@ → Вход: %@, Выход: %@ → кодирование успешно",
        .logEncodeSkippedLargerOrEqualFormat: "%@ → Вход: %@, Выход: %@ → пропущено (выход больше или равен)",
        .logOptimizeUpdatedFormat: "Оптимизация: %@ → исходный %@, новый %@, обновлён.",
        .logOptimizeErrorFormat: "Оптимизация: %@ → ОШИБКА: %@",
        .logOptimizeUnchangedFormat: "Оптимизация: %@ → исходный %@, новый %@, без изменений.",
        .logOptimizeCompletedFormat: "Оптимизация завершена: обновлено файлов — %d, без изменений — %d.",

        // Menu
        .menuAboutApp: "О HandBrake Batch Compressor"
    ]
}

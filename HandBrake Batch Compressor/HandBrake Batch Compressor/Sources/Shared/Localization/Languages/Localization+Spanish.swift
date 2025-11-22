//
//  Localization+Spanish.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//


extension LocalizationCatalog {
    /// Spanish translations for all known keys.
    ///
    /// These values are machine-translated and may need review by native speakers,
    /// but they are intended to be clear and user-friendly for a first release.
    static let spanish: [L10nKey: String] = [
        .appTitle: "Compresor por Lotes de HandBrake",
        .statusReady: "Listo",
        .statusNoVideosFound: "No se encontraron archivos de vídeo.",
        .statusHandBrakeMissing: "HandBrakeCLI no encontrado",
        .statusCancelled: "Cancelado ⛔️",
        .statusCompletedFormat: "Completado ✅ %d procesados, %d omitidos (%dm %ds)",
        .statusSearchingFiles: "Buscando archivos…",
        .statusProcessingFormat: "Procesando: %@",
        .buttonStart: "Iniciar",
        .buttonCancel: "Cancelar",
        .buttonSelectSourceFolder: "Seleccionar carpeta de origen",
        .toggleSaveRunLog: "Guardar registro de ejecución en la carpeta de origen",
        .toggleYoloMode: "Modo YOLO (sobrescribir archivos originales)",
        .buttonOptimizeOriginalFolder: "Optimizar carpeta original",
        .helpAboutTitle: "Compresor por Lotes de HandBrake",
        .helpAboutBody: """
Compresor por Lotes de HandBrake es una utilidad de macOS de un solo clic para comprimir carpetas completas de vídeo con HandBrakeCLI.

Selecciona una carpeta de origen y pulsa Iniciar: la app recorre todas las subcarpetas, codifica los archivos de vídeo compatibles y muestra el progreso por ti. No hay flujos de trabajo complejos ni colas que gestionar.
""",
        .yoloInfoTitle: "Modo YOLO",
        .optimizeInfoTitle: "Optimizar carpeta original",
        .installHandBrakeTitle: "Cómo instalar HandBrake",
        .buttonClose: "Cerrar",

        // General labels and tooltips
        .labelEncoder: "Codificador",
        .labelCustomEncoder: "Codificador:",
        .labelQuality: "Calidad:",
        .labelFramerate: "Fotogramas/s:",
        .labelExtraParams: "Parámetros extra:",
        .placeholderQuality: "Calidad",
        .placeholderFramerate: "Fotogramas/s",
        .placeholderExtra: "Extra",
        .labelElapsedTimeFormat: "Tiempo transcurrido: %dm %ds",
        .labelTotalProgressFormat: "Total: %d/%d",
        .labelCurrentFileFormat: "Actual: %@",
        .labelStatusPrefix: "Estado:",
        .helpInstallTooltip: "Guía paso a paso para instalar Homebrew y HandBrakeCLI",
        .helpAboutTooltip: "Información y ayuda de uso",
        .helpSettingsTooltip: "Ajustes",
        .helpYoloTooltip: """
El modo YOLO sobrescribe los archivos originales solo cuando el nuevo archivo codificado es más pequeño. Si el nuevo archivo es más grande o la codificación falla, se conserva el archivo original. Este modo es automático y puede eliminar versiones antiguas de forma permanente.
""",
        .helpOptimizeTooltip: """
Utiliza la carpeta comprimida para actualizar la carpeta original después de codificar con el modo YOLO desactivado. Para cada archivo coincidente, si la versión comprimida es más pequeña, sustituye al archivo original. Los archivos comprimidos de tamaño igual o mayor se descartan. Esta acción no se puede deshacer.
""",

        // Alerts
        .alertYoloTitle: "Advertencia: modo YOLO",
        .alertYoloConfirm: "Confirmar",
        .alertYoloCancel: "Cancelar",
        .alertYoloMessage: "Cuando el modo YOLO está activado, tus archivos originales pueden SOBRESCRIBIRSE y los archivos antiguos pueden ELIMINARSE. Esta acción NO SE PUEDE DESHACER. ¿Seguro que quieres continuar?",
        .alertErrorTitle: "Error",
        .alertErrorOk: "Aceptar",
        .alertErrorUnknown: "Se ha producido un error desconocido.",
        .alertSettingsLockedTitle: "Ajustes no disponibles",
        .alertSettingsLockedMessage: "No se pueden cambiar los ajustes mientras se está ejecutando un lote. Espera a que finalice la operación actual.",
        .alertSettingsLockedOk: "Aceptar",

        // Settings & install
        .settingsTitle: "Ajustes",
        .settingsLanguageSectionTitle: "Idioma",
        .settingsLanguageLabel: "Idioma de la app",
        .settingsLanguagePickerLabel: "Idioma",
        .settingsLanguageDescription: "“Sistema” sigue el idioma de tu macOS. Las demás opciones fuerzan la app a usar ese idioma cuando haya traducciones disponibles.",
        .settingsHBPathSectionTitle: "Ruta de HandBrakeCLI",
        .settingsHBPathDescription: "HandBrakeCLI no se encontró en las rutas predeterminadas. Si lo instalaste manualmente, indica la ruta completa del ejecutable HandBrakeCLI.",
        .settingsHBPathPlaceholder: "/usr/local/bin/HandBrakeCLI",
        .settingsHBPathInstalled: "Instalado",
        .settingsHBPathCheck: "Comprobar",
        .settingsHBPathError: "No se encontró un ejecutable de HandBrakeCLI en esta ruta.",

        .installHomebrewSectionTitle: "Configuración de Homebrew",
        .installHomebrewDescription: "Primero instala Homebrew si aún no está disponible en tu sistema:",
        .installHomebrewSnippetTitle: "Instalar Homebrew",
        .installHBSectionTitle: "Instalación de HandBrakeCLI",
        .installHBDescription: "Una vez instalado Homebrew, instala HandBrakeCLI con:",
        .installHBSnippetTitle: "Instalar HandBrakeCLI",
        .installVerificationTitle: "Verificación",
        .installVerificationDescription: "Compresor por Lotes de HandBrake buscará HandBrakeCLI en estas rutas predeterminadas:",
        .installVerificationInstalled: "Instalado",
        .installVerificationCheck: "Comprobar instalación",
        .installVerificationGoodToGo: "Todo listo. HandBrakeCLI está instalado y la app lo detectará automáticamente.",
        .installVerificationAutoPick: "Si HandBrakeCLI está instalado en una de estas ubicaciones, la app lo detectará automáticamente en la siguiente ejecución.",
        .installManualPathHint: "Si instalaste HandBrakeCLI manualmente en una ubicación no estándar, puedes indicarlo desde Ajustes.",

        // Help/info section subheadings
        .helpAboutSectionTitle: "Acerca de",
        .yoloInfoSectionWhatTitle: "Qué hace el modo YOLO",
        .yoloInfoSectionImportantTitle: "Importante",
        .optimizeInfoSectionWhatTitle: "Qué hace este comando",
        .optimizeInfoSectionWhenTitle: "Cuándo usarlo",

        // Help/info body text
        .yoloInfoBodyWhat: """
Cuando el modo YOLO está activado, Compresor por Lotes de HandBrake compara cada nuevo archivo codificado \
con su original y decide automáticamente cuál conservar:

- Si el archivo codificado es más pequeño que el original, se elimina el archivo original y se conserva el nuevo.
- Si el archivo codificado es más grande, se conserva el archivo original y se elimina el codificado.
- Si la codificación falla o el archivo de salida está vacío, se conserva el original y se elimina el archivo fallido.
""",
        .yoloInfoBodyImportant: """
El modo YOLO funciona de forma automática mientras se ejecuta el lote. Los archivos originales pueden eliminarse \
tan pronto como haya una versión codificada más pequeña disponible. Esta acción no se puede deshacer, así que asegúrate \
de tener copias de seguridad o de estar conforme con perder los archivos originales antes de activar el modo YOLO.
""",
        .optimizeInfoBodyWhat: """
Después de codificar con el modo YOLO desactivado, Compresor por Lotes de HandBrake guarda todos los archivos codificados \
en una carpeta comprimida separada (por ejemplo: `compressedMyVideos`). La carpeta original permanece sin cambios.

El comando “Optimizar carpeta original” entonces:

- Analiza la carpeta comprimida en busca de archivos codificados.
- Busca el archivo original correspondiente para cada archivo codificado.
- Compara los tamaños de archivo y solo sustituye el original si el archivo codificado es más pequeño.
- Deja los originales sin cambios cuando el archivo codificado es igual o más grande.
""",
        .optimizeInfoBodyWhen: """
Usa este comando cuando quieras:

- Primero comprobar la calidad de los archivos codificados en la carpeta comprimida.
- Y luego, cuando estés satisfecho, aplicar las versiones más pequeñas a la carpeta original \
  para ahorrar espacio en disco sin mover archivos manualmente.

Esta operación modifica tu carpeta original y no se puede deshacer. Asegúrate de estar satisfecho \
con los resultados en la carpeta comprimida antes de ejecutarla.
""",

        // Error bodies
        .errorNoVideosBody: "No se encontraron archivos de vídeo en la carpeta seleccionada.",
        .errorHandBrakeMissingBodyFormat: """
No se pudo encontrar HandBrakeCLI en:

%@

Instala Homebrew y HandBrakeCLI.
Haz clic en el botón “Cómo instalar HandBrake” en la esquina superior derecha para ver las instrucciones de instalación.
""",
        .errorHandBrakeFailedBodyFormat: """
HandBrakeCLI falló al procesar:

%@ 

Detalles: %@
""",

        // Generic buttons
        .buttonCopy: "Copiar",
        .buttonCopied: "Copiado",

        // Log messages
        .logEncodeCancelled: "Codificación cancelada por el usuario",
        .logEncodeStartedYoloOn: "---- Codificación iniciada (YOLO: ACTIVADO) ----",
        .logEncodeStartedYoloOff: "---- Codificación iniciada (YOLO: DESACTIVADO) ----",
        .logSleepAssertionFailedFormat: "No se pudo crear la aserción de suspensión: %d",
        .logFailedToCreateDirectoryFormat: "No se pudo crear el directorio: %@ - %@",
        .logErrorRunningHandBrakeFormat: "❌ Error al ejecutar HandBrakeCLI para %@: %@",
        .logCompressedFolderMissingFormat: "Carpeta comprimida no encontrada: %@",
        .logYoloReplacedOriginalFormat: "%@ → Entrada: %@, Salida: %@ → correcto, original eliminado",
        .logYoloOriginalDeleteFailedFormat: "No se pudo eliminar el archivo original: %@ - %@",
        .logYoloTempMoveFailedFormat: "No se pudo mover el archivo temporal: %@ → %@ - %@",
        .logYoloSkippedLargerOrEqualFormat: "%@ → Entrada: %@, Salida: %@ → omitido (salida ≥ entrada)",
        .logYoloEncodeFailedFormat: "%@ → Entrada: %@, Salida: 0.0 MB → omitido (falló la codificación)",
        .logYoloFailedOutputDeleteFailedFormat: "No se pudo eliminar el archivo de salida fallido: %@ - %@",
        .logOutputDeleteFailedFormat: "No se pudo eliminar el archivo de salida: %@ - %@",
        .logEncodeSuccessFormat: "%@ → Entrada: %@, Salida: %@ → codificación correcta",
        .logEncodeSkippedLargerOrEqualFormat: "%@ → Entrada: %@, Salida: %@ → omitido (salida igual o mayor)",
        .logOptimizeUpdatedFormat: "Optimizar: %@ → original %@, nuevo %@, actualizado.",
        .logOptimizeErrorFormat: "Optimizar: %@ → ERROR: %@",
        .logOptimizeUnchangedFormat: "Optimizar: %@ → original %@, nuevo %@, sin cambios.",
        .logOptimizeCompletedFormat: "Optimización completada: %d archivos actualizados, %d sin cambios.",

        // Menu
        .menuAboutApp: "Acerca de HandBrake Batch Compressor"
    ]
}

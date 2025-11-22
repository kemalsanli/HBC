//
//  Localization+Italian.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

extension LocalizationCatalog {
    /// Italian translations for all known keys.
    ///
    /// These values are machine-translated and may need review by native speakers,
    /// but they are intended to be clear and user-friendly for a first release.
    static let italian: [L10nKey: String] = [
        .appTitle: "Compressore batch HandBrake",
        .statusReady: "Pronto",
        .statusNoVideosFound: "Nessun file video trovato.",
        .statusHandBrakeMissing: "HandBrakeCLI non trovato",
        .statusCancelled: "Annullato ⛔️",
        .statusCompletedFormat: "Completato ✅ %d elaborati, %d ignorati (%dm %ds)",
        .statusSearchingFiles: "Ricerca dei file…",
        .statusProcessingFormat: "Elaborazione: %@",
        .buttonStart: "Avvia",
        .buttonCancel: "Annulla",
        .buttonSelectSourceFolder: "Seleziona cartella sorgente",
        .toggleSaveRunLog: "Salva il file di log nella cartella sorgente",
        .toggleYoloMode: "Modalità YOLO (sovrascrivi i file originali)",
        .buttonOptimizeOriginalFolder: "Ottimizza cartella originale",
        .helpAboutTitle: "Compressore batch HandBrake",
        .helpAboutBody: """
Compressore batch HandBrake è un'utility macOS a un solo clic per comprimere intere cartelle video con HandBrakeCLI.

Seleziona una cartella sorgente e premi Avvia — l'app scorre tutte le sottocartelle annidate, codifica i file video supportati e tiene traccia dell'avanzamento. Non sono necessari flussi di lavoro complessi o code da gestire.
""",
        .yoloInfoTitle: "Modalità YOLO",
        .optimizeInfoTitle: "Ottimizza cartella originale",
        .installHandBrakeTitle: "Come installare HandBrake",
        .buttonClose: "Chiudi",

        // General labels and tooltips
        .labelEncoder: "Encoder",
        .labelCustomEncoder: "Encoder:",
        .labelQuality: "Qualità:",
        .labelFramerate: "Frame rate:",
        .labelExtraParams: "Parametri extra:",
        .placeholderQuality: "Qualità",
        .placeholderFramerate: "Frame rate",
        .placeholderExtra: "Extra",
        .labelElapsedTimeFormat: "Tempo trascorso: %dm %ds",
        .labelTotalProgressFormat: "Totale: %d/%d",
        .labelCurrentFileFormat: "Corrente: %@",
        .labelStatusPrefix: "Stato:",
        .helpInstallTooltip: "Guida passo‑passo per installare Homebrew e HandBrakeCLI",
        .helpAboutTooltip: "Informazioni sull’app e guida all’uso",
        .helpSettingsTooltip: "Impostazioni",
        .helpYoloTooltip: """
La modalità YOLO sovrascrive i file originali solo quando il nuovo file codificato è più piccolo. Se il nuovo file è più grande o la codifica fallisce, il file originale viene mantenuto. Questa modalità è automatica e può eliminare in modo permanente le versioni precedenti.
""",
        .helpOptimizeTooltip: """
Utilizza la cartella compressa per aggiornare la cartella originale dopo la codifica con YOLO disattivato. Per ogni file corrispondente, se la versione compressa è più piccola, sostituisce il file originale. I file compressi di dimensioni maggiori o uguali vengono scartati. Questa azione non può essere annullata.
""",

        // Alerts
        .alertYoloTitle: "Avviso: modalità YOLO",
        .alertYoloConfirm: "Conferma",
        .alertYoloCancel: "Annulla",
        .alertYoloMessage: "Quando la modalità YOLO è abilitata, i tuoi file originali possono essere SOVRASCRITTI e i file vecchi possono essere ELIMINATI. Questa azione NON PUÒ ESSERE ANNULLATA. Vuoi davvero continuare?",
        .alertErrorTitle: "Errore",
        .alertErrorOk: "OK",
        .alertErrorUnknown: "Si è verificato un errore sconosciuto.",
        .alertSettingsLockedTitle: "Impostazioni non disponibili",
        .alertSettingsLockedMessage: "Le impostazioni non possono essere modificate mentre è in esecuzione un batch. Attendi il completamento dell’operazione corrente.",
        .alertSettingsLockedOk: "OK",

        // Settings & install
        .settingsTitle: "Impostazioni",
        .settingsLanguageSectionTitle: "Lingua",
        .settingsLanguageLabel: "Lingua dell’app",
        .settingsLanguagePickerLabel: "Lingua",
        .settingsLanguageDescription: "“System” segue la lingua del tuo macOS. Le altre opzioni forzano l’app a usare quella lingua quando sono disponibili le traduzioni.",
        .settingsHBPathSectionTitle: "Percorso HandBrakeCLI",
        .settingsHBPathDescription: "HandBrakeCLI non è stato trovato nelle posizioni predefinite. Se lo hai installato manualmente, fornisci il percorso completo del binario HandBrakeCLI.",
        .settingsHBPathPlaceholder: "/usr/local/bin/HandBrakeCLI",
        .settingsHBPathInstalled: "Installato",
        .settingsHBPathCheck: "Controlla",
        .settingsHBPathError: "Nessun HandBrakeCLI eseguibile trovato in questo percorso.",

        .installHomebrewSectionTitle: "Configurazione di Homebrew",
        .installHomebrewDescription: "Per prima cosa installa Homebrew se non è già presente sul tuo sistema:",
        .installHomebrewSnippetTitle: "Installa Homebrew",
        .installHBSectionTitle: "Installazione di HandBrakeCLI",
        .installHBDescription: "Dopo aver installato Homebrew, installa HandBrakeCLI con:",
        .installHBSnippetTitle: "Installa HandBrakeCLI",
        .installVerificationTitle: "Verifica",
        .installVerificationDescription: "HandBrake Batch Compressor cercherà HandBrakeCLI nei seguenti percorsi predefiniti:",
        .installVerificationInstalled: "Installato",
        .installVerificationCheck: "Verifica installazione",
        .installVerificationGoodToGo: "Tutto pronto. HandBrakeCLI è installato e verrà rilevato automaticamente.",
        .installVerificationAutoPick: "Se HandBrakeCLI è installato in una di queste posizioni, l’app lo rileverà automaticamente alla prossima esecuzione.",
        .installManualPathHint: "Se hai installato HandBrakeCLI manualmente in una posizione non standard, puoi indicare il percorso dalle Impostazioni.",

        // Help/info section subheadings
        .helpAboutSectionTitle: "Informazioni",
        .yoloInfoSectionWhatTitle: "Cosa fa la modalità YOLO",
        .yoloInfoSectionImportantTitle: "Importante",
        .optimizeInfoSectionWhatTitle: "Cosa fa questo comando",
        .optimizeInfoSectionWhenTitle: "Quando utilizzarlo",

        // Help/info body text
        .yoloInfoBodyWhat: """
Quando la modalità YOLO è attiva, HandBrake Batch Compressor confronta ciascun nuovo file codificato \
con il file originale e decide automaticamente quale versione mantenere:

- Se il file codificato è più piccolo dell’originale, il file originale viene eliminato e il nuovo file viene mantenuto.
- Se il file codificato è più grande, il file originale viene mantenuto e il file codificato viene eliminato.
- Se la codifica fallisce o il file di output è vuoto, il file originale viene mantenuto e l’output non riuscito viene eliminato.
""",
        .yoloInfoBodyImportant: """
La modalità YOLO funziona in modo automatico mentre il batch è in esecuzione. I file originali possono essere eliminati \
non appena è disponibile una versione codificata più piccola. Questa azione non può essere annullata, quindi assicurati \
di avere un backup o di essere d’accordo a perdere i file originali prima di attivare la modalità YOLO.
""",
        .optimizeInfoBodyWhat: """
Dopo aver codificato con la modalità YOLO disattivata, HandBrake Batch Compressor scrive tutti i file codificati \
in una cartella compressa separata (ad esempio: `compressedMyVideos`). La cartella originale rimane invariata.

Il comando “Ottimizza cartella originale” quindi:

- Scansiona la cartella compressa per trovare i file codificati.
- Trova il file originale corrispondente per ciascun file codificato.
- Confronta le dimensioni dei file e sostituisce l’originale solo se il file codificato è più piccolo.
- Lascia invariato il file originale quando il file codificato è più grande o della stessa dimensione.
""",
        .optimizeInfoBodyWhen: """
Usa questo comando quando vuoi:

- Prima verificare la qualità dei file codificati nella cartella compressa.
- Poi, una volta soddisfatto, applicare le versioni più piccole alla cartella originale \
  per risparmiare spazio su disco senza spostare i file manualmente.

Questa operazione modifica la cartella originale e non può essere annullata. Assicurati di essere soddisfatto \
dei risultati nella cartella compressa prima di eseguirla.
""",

        // Error bodies
        .errorNoVideosBody: "Nessun file video trovato nella cartella selezionata.",
        .errorHandBrakeMissingBodyFormat: """
HandBrakeCLI non è stato trovato in:

%@

Installa Homebrew e HandBrakeCLI.
Fai clic sul pulsante “How to install HandBrake” in alto a destra per le istruzioni di installazione.
""",
        .errorHandBrakeFailedBodyFormat: """
HandBrakeCLI non è riuscito a elaborare:

%@ 

Dettagli: %@
""",

        // Generic buttons
        .buttonCopy: "Copia",
        .buttonCopied: "Copiato",

        // Log messages
        .logEncodeCancelled: "Codifica annullata dall’utente",
        .logEncodeStartedYoloOn: "---- Codifica avviata (YOLO: ON) ----",
        .logEncodeStartedYoloOff: "---- Codifica avviata (YOLO: OFF) ----",
        .logSleepAssertionFailedFormat: "Impossibile creare la sleep assertion: %d",
        .logFailedToCreateDirectoryFormat: "Impossibile creare la directory: %@ - %@",
        .logErrorRunningHandBrakeFormat: "❌ Errore durante l’esecuzione di HandBrakeCLI per %@: %@",
        .logCompressedFolderMissingFormat: "Cartella compressa non trovata: %@",
        .logYoloReplacedOriginalFormat: "%@ → Input: %@, Output: %@ → riuscito, originale eliminato",
        .logYoloOriginalDeleteFailedFormat: "Impossibile eliminare il file originale: %@ - %@",
        .logYoloTempMoveFailedFormat: "Impossibile spostare il file temporaneo: %@ → %@ - %@",
        .logYoloSkippedLargerOrEqualFormat: "%@ → Input: %@, Output: %@ → ignorato (output ≥ input)",
        .logYoloEncodeFailedFormat: "%@ → Input: %@, Output: 0.0 MB → ignorato (codifica non riuscita)",
        .logYoloFailedOutputDeleteFailedFormat: "Impossibile eliminare il file di output non riuscito: %@ - %@",
        .logOutputDeleteFailedFormat: "Impossibile eliminare il file di output: %@ - %@",
        .logEncodeSuccessFormat: "%@ → Input: %@, Output: %@ → codifica riuscita",
        .logEncodeSkippedLargerOrEqualFormat: "%@ → Input: %@, Output: %@ → ignorato (output maggiore o uguale)",
        .logOptimizeUpdatedFormat: "Ottimizza: %@ → originale %@, nuovo %@, aggiornato.",
        .logOptimizeErrorFormat: "Ottimizza: %@ → ERRORE: %@",
        .logOptimizeUnchangedFormat: "Ottimizza: %@ → originale %@, nuovo %@, invariato.",
        .logOptimizeCompletedFormat: "Ottimizzazione completata: %d file aggiornati, %d senza modifiche.",

        // Menu
        .menuAboutApp: "Informazioni su HandBrake Batch Compressor"
    ]
}

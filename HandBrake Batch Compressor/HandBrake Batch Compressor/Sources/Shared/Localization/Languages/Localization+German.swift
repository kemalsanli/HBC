//
//  Localization+German.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

extension LocalizationCatalog {
    /// German translations for all known keys.
    ///
    /// These values are machine-translated and may need review by native speakers,
    /// but they are intended to be clear and user-friendly for a first release.
    static let german: [L10nKey: String] = [
        .appTitle: "HandBrake Stapelkomprimierer",
        .statusReady: "Bereit",
        .statusNoVideosFound: "Keine Videodateien gefunden.",
        .statusHandBrakeMissing: "HandBrakeCLI nicht gefunden",
        .statusCancelled: "Abgebrochen ⛔️",
        .statusCompletedFormat: "Abgeschlossen ✅ %d verarbeitet, %d übersprungen (%dm %ds)",
        .statusSearchingFiles: "Dateien werden gesucht…",
        .statusProcessingFormat: "Verarbeitung: %@",
        .buttonStart: "Start",
        .buttonCancel: "Abbrechen",
        .buttonSelectSourceFolder: "Quellordner auswählen",
        .toggleSaveRunLog: "Ausführungsprotokoll im Quellordner speichern",
        .toggleYoloMode: "YOLO-Modus (Originaldateien überschreiben)",
        .buttonOptimizeOriginalFolder: "Originalordner optimieren",
        .helpAboutTitle: "HandBrake Stapelkomprimierer",
        .helpAboutBody: """
HandBrake Stapelkomprimierer ist ein One‑Click‑Dienstprogramm für macOS, das ganze Videoordner mit HandBrakeCLI komprimiert.

Wählen Sie einen Quellordner aus und klicken Sie auf „Start“ – die App durchläuft alle verschachtelten Unterordner, kodiert unterstützte Videodateien und zeigt den Fortschritt an. Es sind keine komplexen Workflows oder Warteschlangen erforderlich.
""",
        .yoloInfoTitle: "YOLO-Modus",
        .optimizeInfoTitle: "Originalordner optimieren",
        .installHandBrakeTitle: "HandBrake installieren",
        .buttonClose: "Schließen",

        // General labels and tooltips
        .labelEncoder: "Encoder",
        .labelCustomEncoder: "Encoder:",
        .labelQuality: "Qualität:",
        .labelFramerate: "Bildrate:",
        .labelExtraParams: "Weitere Parameter:",
        .placeholderQuality: "Qualität",
        .placeholderFramerate: "Bildrate",
        .placeholderExtra: "Zusatz",
        .labelElapsedTimeFormat: "Verstrichene Zeit: %dm %ds",
        .labelTotalProgressFormat: "Gesamt: %d/%d",
        .labelCurrentFileFormat: "Aktuell: %@",
        .labelStatusPrefix: "Status:",
        .helpInstallTooltip: "Schritt‑für‑Schritt‑Anleitung zur Installation von Homebrew und HandBrakeCLI",
        .helpAboutTooltip: "Infos zur App und Hilfetext",
        .helpSettingsTooltip: "Einstellungen",
        .helpYoloTooltip: """
Der YOLO-Modus überschreibt Originaldateien nur dann, wenn die neu kodierte Datei kleiner ist. Ist die neue Datei größer oder schlägt das Encoding fehl, bleibt die Originaldatei erhalten. Dieser Modus arbeitet automatisch und kann ältere Versionen dauerhaft löschen.
""",
        .helpOptimizeTooltip: """
Verwendet den komprimierten Ordner, um den Originalordner nach einem Encoding mit deaktiviertem YOLO-Modus zu aktualisieren. Für jede passende Datei ersetzt die komprimierte Version die Originaldatei, wenn sie kleiner ist. Größere oder gleich große komprimierte Dateien werden verworfen. Dieser Vorgang kann nicht rückgängig gemacht werden.
""",

        // Alerts
        .alertYoloTitle: "Warnung: YOLO-Modus",
        .alertYoloConfirm: "Bestätigen",
        .alertYoloCancel: "Abbrechen",
        .alertYoloMessage: "Wenn der YOLO-Modus aktiviert ist, können Ihre Originaldateien ÜBERSCHRIEBEN und alte Dateien GELÖSCHT werden. Dieser Vorgang kann NICHT RÜCKGÄNGIG gemacht werden. Sind Sie sicher, dass Sie fortfahren möchten?",
        .alertErrorTitle: "Fehler",
        .alertErrorOk: "OK",
        .alertErrorUnknown: "Ein unbekannter Fehler ist aufgetreten.",
        .alertSettingsLockedTitle: "Einstellungen nicht verfügbar",
        .alertSettingsLockedMessage: "Einstellungen können während der Ausführung eines Batches nicht geändert werden. Warten Sie bitte, bis der aktuelle Vorgang abgeschlossen ist.",
        .alertSettingsLockedOk: "OK",

        // Settings & install
        .settingsTitle: "Einstellungen",
        .settingsLanguageSectionTitle: "Sprache",
        .settingsLanguageLabel: "App‑Sprache",
        .settingsLanguagePickerLabel: "Sprache",
        .settingsLanguageDescription: "„System“ folgt der macOS‑Systemsprache. Andere Optionen erzwingen die Verwendung dieser Sprache, sofern Übersetzungen verfügbar sind.",
        .settingsHBPathSectionTitle: "HandBrakeCLI‑Pfad",
        .settingsHBPathDescription: "HandBrakeCLI wurde an den Standardorten nicht gefunden. Wenn Sie es manuell installiert haben, geben Sie den vollständigen Pfad zur HandBrakeCLI‑Binärdatei an.",
        .settingsHBPathPlaceholder: "/usr/local/bin/HandBrakeCLI",
        .settingsHBPathInstalled: "Installiert",
        .settingsHBPathCheck: "Prüfen",
        .settingsHBPathError: "Unter diesem Pfad wurde keine ausführbare HandBrakeCLI‑Datei gefunden.",

        .installHomebrewSectionTitle: "Homebrew‑Einrichtung",
        .installHomebrewDescription: "Installieren Sie zuerst Homebrew, falls es auf Ihrem System noch nicht verfügbar ist:",
        .installHomebrewSnippetTitle: "Homebrew installieren",
        .installHBSectionTitle: "HandBrakeCLI‑Installation",
        .installHBDescription: "Sobald Homebrew installiert ist, installieren Sie HandBrakeCLI mit:",
        .installHBSnippetTitle: "HandBrakeCLI installieren",
        .installVerificationTitle: "Überprüfung",
        .installVerificationDescription: "HandBrake Stapelkomprimierer sucht HandBrakeCLI in folgenden Standardpfaden:",
        .installVerificationInstalled: "Installiert",
        .installVerificationCheck: "Installation prüfen",
        .installVerificationGoodToGo: "Alles bereit. HandBrakeCLI ist installiert und wird automatisch erkannt.",
        .installVerificationAutoPick: "Wenn HandBrakeCLI an einem dieser Orte installiert ist, wird die App es beim nächsten Start automatisch finden.",
        .installManualPathHint: "Wenn Sie HandBrakeCLI manuell an einem nicht standardmäßigen Ort installiert haben, können Sie den Pfad in den Einstellungen angeben.",

        // Help/info section subheadings
        .helpAboutSectionTitle: "Info",
        .yoloInfoSectionWhatTitle: "Was der YOLO‑Modus macht",
        .yoloInfoSectionImportantTitle: "Wichtig",
        .optimizeInfoSectionWhatTitle: "Was dieser Befehl macht",
        .optimizeInfoSectionWhenTitle: "Wann er verwendet werden sollte",

        // Help/info body text
        .yoloInfoBodyWhat: """
Wenn der YOLO‑Modus aktiviert ist, vergleicht HandBrake Stapelkomprimierer jede neu kodierte Datei \
mit der Originaldatei und entscheidet automatisch, welche Version beibehalten wird:

- Ist die kodierte Datei kleiner als das Original, wird die Originaldatei gelöscht und die neue Datei beibehalten.
- Ist die kodierte Datei größer, bleibt die Originaldatei erhalten und die kodierte Datei wird gelöscht.
- Wenn das Encoding fehlschlägt oder die Ausgabedatei leer ist, bleibt die Originaldatei erhalten und die fehlgeschlagene Ausgabe wird gelöscht.
""",
        .yoloInfoBodyImportant: """
Der YOLO‑Modus arbeitet automatisch, während der Batch läuft. Originaldateien können gelöscht werden, \
sobald eine kleinere kodierte Version verfügbar ist. Dieser Vorgang kann nicht rückgängig gemacht werden. \
Stellen Sie daher sicher, dass Sie über Backups verfügen oder mit dem Verlust der Originaldateien leben können, \
bevor Sie den YOLO‑Modus aktivieren.
""",
        .optimizeInfoBodyWhat: """
Nach dem Encoding bei deaktiviertem YOLO‑Modus schreibt HandBrake Stapelkomprimierer alle kodierten Dateien \
in einen separaten komprimierten Ordner (zum Beispiel: `compressedMyVideos`). Der Originalordner bleibt unverändert.

Der Befehl „Originalordner optimieren“ führt dann Folgendes aus:

- Scannt den komprimierten Ordner nach kodierten Dateien.
- Findet für jede kodierte Datei die entsprechende Originaldatei.
- Vergleicht die Dateigrößen und ersetzt die Originaldatei nur, wenn die kodierte Datei kleiner ist.
- Lässt die Originaldatei unverändert, wenn die kodierte Datei größer oder gleich groß ist.
""",
        .optimizeInfoBodyWhen: """
Verwenden Sie diesen Befehl, wenn Sie:

- Zuerst die Qualität der kodierten Dateien im komprimierten Ordner überprüfen möchten.
- Und anschließend, wenn Sie zufrieden sind, die kleineren Versionen auf den Originalordner anwenden möchten, \
  um Speicherplatz zu sparen, ohne Dateien manuell verschieben zu müssen.

Dieser Vorgang verändert Ihren Originalordner und kann nicht rückgängig gemacht werden. Stellen Sie sicher, \
dass Sie mit den Ergebnissen im komprimierten Ordner zufrieden sind, bevor Sie ihn ausführen.
""",

        // Error bodies
        .errorNoVideosBody: "Im ausgewählten Ordner wurden keine Videodateien gefunden.",
        .errorHandBrakeMissingBodyFormat: """
HandBrakeCLI konnte an folgenden Orten nicht gefunden werden:

%@

Bitte installieren Sie Homebrew und HandBrakeCLI.
Klicken Sie oben rechts auf die Schaltfläche „How to install HandBrake“, um die Installationsanleitung zu öffnen.
""",
        .errorHandBrakeFailedBodyFormat: """
HandBrakeCLI ist beim Verarbeiten der Datei fehlgeschlagen:

%@ 

Details: %@
""",

        // Generic buttons
        .buttonCopy: "Kopieren",
        .buttonCopied: "Kopiert",

        // Log messages
        .logEncodeCancelled: "Kodierung vom Benutzer abgebrochen",
        .logEncodeStartedYoloOn: "---- Kodierung gestartet (YOLO: EIN) ----",
        .logEncodeStartedYoloOff: "---- Kodierung gestartet (YOLO: AUS) ----",
        .logSleepAssertionFailedFormat: "Erstellen der Sleep‑Assertion fehlgeschlagen: %d",
        .logFailedToCreateDirectoryFormat: "Erstellen des Verzeichnisses fehlgeschlagen: %@ - %@",
        .logErrorRunningHandBrakeFormat: "❌ Fehler beim Ausführen von HandBrakeCLI für %@: %@",
        .logCompressedFolderMissingFormat: "Komprimierter Ordner nicht gefunden: %@",
        .logYoloReplacedOriginalFormat: "%@ → Eingabe: %@, Ausgabe: %@ → erfolgreich, Original gelöscht",
        .logYoloOriginalDeleteFailedFormat: "Originaldatei konnte nicht gelöscht werden: %@ - %@",
        .logYoloTempMoveFailedFormat: "Temporäre Datei konnte nicht verschoben werden: %@ → %@ - %@",
        .logYoloSkippedLargerOrEqualFormat: "%@ → Eingabe: %@, Ausgabe: %@ → übersprungen (Ausgabe ≥ Eingabe)",
        .logYoloEncodeFailedFormat: "%@ → Eingabe: %@, Ausgabe: 0.0 MB → übersprungen (Kodierung fehlgeschlagen)",
        .logYoloFailedOutputDeleteFailedFormat: "Fehlerhafte Ausgabedatei konnte nicht gelöscht werden: %@ - %@",
        .logOutputDeleteFailedFormat: "Ausgabedatei konnte nicht gelöscht werden: %@ - %@",
        .logEncodeSuccessFormat: "%@ → Eingabe: %@, Ausgabe: %@ → Kodierung erfolgreich",
        .logEncodeSkippedLargerOrEqualFormat: "%@ → Eingabe: %@, Ausgabe: %@ → übersprungen (Ausgabe größer oder gleich)",
        .logOptimizeUpdatedFormat: "Optimieren: %@ → Original %@, neu %@, aktualisiert.",
        .logOptimizeErrorFormat: "Optimieren: %@ → FEHLER: %@",
        .logOptimizeUnchangedFormat: "Optimieren: %@ → Original %@, neu %@, unverändert.",
        .logOptimizeCompletedFormat: "Optimierung abgeschlossen: %d Dateien aktualisiert, %d unverändert.",

        // Menu
        .menuAboutApp: "Über HandBrake Batch Compressor"
    ]
}

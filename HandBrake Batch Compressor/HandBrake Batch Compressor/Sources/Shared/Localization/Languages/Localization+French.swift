//
//  Localization+French.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

extension LocalizationCatalog {
    /// French translations for all known keys.
    ///
    /// These values are machine-translated and may need review by native speakers,
    /// but they are intended to be clear and user-friendly for a first release.
    static let french: [L10nKey: String] = [
        .appTitle: "Compresseur par lots HandBrake",
        .statusReady: "Prêt",
        .statusNoVideosFound: "Aucun fichier vidéo trouvé.",
        .statusHandBrakeMissing: "HandBrakeCLI introuvable",
        .statusCancelled: "Annulé ⛔️",
        .statusCompletedFormat: "Terminé ✅ %d traités, %d ignorés (%dm %ds)",
        .statusSearchingFiles: "Recherche des fichiers…",
        .statusProcessingFormat: "Traitement : %@",
        .buttonStart: "Démarrer",
        .buttonCancel: "Annuler",
        .buttonSelectSourceFolder: "Sélectionner le dossier source",
        .toggleSaveRunLog: "Enregistrer le journal d’exécution dans le dossier source",
        .toggleYoloMode: "Mode YOLO (écraser les fichiers originaux)",
        .buttonOptimizeOriginalFolder: "Optimiser le dossier original",
        .helpAboutTitle: "Compresseur par lots HandBrake",
        .helpAboutBody: """
Compresseur par lots HandBrake est un utilitaire macOS en un clic pour compresser des dossiers vidéo entiers avec HandBrakeCLI.

Sélectionnez un dossier source et appuyez sur « Démarrer » — l’app parcourt tous les sous-dossiers imbriqués, encode les fichiers vidéo pris en charge et suit la progression pour vous. Aucun flux de travail complexe ni file d’attente à gérer.
""",
        .yoloInfoTitle: "Mode YOLO",
        .optimizeInfoTitle: "Optimiser le dossier original",
        .installHandBrakeTitle: "Comment installer HandBrake",
        .buttonClose: "Fermer",

        // General labels and tooltips
        .labelEncoder: "Encodeur",
        .labelCustomEncoder: "Encodeur :",
        .labelQuality: "Qualité :",
        .labelFramerate: "Fréquence d’images :",
        .labelExtraParams: "Paramètres supplémentaires :",
        .placeholderQuality: "Qualité",
        .placeholderFramerate: "Fréquence d’images",
        .placeholderExtra: "Supplémentaire",
        .labelElapsedTimeFormat: "Temps écoulé : %dm %ds",
        .labelTotalProgressFormat: "Total : %d/%d",
        .labelCurrentFileFormat: "Actuel : %@",
        .labelStatusPrefix: "Statut :",
        .helpInstallTooltip: "Guide étape par étape pour installer Homebrew et HandBrakeCLI",
        .helpAboutTooltip: "Informations et aide d’utilisation",
        .helpSettingsTooltip: "Réglages",
        .helpYoloTooltip: """
Le mode YOLO écrase les fichiers originaux uniquement lorsque le nouveau fichier encodé est plus petit. Si le nouveau fichier est plus volumineux ou si l’encodage échoue, le fichier original est conservé. Ce mode fonctionne automatiquement et peut supprimer définitivement d’anciennes versions.
""",
        .helpOptimizeTooltip: """
Utilise le dossier compressé pour mettre à jour le dossier original après un encodage avec YOLO désactivé. Pour chaque fichier correspondant, si la version compressée est plus petite, elle remplace le fichier original. Les fichiers compressés de taille supérieure ou égale sont ignorés. Cette action est irréversible.
""",

        // Alerts
        .alertYoloTitle: "Avertissement : mode YOLO",
        .alertYoloConfirm: "Confirmer",
        .alertYoloCancel: "Annuler",
        .alertYoloMessage: "Lorsque le mode YOLO est activé, vos fichiers originaux peuvent être ÉCRASÉS et les anciens fichiers peuvent être SUPPRIMÉS. Cette action est DÉFINITIVE. Voulez-vous vraiment continuer ?",
        .alertErrorTitle: "Erreur",
        .alertErrorOk: "OK",
        .alertErrorUnknown: "Une erreur inconnue s’est produite.",
        .alertSettingsLockedTitle: "Réglages indisponibles",
        .alertSettingsLockedMessage: "Les réglages ne peuvent pas être modifiés pendant l’exécution d’un lot. Veuillez attendre la fin de l’opération en cours.",
        .alertSettingsLockedOk: "OK",

        // Settings & install
        .settingsTitle: "Réglages",
        .settingsLanguageSectionTitle: "Langue",
        .settingsLanguageLabel: "Langue de l’app",
        .settingsLanguagePickerLabel: "Langue",
        .settingsLanguageDescription: "« System » suit la langue de votre macOS. Les autres options forcent l’app à utiliser cette langue lorsque des traductions sont disponibles.",
        .settingsHBPathSectionTitle: "Chemin de HandBrakeCLI",
        .settingsHBPathDescription: "HandBrakeCLI n’a pas été trouvé dans les emplacements par défaut. Si vous l’avez installé manuellement, indiquez le chemin complet du binaire HandBrakeCLI.",
        .settingsHBPathPlaceholder: "/usr/local/bin/HandBrakeCLI",
        .settingsHBPathInstalled: "Installé",
        .settingsHBPathCheck: "Vérifier",
        .settingsHBPathError: "Aucun HandBrakeCLI exécutable trouvé à ce chemin.",

        .installHomebrewSectionTitle: "Configuration de Homebrew",
        .installHomebrewDescription: "Installez d’abord Homebrew s’il n’est pas déjà disponible sur votre système :",
        .installHomebrewSnippetTitle: "Installer Homebrew",
        .installHBSectionTitle: "Installation de HandBrakeCLI",
        .installHBDescription: "Une fois Homebrew installé, installez HandBrakeCLI avec :",
        .installHBSnippetTitle: "Installer HandBrakeCLI",
        .installVerificationTitle: "Vérification",
        .installVerificationDescription: "Compresseur par lots HandBrake recherchera HandBrakeCLI aux chemins par défaut suivants :",
        .installVerificationInstalled: "Installé",
        .installVerificationCheck: "Vérifier l’installation",
        .installVerificationGoodToGo: "Tout est prêt. HandBrakeCLI est installé et sera détecté automatiquement.",
        .installVerificationAutoPick: "Si HandBrakeCLI est installé à l’un de ces emplacements, l’app le détectera automatiquement au prochain lancement.",
        .installManualPathHint: "Si vous avez installé HandBrakeCLI manuellement dans un emplacement non standard, vous pouvez l’indiquer dans les Réglages.",

        // Help/info section subheadings
        .helpAboutSectionTitle: "À propos",
        .yoloInfoSectionWhatTitle: "Ce que fait le mode YOLO",
        .yoloInfoSectionImportantTitle: "Important",
        .optimizeInfoSectionWhatTitle: "Ce que fait cette commande",
        .optimizeInfoSectionWhenTitle: "Quand l’utiliser",

        // Help/info body text
        .yoloInfoBodyWhat: """
Lorsque le mode YOLO est activé, Compresseur par lots HandBrake compare chaque nouveau fichier encodé \
à son original et décide automatiquement lequel conserver :

- Si le fichier encodé est plus petit que l’original, le fichier original est supprimé et le nouveau est conservé.
- Si le fichier encodé est plus volumineux, le fichier original est conservé et le fichier encodé est supprimé.
- Si l’encodage échoue ou si le fichier de sortie est vide, le fichier original est conservé et la sortie échouée est supprimée.
""",
        .yoloInfoBodyImportant: """
Le mode YOLO fonctionne automatiquement pendant l’exécution du lot. Les fichiers originaux peuvent être supprimés \
dès qu’une version encodée plus petite est disponible. Cette action ne peut pas être annulée ; assurez-vous donc \
d’avoir des sauvegardes ou d’être prêt à perdre les fichiers originaux avant d’activer le mode YOLO.
""",
        .optimizeInfoBodyWhat: """
Après un encodage avec le mode YOLO désactivé, Compresseur par lots HandBrake écrit tous les fichiers encodés \
dans un dossier compressé séparé (par exemple : `compressedMyVideos`). Le dossier original reste inchangé.

La commande « Optimiser le dossier original » :

- Analyse le dossier compressé à la recherche des fichiers encodés.
- Trouve le fichier original correspondant pour chaque fichier encodé.
- Compare la taille des fichiers et ne remplace l’original que si le fichier encodé est plus petit.
- Laisse les fichiers originaux inchangés lorsque le fichier encodé est plus volumineux ou de même taille.
""",
        .optimizeInfoBodyWhen: """
Utilisez cette commande lorsque vous souhaitez :

- Vérifier d’abord la qualité des fichiers encodés dans le dossier compressé.
- Puis, une fois satisfait, appliquer les versions plus petites au dossier original \
  pour économiser de l’espace disque sans déplacer les fichiers manuellement.

Cette opération modifie votre dossier original et ne peut pas être annulée. Assurez-vous d’être satisfait \
des résultats dans le dossier compressé avant de l’exécuter.
""",

        // Error bodies
        .errorNoVideosBody: "Aucun fichier vidéo n’a été trouvé dans le dossier sélectionné.",
        .errorHandBrakeMissingBodyFormat: """
HandBrakeCLI est introuvable aux emplacements suivants :

%@

Veuillez installer Homebrew et HandBrakeCLI.
Cliquez sur le bouton « Comment installer HandBrake » en haut à droite pour afficher les instructions d’installation.
""",
        .errorHandBrakeFailedBodyFormat: """
HandBrakeCLI a échoué lors du traitement de :

%@ 

Détails : %@
""",

        // Generic buttons
        .buttonCopy: "Copier",
        .buttonCopied: "Copié",

        // Log messages
        .logEncodeCancelled: "Encodage annulé par l’utilisateur",
        .logEncodeStartedYoloOn: "---- Encodage démarré (YOLO : ACTIVÉ) ----",
        .logEncodeStartedYoloOff: "---- Encodage démarré (YOLO : DÉSACTIVÉ) ----",
        .logSleepAssertionFailedFormat: "Échec de la création de l’assertion de veille : %d",
        .logFailedToCreateDirectoryFormat: "Échec de création du répertoire : %@ - %@",
        .logErrorRunningHandBrakeFormat: "❌ Erreur lors de l’exécution de HandBrakeCLI pour %@ : %@",
        .logCompressedFolderMissingFormat: "Dossier compressé introuvable : %@",
        .logYoloReplacedOriginalFormat: "%@ → Entrée : %@, Sortie : %@ → succès, original supprimé",
        .logYoloOriginalDeleteFailedFormat: "Impossible de supprimer le fichier original : %@ - %@",
        .logYoloTempMoveFailedFormat: "Impossible de déplacer le fichier temporaire : %@ → %@ - %@",
        .logYoloSkippedLargerOrEqualFormat: "%@ → Entrée : %@, Sortie : %@ → ignoré (sortie ≥ entrée)",
        .logYoloEncodeFailedFormat: "%@ → Entrée : %@, Sortie : 0.0 MB → ignoré (échec de l’encodage)",
        .logYoloFailedOutputDeleteFailedFormat: "Impossible de supprimer le fichier de sortie en échec : %@ - %@",
        .logOutputDeleteFailedFormat: "Impossible de supprimer le fichier de sortie : %@ - %@",
        .logEncodeSuccessFormat: "%@ → Entrée : %@, Sortie : %@ → encodage réussi",
        .logEncodeSkippedLargerOrEqualFormat: "%@ → Entrée : %@, Sortie : %@ → ignoré (sortie plus grande ou égale)",
        .logOptimizeUpdatedFormat: "Optimiser : %@ → original %@, nouveau %@, mis à jour.",
        .logOptimizeErrorFormat: "Optimiser : %@ → ERREUR : %@",
        .logOptimizeUnchangedFormat: "Optimiser : %@ → original %@, nouveau %@, inchangé.",
        .logOptimizeCompletedFormat: "Optimisation terminée : %d fichiers mis à jour, %d inchangés.",

        // Menu
        .menuAboutApp: "À propos de HandBrake Batch Compressor"
    ]
}

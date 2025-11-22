//
//  Localization+Portuguese.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

extension LocalizationCatalog {
    /// Portuguese translations for all known keys.
    ///
    /// These values are machine-translated and may need review by native speakers,
    /// but they are intended to be clear and user-friendly for a first release.
    static let portuguese: [L10nKey: String] = [
        .appTitle: "Compressor em Lote do HandBrake",
        .statusReady: "Pronto",
        .statusNoVideosFound: "Nenhum arquivo de vídeo encontrado.",
        .statusHandBrakeMissing: "HandBrakeCLI não encontrado",
        .statusCancelled: "Cancelado ⛔️",
        .statusCompletedFormat: "Concluído ✅ %d processados, %d ignorados (%dm %ds)",
        .statusSearchingFiles: "Procurando arquivos…",
        .statusProcessingFormat: "Processando: %@",
        .buttonStart: "Iniciar",
        .buttonCancel: "Cancelar",
        .buttonSelectSourceFolder: "Selecionar pasta de origem",
        .toggleSaveRunLog: "Salvar arquivo de log na pasta de origem",
        .toggleYoloMode: "Modo YOLO (substituir arquivos originais)",
        .buttonOptimizeOriginalFolder: "Otimizar pasta original",
        .helpAboutTitle: "Compressor em Lote do HandBrake",
        .helpAboutBody: """
Compressor em Lote do HandBrake é um utilitário de um clique para macOS que comprime pastas de vídeo inteiras usando o HandBrakeCLI.

Selecione uma pasta de origem e clique em Iniciar — o app percorre todas as subpastas aninhadas, codifica os arquivos de vídeo compatíveis e acompanha o progresso para você. Não há fluxos de trabalho complexos nem filas para gerenciar.
""",
        .yoloInfoTitle: "Modo YOLO",
        .optimizeInfoTitle: "Otimizar pasta original",
        .installHandBrakeTitle: "Como instalar o HandBrake",
        .buttonClose: "Fechar",

        // General labels and tooltips
        .labelEncoder: "Codificador",
        .labelCustomEncoder: "Codificador:",
        .labelQuality: "Qualidade:",
        .labelFramerate: "Taxa de quadros:",
        .labelExtraParams: "Parâmetros extras:",
        .placeholderQuality: "Qualidade",
        .placeholderFramerate: "Taxa de quadros",
        .placeholderExtra: "Extra",
        .labelElapsedTimeFormat: "Tempo decorrido: %dm %ds",
        .labelTotalProgressFormat: "Total: %d/%d",
        .labelCurrentFileFormat: "Atual: %@",
        .labelStatusPrefix: "Status:",
        .helpInstallTooltip: "Guia passo a passo para instalar o Homebrew e o HandBrakeCLI",
        .helpAboutTooltip: "Informações e ajuda de uso",
        .helpSettingsTooltip: "Ajustes",
        .helpYoloTooltip: """
O modo YOLO substitui os arquivos originais apenas quando o novo arquivo codificado é menor. Se o novo arquivo for maior ou se a codificação falhar, o arquivo original é mantido. Esse modo é automático e pode excluir versões antigas de forma permanente.
""",
        .helpOptimizeTooltip: """
Usa a pasta compactada para atualizar a pasta original após codificar com o modo YOLO desativado. Para cada arquivo correspondente, se a versão compactada for menor, ela substitui o arquivo original. Arquivos compactados de tamanho maior ou igual são descartados. Essa ação não pode ser desfeita.
""",

        // Alerts
        .alertYoloTitle: "Aviso: modo YOLO",
        .alertYoloConfirm: "Confirmar",
        .alertYoloCancel: "Cancelar",
        .alertYoloMessage: "Quando o modo YOLO está ativado, seus arquivos originais podem ser SUBSTITUÍDOS e arquivos antigos podem ser EXCLUÍDOS. Essa ação NÃO PODE SER DESFEITA. Tem certeza de que deseja continuar?",
        .alertErrorTitle: "Erro",
        .alertErrorOk: "OK",
        .alertErrorUnknown: "Ocorreu um erro desconhecido.",
        .alertSettingsLockedTitle: "Ajustes indisponíveis",
        .alertSettingsLockedMessage: "Os ajustes não podem ser alterados enquanto um lote estiver em execução. Aguarde até que a operação atual seja concluída.",
        .alertSettingsLockedOk: "OK",

        // Settings & install
        .settingsTitle: "Ajustes",
        .settingsLanguageSectionTitle: "Idioma",
        .settingsLanguageLabel: "Idioma do app",
        .settingsLanguagePickerLabel: "Idioma",
        .settingsLanguageDescription: "“System” segue o idioma do macOS. As outras opções forçam o app a usar esse idioma quando houver traduções disponíveis.",
        .settingsHBPathSectionTitle: "Caminho do HandBrakeCLI",
        .settingsHBPathDescription: "O HandBrakeCLI não foi encontrado nos locais padrão. Se você o instalou manualmente, informe o caminho completo do binário HandBrakeCLI.",
        .settingsHBPathPlaceholder: "/usr/local/bin/HandBrakeCLI",
        .settingsHBPathInstalled: "Instalado",
        .settingsHBPathCheck: "Verificar",
        .settingsHBPathError: "Nenhum HandBrakeCLI executável foi encontrado neste caminho.",

        .installHomebrewSectionTitle: "Configuração do Homebrew",
        .installHomebrewDescription: "Instale o Homebrew primeiro se ele ainda não estiver disponível no seu sistema:",
        .installHomebrewSnippetTitle: "Instalar Homebrew",
        .installHBSectionTitle: "Instalação do HandBrakeCLI",
        .installHBDescription: "Depois de instalar o Homebrew, instale o HandBrakeCLI com:",
        .installHBSnippetTitle: "Instalar HandBrakeCLI",
        .installVerificationTitle: "Verificação",
        .installVerificationDescription: "O HandBrake Batch Compressor procurará o HandBrakeCLI nestes caminhos padrão:",
        .installVerificationInstalled: "Instalado",
        .installVerificationCheck: "Verificar instalação",
        .installVerificationGoodToGo: "Tudo pronto. O HandBrakeCLI está instalado e será detectado automaticamente.",
        .installVerificationAutoPick: "Se o HandBrakeCLI estiver instalado em um desses locais, o app o encontrará automaticamente na próxima execução.",
        .installManualPathHint: "Se você instalou o HandBrakeCLI manualmente em um local não padrão, poderá indicá-lo em Ajustes.",

        // Help/info section subheadings
        .helpAboutSectionTitle: "Sobre",
        .yoloInfoSectionWhatTitle: "O que o modo YOLO faz",
        .yoloInfoSectionImportantTitle: "Importante",
        .optimizeInfoSectionWhatTitle: "O que este comando faz",
        .optimizeInfoSectionWhenTitle: "Quando usar",

        // Help/info body text
        .yoloInfoBodyWhat: """
Quando o modo YOLO está ativado, o Compressor em Lote do HandBrake compara cada novo arquivo codificado \
com seu arquivo original e decide automaticamente qual manter:

- Se o arquivo codificado for menor que o original, o arquivo original é excluído e o novo é mantido.
- Se o arquivo codificado for maior, o arquivo original é mantido e o codificado é excluído.
- Se a codificação falhar ou o arquivo de saída estiver vazio, o arquivo original é mantido e a saída com falha é excluída.
""",
        .yoloInfoBodyImportant: """
O modo YOLO funciona automaticamente enquanto o lote está em execução. Arquivos originais podem ser excluídos \
assim que uma versão codificada menor estiver disponível. Essa ação não pode ser desfeita; portanto, certifique-se \
de ter backups ou de estar confortável em perder os arquivos originais antes de ativar o modo YOLO.
""",
        .optimizeInfoBodyWhat: """
Após codificar com o modo YOLO desativado, o Compressor em Lote do HandBrake grava todos os arquivos codificados \
em uma pasta compactada separada (por exemplo: `compressedMyVideos`). A pasta original permanece inalterada.

O comando “Otimizar pasta original” então:

- Analisa a pasta compactada em busca de arquivos codificados.
- Encontra o arquivo original correspondente para cada arquivo codificado.
- Compara os tamanhos dos arquivos e só substitui o original se o arquivo codificado for menor.
- Deixa os arquivos originais inalterados quando o arquivo codificado for maior ou do mesmo tamanho.
""",
        .optimizeInfoBodyWhen: """
Use este comando quando você quiser:

- Primeiro verificar a qualidade dos arquivos codificados na pasta compactada.
- Depois, quando estiver satisfeito, aplicar as versões menores de volta à pasta original \
  para economizar espaço em disco sem mover arquivos manualmente.

Essa operação modifica sua pasta original e não pode ser desfeita. Certifique-se de estar satisfeito \
com os resultados na pasta compactada antes de executá-la.
""",

        // Error bodies
        .errorNoVideosBody: "Nenhum arquivo de vídeo foi encontrado na pasta selecionada.",
        .errorHandBrakeMissingBodyFormat: """
O HandBrakeCLI não pôde ser encontrado em:

%@

Instale o Homebrew e o HandBrakeCLI.
Clique no botão “Como instalar o HandBrake” no canto superior direito para ver as instruções de instalação.
""",
        .errorHandBrakeFailedBodyFormat: """
O HandBrakeCLI falhou ao processar:

%@ 

Detalhes: %@
""",

        // Generic buttons
        .buttonCopy: "Copiar",
        .buttonCopied: "Copiado",

        // Log messages
        .logEncodeCancelled: "Codificação cancelada pelo usuário",
        .logEncodeStartedYoloOn: "---- Codificação iniciada (YOLO: ATIVADO) ----",
        .logEncodeStartedYoloOff: "---- Codificação iniciada (YOLO: DESATIVADO) ----",
        .logSleepAssertionFailedFormat: "Falha ao criar asserção de suspensão: %d",
        .logFailedToCreateDirectoryFormat: "Falha ao criar diretório: %@ - %@",
        .logErrorRunningHandBrakeFormat: "❌ Erro ao executar HandBrakeCLI para %@: %@",
        .logCompressedFolderMissingFormat: "Pasta compactada não encontrada: %@",
        .logYoloReplacedOriginalFormat: "%@ → Entrada: %@, Saída: %@ → sucesso, original excluído",
        .logYoloOriginalDeleteFailedFormat: "Não foi possível excluir o arquivo original: %@ - %@",
        .logYoloTempMoveFailedFormat: "Não foi possível mover o arquivo temporário: %@ → %@ - %@",
        .logYoloSkippedLargerOrEqualFormat: "%@ → Entrada: %@, Saída: %@ → ignorado (saída ≥ entrada)",
        .logYoloEncodeFailedFormat: "%@ → Entrada: %@, Saída: 0.0 MB → ignorado (falha na codificação)",
        .logYoloFailedOutputDeleteFailedFormat: "Não foi possível excluir o arquivo de saída com falha: %@ - %@",
        .logOutputDeleteFailedFormat: "Não foi possível excluir o arquivo de saída: %@ - %@",
        .logEncodeSuccessFormat: "%@ → Entrada: %@, Saída: %@ → codificação bem-sucedida",
        .logEncodeSkippedLargerOrEqualFormat: "%@ → Entrada: %@, Saída: %@ → ignorado (saída maior ou igual)",
        .logOptimizeUpdatedFormat: "Otimizar: %@ → original %@, novo %@, atualizado.",
        .logOptimizeErrorFormat: "Otimizar: %@ → ERRO: %@",
        .logOptimizeUnchangedFormat: "Otimizar: %@ → original %@, novo %@, sem alterações.",
        .logOptimizeCompletedFormat: "Otimização concluída: %d arquivos atualizados, %d sem alterações.",

        // Menu
        .menuAboutApp: "Sobre HandBrake Batch Compressor"
    ]
}

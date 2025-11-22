//
//  LocalizationCatalog.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//


/// In-memory localization catalog for a small set of languages.
///
/// For this app, the catalog can start out as a simple dictionary-based
/// store defined in code, which also makes it easy to generate or update
/// translations with external tools. In a future refactor, the same keys
/// can be backed by `Localizable.strings` files without changing call sites.
struct LocalizationCatalog {
    /// Returns the localization dictionary for the given app language.
    ///
    /// Currently only English and Turkish have dedicated catalogs. All other
    /// languages fall back to English until explicit translations are added.
    ///
    /// - Parameter language: The selected application language.
    /// - Returns: A dictionary mapping `L10nKey` to localized strings.
    static func dictionary(for language: AppLanguage) -> [L10nKey: String] {
        switch language {
        case .english:
            return english
        case .turkish:
            return turkish
        case .spanish:
            return spanish
        case .french:
            return french
        case .german:
            return german
        case .portuguese:
            return portuguese
        case .russian:
            return russian
        case .japanese:
            return japanese
        case .korean:
            return korean
        case .hindi:
            return hindi
        case .bengali:
            return bengali
        case .vietnamese:
            return vietnamese
        case .italian:
            return italian
        case .tamil:
            return tamil
        case .telugu:
            return telugu
        case .marathi:
            return marathi
        case .javanese:
            return javanese
        default:
            // Fallback: if the selected language does not have an explicit catalog yet,
            // use English strings so the UI remains usable.
            return english
        }
    }
}

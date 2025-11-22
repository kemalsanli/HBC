//
//  LocalizationController.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

import Foundation


/// Simple runtime localization helper for the app.
///
/// This type provides a single entry point for resolving `L10nKey` values
/// to localized strings based on the selected `AppLanguage`. For now it
/// uses the in-memory `LocalizationCatalog` dictionaries, but it can later
/// be updated to read from `.strings` files without changing call sites.
final class LocalizationController: ObservableObject {
    /// Shared singleton instance used by most of the app.
    static let shared = LocalizationController()
    
    /// UserDefaults key used to persist the selected language between launches.
    private let languageDefaultsKey = "AppLanguage"
    
    /// The active language for the app.
    ///
    /// When set to `.system`, the controller inspects the current system locale
    /// and attempts to map it to one of the supported `AppLanguage` cases
    /// (Turkish, Spanish, French, German, Portuguese, Russian, Japanese, Korean,
    /// Hindi, Bengali, Vietnamese, Italian, Tamil, Telugu, Marathi, Javanese, etc.),
    /// falling back to English if no suitable match is available.
    @Published var language: AppLanguage = .system {
        didSet {
            let defaults = UserDefaults.standard
            if language == .system {
                defaults.removeObject(forKey: languageDefaultsKey)
            } else {
                defaults.set(language.rawValue, forKey: languageDefaultsKey)
            }
        }
    }

    /// Creates a new localization controller, restoring any persisted language
    /// preference from `UserDefaults` if available.
    init() {
        let defaults = UserDefaults.standard
        if let raw = defaults.string(forKey: languageDefaultsKey),
           let stored = AppLanguage(rawValue: raw) {
            language = stored
        }
    }
    
    /// Resolves the effective app language, taking into account the stored preference
    /// and the current system locale when `.system` is selected.
    ///
    /// When `.system` is active, this method inspects the first preferred language
    /// from `Locale.preferredLanguages` and maps common language codes to the
    /// corresponding `AppLanguage` cases. If no match is found, English is used
    /// as a safe fallback.
    private func resolvedLanguage() -> AppLanguage {
        // If the user explicitly selected a language, respect that.
        if language != .system {
            return language
        }

        // Attempt to map the system's preferred language to one of our supported app languages.
        guard let preferredIdentifier = Locale.preferredLanguages.first?.lowercased() else {
            return .english
        }

        if preferredIdentifier.hasPrefix("tr") {
            return .turkish
        } else if preferredIdentifier.hasPrefix("es") {
            return .spanish
        } else if preferredIdentifier.hasPrefix("fr") {
            return .french
        } else if preferredIdentifier.hasPrefix("de") {
            return .german
        } else if preferredIdentifier.hasPrefix("pt") {
            return .portuguese
        } else if preferredIdentifier.hasPrefix("ru") {
            return .russian
        } else if preferredIdentifier.hasPrefix("ja") {
            return .japanese
        } else if preferredIdentifier.hasPrefix("ko") {
            return .korean
        } else if preferredIdentifier.hasPrefix("hi") {
            return .hindi
        } else if preferredIdentifier.hasPrefix("bn") {
            return .bengali
        } else if preferredIdentifier.hasPrefix("vi") {
            return .vietnamese
        } else if preferredIdentifier.hasPrefix("it") {
            return .italian
        } else if preferredIdentifier.hasPrefix("ta") {
            return .tamil
        } else if preferredIdentifier.hasPrefix("te") {
            return .telugu
        } else if preferredIdentifier.hasPrefix("mr") {
            return .marathi
        } else if preferredIdentifier.hasPrefix("jv") {
            return .javanese
        }

        // Default to English when the system language is not explicitly supported.
        return .english
    }

    /// Resolves the given localization key to a user-facing string.
    ///
    /// - Parameter key: The logical key to look up.
    /// - Returns: The localized string for the current language, or the
    ///            English base string if no translation is available.
    func text(_ key: L10nKey) -> String {
        let effectiveLanguage = resolvedLanguage()
        let dictionary = LocalizationCatalog.dictionary(for: effectiveLanguage)

        if let value = dictionary[key] {
            return value
        }

        // Fallback to English when the current language does not have a translation
        if effectiveLanguage != .english,
           let fallback = LocalizationCatalog.english[key] {
            return fallback
        }

        // As a last resort, return the raw key value so that missing keys are visible.
        return key.rawValue
    }

    /// Resolves a localized format string and applies `String(format:)` style interpolation.
    ///
    /// This is useful for strings that include dynamic values, such as counts or filenames.
    /// The format string for the given key should contain the appropriate `%@` / `%d` etc.
    ///
    /// - Parameters:
    ///   - key: The logical localization key whose value is a format string.
    ///   - arguments: The values to substitute into the format string.
    /// - Returns: An interpolated, localized string.
    func text(_ key: L10nKey, _ arguments: CVarArg...) -> String {
        let format = text(key)
        return String(format: format, arguments: arguments)
    }
}

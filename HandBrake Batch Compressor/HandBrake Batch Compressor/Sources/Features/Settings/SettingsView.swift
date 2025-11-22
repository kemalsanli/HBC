//
//  SettingsView.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

import SwiftUI


/// Application settings sheet for language and HandBrakeCLI configuration.
struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var localization: LocalizationController
    @ObservedObject var appConfig: AppConfiguration
    
    @State private var customPathInput: String = ""
    @State private var customPathCheckStatus: CustomPathStatus?
    
    private enum CustomPathStatus {
        case success
        case failure
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(localization.text(.settingsTitle))
                    .font(.title2)
                    .fontWeight(.semibold)
                
                // Language picker
                GroupBox(localization.text(.settingsLanguageSectionTitle)) {
                    VStack(alignment: .leading, spacing: 8) {
                        Picker("", selection: $localization.language) {
                            ForEach(AppLanguage.allCases) { lang in
                                Text(lang.displayName)
                                    .tag(lang)
                            }
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()
                        
                        Text(localization.text(.settingsLanguageDescription))
                            .font(.footnote)
                            .foregroundColor(.secondary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                
                // Custom HandBrakeCLI path (visible when HandBrakeCLI is not detected)
                if !appConfig.isHandBrakeInstalled() {
                    GroupBox(localization.text(.settingsHBPathSectionTitle)) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(localization.text(.settingsHBPathDescription))
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            
                            HStack(alignment: .firstTextBaseline, spacing: 8) {
                                TextField(localization.text(.settingsHBPathPlaceholder), text: $customPathInput)
                                    .textFieldStyle(.roundedBorder)
                                    .font(.system(.body, design: .monospaced))
                                
                                if customPathCheckStatus == .success {
                                    Text(localization.text(.settingsHBPathInstalled))
                                        .font(.caption)
                                        .foregroundColor(.green)
                                } else {
                                    Button(localization.text(.settingsHBPathCheck)) {
                                        runCustomPathCheck()
                                    }
                                    .buttonStyle(.bordered)
                                }
                            }
                            
                            if customPathCheckStatus == .failure {
                                Text(localization.text(.settingsHBPathError))
                                    .font(.footnote)
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button(localization.text(.buttonClose)) {
                        dismiss()
                    }
                    .keyboardShortcut(.cancelAction)
                }
            }
            .padding(24)
        }
        .frame(minWidth: 480, minHeight: 320)
        .scrollIndicators(.visible)
        .onAppear {
            customPathInput = appConfig.customHandBrakePath ?? ""
        }
    }
    
    /// Validates the custom HandBrakeCLI path and updates the shared configuration.
    private func runCustomPathCheck() {
        let trimmed = customPathInput.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            customPathCheckStatus = .failure
            return
        }
        if FileManager.default.isExecutableFile(atPath: trimmed) {
            appConfig.customHandBrakePath = trimmed
            customPathCheckStatus = .success
        } else {
            customPathCheckStatus = .failure
        }
    }
}

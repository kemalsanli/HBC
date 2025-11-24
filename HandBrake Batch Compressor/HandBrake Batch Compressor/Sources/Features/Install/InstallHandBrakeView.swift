//
//  InstallHandBrakeView.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

import SwiftUI

/// A sheet that provides step-by-step Homebrew and HandBrakeCLI installation instructions.
struct InstallHandBrakeView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var localization: LocalizationController
    
    private let homebrewCommand = #"/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)""#
    private let handbrakeCommand = "brew install handbrake"
    
    @State private var handbrakeInstalled: Bool = false
    @State private var didRunInitialChecks: Bool = false

    /// Convenience accessor for the shared list of HandBrakeCLI search paths.
    ///
    /// This keeps the UI in sync with `AppConfiguration` without duplicating
    /// the path literals.
    private var handBrakePaths: [String] {
        AppConfiguration.shared.handBrakeCandidatePaths
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(localization.text(.installHandBrakeTitle))
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(localization.text(.installHomebrewSectionTitle))
                    .font(.headline)
                Text(localization.text(.installHomebrewDescription))
                    .font(.body)
                
                CodeSnippetView(
                    title: localization.text(.installHomebrewSnippetTitle),
                    code: homebrewCommand
                )
                
                Text(localization.text(.installHBSectionTitle))
                    .font(.headline)
                    .padding(.top, 4)
                Text(localization.text(.installHBDescription))
                    .font(.body)
                
                CodeSnippetView(
                    title: localization.text(.installHBSnippetTitle),
                    code: handbrakeCommand
                )
                
                Text(localization.text(.installVerificationTitle))
                    .font(.headline)
                    .padding(.top, 4)
                Text(localization.text(.installVerificationDescription))
                    .font(.body)

                HStack(alignment: .firstTextBaseline) {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(handBrakePaths, id: \.self) { path in
                            Text("- \(path)")
                        }
                    }
                    .font(.system(.body, design: .monospaced))

                    Spacer()

                    if handbrakeInstalled {
                        Text(localization.text(.installVerificationInstalled))
                            .font(.caption)
                            .foregroundColor(.green)
                    } else {
                        Button(localization.text(.installVerificationCheck)) {
                            handbrakeInstalled = isHandBrakeInstalled()
                        }
                        .buttonStyle(.bordered)
                    }
                }

                if handbrakeInstalled {
                    Text(localization.text(.installVerificationGoodToGo))
                        .font(.footnote)
                        .foregroundColor(.secondary)
                } else {
                    Text(localization.text(.installVerificationAutoPick))
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                
                Text(localization.text(.installManualPathHint))
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
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
        .frame(minWidth: 520, minHeight: 420)
        .scrollIndicators(.visible)
        .onAppear {
            // Run a single initial check for HandBrakeCLI when the sheet appears.
            if !didRunInitialChecks {
                handbrakeInstalled = isHandBrakeInstalled()
                didRunInitialChecks = true
            }
        }
    }
    
    /// Returns `true` if HandBrakeCLI appears to be installed at any known path.
    ///
    /// This uses the central `AppConfiguration` so that the installation sheet
    /// stays in sync with the paths and any custom override used by the rest
    /// of the app.
    private func isHandBrakeInstalled() -> Bool {
        AppConfiguration.shared.isHandBrakeInstalled()
    }
}

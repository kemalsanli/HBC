//
//  HelpView.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

import SwiftUI
import AppKit


/// A modal view that displays application information and basic usage help.
struct HelpView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var localization: LocalizationController

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(localization.text(.helpAboutTitle))
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(localization.text(.helpAboutSectionTitle))
                    .font(.headline)
                Text(localization.text(.helpAboutBody))
                    .font(.body)
                
                Divider()
                
                Text("GitHub")
                    .font(.headline)
                Button {
                    if let url = URL(string: "https://github.com/kemalsanli/HBC") {
                        NSWorkspace.shared.open(url)
                    }
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "link")
                        Text("github.com/kemalsanli/HBC")
                    }
                }
                .buttonStyle(.link)
                
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
        .frame(minWidth: 520, minHeight: 380)
        .scrollIndicators(.visible)
    }
}

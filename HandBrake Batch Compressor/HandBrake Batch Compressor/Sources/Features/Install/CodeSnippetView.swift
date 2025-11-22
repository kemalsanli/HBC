//
//  CodeSnippetView.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

import SwiftUI


/// A reusable code snippet view with monospaced styling and a copy-to-clipboard button.
struct CodeSnippetView: View {
    let title: String?
    let code: String
    
    @State private var didCopy = false
    @ObservedObject private var localization = LocalizationController.shared
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let title = title {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            
            HStack(alignment: .top, spacing: 8) {
                Text(code)
                    .font(.system(.body, design: .monospaced))
                    .textSelection(.enabled)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button(didCopy ? localization.text(.buttonCopied) : localization.text(.buttonCopy)) {
                    copyToPasteboard(code)
                    withAnimation(.easeInOut(duration: 0.15)) {
                        didCopy = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation(.easeInOut(duration: 0.15)) {
                            didCopy = false
                        }
                    }
                }
                .buttonStyle(.bordered)
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(NSColor.controlBackgroundColor))
            )
        }
    }
    
    /// Copies the given string to the system pasteboard.
    private func copyToPasteboard(_ text: String) {
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(text, forType: .string)
    }
}

//
//  YoloModeInfoView.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

import SwiftUI


/// Detailed explanation of YOLO mode behavior and risks.
struct YoloModeInfoView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var localization: LocalizationController
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(localization.text(.yoloInfoTitle))
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(localization.text(.yoloInfoSectionWhatTitle))
                    .font(.headline)
                Text(localization.text(.yoloInfoBodyWhat))
                    .font(.body)
                
                Text(localization.text(.yoloInfoSectionImportantTitle))
                    .font(.headline)
                Text(localization.text(.yoloInfoBodyImportant))
                    .font(.body)
                
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

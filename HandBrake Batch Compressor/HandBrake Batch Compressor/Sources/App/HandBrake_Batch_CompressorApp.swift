//
//  HandBrake_Batch_CompressorApp.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 30.08.2025.
//

import SwiftUI

@main
struct HandBrakeBatchCompressorApp: App {
    @State private var showAbout = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .sheet(isPresented: $showAbout) {
                    HelpView(localization: LocalizationController.shared)
                }
        }
        .windowStyle(.titleBar)
        .commands {
            CommandGroup(replacing: .appInfo) {
                Button(LocalizationController.shared.text(.menuAboutApp)) {
                    showAbout = true
                }
            }
        }
    }
}

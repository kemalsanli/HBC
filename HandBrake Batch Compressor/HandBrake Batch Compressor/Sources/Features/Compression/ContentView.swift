//
//  ContentView.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 30.08.2025.
//



import SwiftUI
import AppKit
import IOKit.pwr_mgt

/// Root SwiftUI view for the HandBrake Batch Compressor application.
///
/// This view wires up controls for selecting a folder, configuring the
/// encoder, toggling YOLO mode, and observing encode progress and logs.
struct ContentView: View {
    @StateObject private var vm = CompressorViewModel()
    @StateObject private var appConfig = AppConfiguration.shared
    @ObservedObject private var localization = LocalizationController.shared
    
    @State private var showYoloAlert = false
    @State private var showHelpSheet = false
    @State private var showInstallSheet = false
    @State private var showYoloInfoSheet = false
    @State private var showOptimizeInfoSheet = false
    @State private var showSettingsSheet = false
    @State private var showSettingsWhileRunningAlert = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            HStack {
                Text(localization.text(.appTitle))
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
                
                if !appConfig.isHandBrakeInstalled() {
                    Button(localization.text(.installHandBrakeTitle)) {
                        showInstallSheet = true
                    }
                    .buttonStyle(.bordered)
                    .font(.caption)
                    .help(localization.text(.helpInstallTooltip))
                }
                
                Button {
                    showHelpSheet = true
                } label: {
                    Image(systemName: "info.circle")
                }
                .buttonStyle(.borderless)
                .help(localization.text(.helpAboutTooltip))
            }
            
            // Folder picker
            HStack {
                Button(localization.text(.buttonSelectSourceFolder)) { vm.pickFolder() }
                    .buttonStyle(.borderedProminent)
                if let src = vm.sourceURL {
                    Text(src.path)
                        .font(.callout)
                        .lineLimit(1)
                        .truncationMode(.middle)
                }
            }

            Toggle(localization.text(.toggleSaveRunLog), isOn: $vm.isFileLoggingEnabled)
                .toggleStyle(.checkbox)
                .font(.caption)
            
            // Encoder picker
            Picker(localization.text(.labelEncoder), selection: $vm.selectedEncoder) {
                ForEach(EncoderType.allCases) { enc in
                    Text(enc.rawValue).tag(enc)
                }
            }
            .pickerStyle(.segmented)
            
            // Custom encoder UI section
            if vm.selectedEncoder == .custom {
                VStack(alignment: .leading, spacing: 8) {
                    LabeledContent(localization.text(.labelCustomEncoder)) {
                        Picker("", selection: $vm.customEncoder) {
                            ForEach(vm.availableEncoders, id: \.self) { opt in
                                Text(opt).tag(opt)
                            }
                        }
                        .labelsHidden()
                        .pickerStyle(.menu)
                        .frame(width: 200)
                    }
                    LabeledContent(localization.text(.labelQuality)) {
                        TextField(localization.text(.placeholderQuality), text: $vm.customQuality)
                            .frame(width: 60)
                            .textFieldStyle(.roundedBorder)
                    }
                    LabeledContent(localization.text(.labelFramerate)) {
                        TextField(localization.text(.placeholderFramerate), text: $vm.customFramerate)
                            .frame(width: 60)
                            .textFieldStyle(.roundedBorder)
                    }
                    LabeledContent(localization.text(.labelExtraParams)) {
                        TextField(localization.text(.placeholderExtra), text: $vm.customExtra)
                            .textFieldStyle(.roundedBorder)
                    }
                }
                .padding(8)
                .background(Color(NSColor.controlBackgroundColor))
                .cornerRadius(8)
            }
            
            // YOLO mode toggle + inline help
            HStack(spacing: 4) {
                Toggle(localization.text(.toggleYoloMode), isOn: Binding(
                    get: { vm.yoloMode },
                    set: { newValue in
                        if newValue {
                            showYoloAlert = true
                        } else {
                            vm.yoloMode = false
                        }
                    }
                ))
                .toggleStyle(.checkbox)
                .font(.caption)
                
                Button {
                    showYoloInfoSheet = true
                } label: {
                    Image(systemName: "questionmark.circle")
                }
                .buttonStyle(.plain)
                .help(localization.text(.helpYoloTooltip))
            }
            .alert(localization.text(.alertYoloTitle), isPresented: $showYoloAlert) {
                Button(localization.text(.alertYoloConfirm), role: .destructive) {
                    vm.yoloMode = true
                }
                Button(localization.text(.alertYoloCancel), role: .cancel) {
                    vm.yoloMode = false
                }
            } message: {
                Text(localization.text(.alertYoloMessage))
            }
            .sheet(isPresented: $showYoloInfoSheet) {
                YoloModeInfoView(localization: localization)
            }
            
            // Optimize original folder button (visible only when YOLO mode is disabled)
            if !vm.yoloMode {
                HStack(spacing: 4) {
                    Button(localization.text(.buttonOptimizeOriginalFolder)) {
                        vm.optimizeOriginalFolder()
                    }
                    .buttonStyle(.bordered)
                    .font(.caption)
                    
                    Button {
                        showOptimizeInfoSheet = true
                    } label: {
                        Image(systemName: "questionmark.circle")
                    }
                    .buttonStyle(.plain)
                    .help(localization.text(.helpOptimizeTooltip))
                }
                .sheet(isPresented: $showOptimizeInfoSheet) {
                    OptimizeOriginalInfoView(localization: localization)
                }
            }
            
            // Encode progress + log
            if vm.isRunning {
                Text(localization.text(.labelElapsedTimeFormat, vm.elapsedSeconds/60, vm.elapsedSeconds%60))
                    .font(.caption)
                if vm.totalFiles > 0 {
                    ProgressView(value: vm.overallProgress)
                        .frame(height: 6)
                    Text(localization.text(.labelTotalProgressFormat, vm.currentFileIndex, vm.totalFiles))
                        .font(.caption)
                }
                if !vm.currentFileName.isEmpty {
                    ProgressView(value: vm.perFileProgress)
                        .frame(height: 6)
                    Text(localization.text(.labelCurrentFileFormat, vm.currentFileName))
                        .font(.caption)
                }
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(vm.encodeLogs, id: \.self) { log in
                            Text(log)
                                .font(.system(size: 11, design: .monospaced))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
                .frame(maxHeight: 200)
            }
            
            // Status label
            Text("\(localization.text(.labelStatusPrefix)) \(vm.status)")
                .font(.subheadline)
            
            Spacer()
            
            // Action buttons
            HStack {
                Button(localization.text(.buttonStart)) { vm.start() }
                    .buttonStyle(.borderedProminent)
                    .disabled(vm.sourceURL == nil || vm.isRunning)
                
                Button(localization.text(.buttonCancel)) { vm.cancel() }
                    .buttonStyle(.bordered)
                    .disabled(!vm.isRunning)
                
                Spacer()
                
                Button {
                    if vm.isRunning {
                        showSettingsWhileRunningAlert = true
                    } else {
                        showSettingsSheet = true
                    }
                } label: {
                    Image(systemName: "gearshape")
                }
                .buttonStyle(.borderless)
                .help(localization.text(.helpSettingsTooltip))
            }
        }
        .padding(20)
        .frame(width: 720, height: 500)
        .fixedSize()
        .alert(localization.text(.alertErrorTitle),
               isPresented: Binding(
                    get: { vm.errorMessage != nil },
                    set: { newValue in
                        if !newValue {
                            vm.errorMessage = nil
                        }
                    }
               )
        ) {
            Button(localization.text(.alertErrorOk), role: .cancel) {}
        } message: {
            Text(vm.errorMessage ?? localization.text(.alertErrorUnknown))
        }
        .alert(localization.text(.alertSettingsLockedTitle),
               isPresented: $showSettingsWhileRunningAlert) {
            Button(localization.text(.alertSettingsLockedOk), role: .cancel) { }
        } message: {
            Text(localization.text(.alertSettingsLockedMessage))
        }
        .sheet(isPresented: $showHelpSheet) {
            HelpView(localization: localization)
        }
        .sheet(isPresented: $showInstallSheet) {
            InstallHandBrakeView(localization: localization)
        }
        .sheet(isPresented: $showSettingsSheet) {
            SettingsView(localization: localization, appConfig: appConfig)
        }
        .onAppear {
            // Configure the main window to be fixed-size and non-fullscreen.
            // Dispatching asynchronously ensures the window has been created
            // and attached before we mutate its style mask.
            DispatchQueue.main.async {
                guard let window = NSApp.keyWindow ?? NSApp.windows.first else { return }
                
                window.styleMask.remove(.resizable)
                window.collectionBehavior.remove(.fullScreenPrimary)
                window.minSize = NSSize(width: 720, height: 500)
                window.maxSize = NSSize(width: 720, height: 500)
                
                if let zoomButton = window.standardWindowButton(.zoomButton) {
                    zoomButton.isEnabled = false
                }
                if let fullScreenButton = window.standardWindowButton(.fullScreenButton) {
                    fullScreenButton.isEnabled = false
                }
            }
        }
    }
}

















//
//  EncoderType.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//


/// Represents the available encoder types supported by the batch compressor.
///
/// Each case maps to a concrete encoder configuration or a custom mode
/// that is later built by `CompressorViewModel`.
// MARK: - Encoder Types
enum EncoderType: String, CaseIterable, Identifiable {
    case `defaultPreset` = "Default (x265 preset)"
    case x264 = "x264"
    case x265 = "x265"
    case vt_h264 = "vt_h264"
    case vt_h265 = "vt_h265"
    case custom = "Custom"
    
    var id: String { self.rawValue }
    
    /// The default HandBrakeCLI argument list associated with this encoder type.
    ///
    /// For `.custom`, this property returns an empty array because the arguments
    /// are constructed dynamically by `CompressorViewModel.start()`.
    var cliArgs: [String] {
        switch self {
        case .defaultPreset:
            return ["-e", "x265", "-q", "24", "-r", "30", "--pfr", "--optimize"]
        case .x264:
            return ["-e", "x264", "-q", "20", "--optimize"]
        case .x265:
            return ["-e", "x265", "-q", "24", "--optimize"]
        case .vt_h264:
            return ["--encoder", "vt_h264", "--quality", "70"]
        case .vt_h265:
            return ["--encoder", "vt_h265", "--quality", "70"]
        case .custom:
            return []
        }
    }
}

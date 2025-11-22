//
//  FileSystem.swift
//  HandBrake Batch Compressor
//
//  Created by Kemal Sanli on 22.11.2025.
//

import Foundation

/// Abstraction over filesystem operations used by the batch compressor.
///
/// This protocol allows `CompressorViewModel` to be tested with a mock
/// filesystem implementation without touching the real disk.
protocol FileSystem {
    func fileExists(atPath path: String) -> Bool
    func isExecutableFile(atPath path: String) -> Bool
    func attributesOfItem(atPath path: String) throws -> [FileAttributeKey: Any]
    func createDirectory(at url: URL, withIntermediateDirectories: Bool) throws
    func removeItem(at url: URL) throws
    func moveItem(at srcURL: URL, to dstURL: URL) throws
    func copyItem(at srcURL: URL, to dstURL: URL) throws
    func enumerator(at url: URL) -> FileManager.DirectoryEnumerator?
}

/// Default `FileSystem` implementation backed by `FileManager`.
extension FileManager: FileSystem {
    func createDirectory(at url: URL, withIntermediateDirectories createIntermediates: Bool) throws {
        try createDirectory(at: url, withIntermediateDirectories: createIntermediates, attributes: nil)
    }
    
    func enumerator(at url: URL) -> FileManager.DirectoryEnumerator? {
        enumerator(
            at: url,
            includingPropertiesForKeys: [.isRegularFileKey],
            options: [.skipsHiddenFiles]
        )
    }
}

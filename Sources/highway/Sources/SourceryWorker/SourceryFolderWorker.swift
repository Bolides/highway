//
//  ZFileFolderWorker.swift
//  AutomateZFile
//
//  Created by Stijn on 24/12/2018.
//  Copyright © 2018 dooz. All rights reserved.
//

import Foundation
import FoundationGenericHelper
import SourceryAutoProtocols
import ZFile

public protocol SourceryFolderWorkerProtocol: AutoMockable
{
    /// sourcery:inline:ZFileFolderWorker.AutoGenerateProtocol
    var srcRoot: (folder: FolderProtocol, key: SourceryFolderWorker.Key) { get }

    init(bundle: BundleProtocol) throws
    /// sourcery:end
}

public struct SourceryFolderWorker: SourceryFolderWorkerProtocol, AutoGenerateProtocol
{
    public enum Key: String
    {
        case scrRoot = "BE_DOOZ_SRCROOT"
    }

    public let srcRoot: (folder: FolderProtocol, key: SourceryFolderWorker.Key)

    // sourcery:inlcudeInitInProtocol
    public init(bundle: BundleProtocol) throws
    {
        srcRoot = (try Folder(path: try bundle.string(for: AnyRawRepresentable(Key.scrRoot))), Key.scrRoot)
    }
}

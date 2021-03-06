//
//  FolderExecutable.swift
//  ZBot
//
//  Created by Stijn on 31/10/2018.
//

import Foundation
import ZFile

public struct CDToFolderExecutable: ArgumentExecutableProtocol
{
    private let folder: FolderProtocol

    public init(to folder: FolderProtocol)
    {
        self.folder = folder
    }

    public func arguments() throws -> Arguments
    {
        return Arguments(arrayLiteral: "\(folder.path)")
    }

    public func executableFile() throws -> FileProtocol
    {
        return try File(path: "/usr/bin/cd")
    }
}

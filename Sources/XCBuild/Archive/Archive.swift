import Foundation
import SourceryAutoProtocols
import Url
import ZFile

public protocol ArchiveProtocol: AutoMockable
{
    // highway:inline:Archive.AutoGenerateProtocol
    var archiveFolder: FolderProtocol { get }
    var appFolder: FolderProtocol { get }
    var plist: ArchivePlistProtocol { get }
    // highway:end
}

public struct Archive: ArchiveProtocol, AutoGenerateProtocol
{
    public let archiveFolder: FolderProtocol
    public let appFolder: FolderProtocol
    public let plist: ArchivePlistProtocol

    // MARK: - Init

    init(archiveFolder: FolderProtocol, fileSystem _: FileSystemProtocol) throws
    {
        self.archiveFolder = archiveFolder

        let infoPlistData = try archiveFolder.file(named: "Info.plist").read()

        plist = try PropertyListDecoder().decode(ArchivePlist.self, from: infoPlistData)

        appFolder = try archiveFolder.subfolder(named: "Products")
    }
}

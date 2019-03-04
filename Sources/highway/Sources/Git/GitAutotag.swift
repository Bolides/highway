import Arguments
import Foundation
import Task
import Url
import ZFile
import Terminal

public final class GitAutotag
{
    // MARK: - Properties

    public let terminal: TerminalWorkerProtocol
    public let systemExecutableProvider: SystemExecutableProviderProtocol

    // MARK: - Init

    public init(
        systemExecutableProvider: SystemExecutableProviderProtocol = SystemExecutableProvider.shared,
        terminal: TerminalWorkerProtocol = TerminalWorker.shared
    ) throws
    {
        self.terminal = terminal
        self.systemExecutableProvider = systemExecutableProvider
    }

    // MARK: - Tagging

    @discardableResult
    public func autotag(at url: FolderProtocol, dryRun: Bool = true) throws -> [String]
    {
        let arguments = Arguments(dryRun ? ["-n"] : [])
        let executable = try systemExecutableProvider.executable(with: "git-autotag")
        let task = Task(executable: executable)
        task.arguments = arguments
        task.currentDirectoryUrl = url
        task.enableReadableOutputDataCapturing()
        
        return try terminal.runProcess(task.toProcess)
    }
}

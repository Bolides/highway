
import Foundation
import ZFile

public final class GitAutotag
{
    // MARK: - Properties

    public let terminal: TerminalProtocol
    public let systemExecutableProvider: SystemProtocol

    // MARK: - Init

    public init(
        systemExecutableProvider: SystemProtocol = System.shared,
        terminal: TerminalProtocol = Terminal.shared
    ) throws
    {
        self.terminal = terminal
        self.systemExecutableProvider = systemExecutableProvider
    }

    // MARK: - Tagging

    @discardableResult
    public func autotag(dryRun: Bool = true) throws -> [String]
    {
        let arguments = Arguments(dryRun ? ["-n"] : [])
        let executable = try systemExecutableProvider.executable(with: "git-autotag")
        let task = Task(executable: executable)
        task.arguments = arguments
        task.enableReadableOutputDataCapturing()

        return try terminal.runProcess(task.toProcess)
    }
}

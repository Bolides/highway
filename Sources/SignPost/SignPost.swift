import Foundation
import SourceryAutoProtocols

public protocol SignPostProtocol: AutoMockable {
    /// sourcery:inline:SignPost.AutoGenerateProtocol
    static var shared: SignPostProtocol { get }
    var verbose: Bool { get set }

    func write(printer: Printer)
    func write(printable: Printable)
    // sourcery:"Always printed as error"
    func error(_ text: String)
    func success(_ text: String)
    func message(_ text: String)
    // sourcery:"Prints text only if --verbose is set."
    func verbose(_ text: String)
    func print(_ printable: Printable)
    func verbosePrint(_ printable: Printable)
    
    /// sourcery:end
}

/// Use this class to delivers messages to the user.
public class SignPost: SignPostProtocol, AutoGenerateProtocol {
    public static let shared: SignPostProtocol = SignPost()

    public var verbose = false

    // MARK: - Init
    public init() { }
    
    // MARK: - Private
    
    private let queue = DispatchQueue(label: "de.christian-kienle.highway.terminal")
    private var promptTemplate = Prompt.normal
    private let stream = FileStream(fd: stdout)
    
    private func log(_ text: String) {
        rawLog("\n\r" + self.promptTemplate.terminalString + text + "\n")
    }
    private func rawLog(_ text: String) {
        _sync {
            stream.write(text)
        }
    }
    private func rawLogNl(_ text: String) {
        _sync {
            stream.write("\r" + text + "\n")
        }
    }
    // MARK: - Write Stuff
    public func write(printer: Printer) {
        _sync {
            self._write(printer: printer)
        }
    }
    private func _write(printer: Printer) {
        let string = printer.string(with: .defaultOptions())
        stream.write(string)
    }
    
    public func write(printable: Printable) {
        _sync {
            self._write(printable: printable)
        }
    }
    
    private func _write(printable: Printable) {
        let string = printable.printableString(with: .defaultOptions())
        stream.write(string)
    }
    
    // MARK: - Working with the Queue
    /// Execute handler on the terminal queue
    private func _sync(_ handler: ()->()) {
        queue.sync {
            handler()
        }
    }
}

fileprivate extension SignPost {
    func _withPrompt(_ text: String) -> String {
        return promptTemplate.terminalString + text
    }
}

extension SignPost {
    
    // sourcery:"Always printed as error"
    public func error(_ text: String) {
        rawLogNl(_withPrompt(text))
    }
    public func success(_ text: String) {
        rawLogNl(_withPrompt(text))
    }
    
    public func message(_ text: String) {
        rawLogNl(_withPrompt(text))
    }
    
    // sourcery:"Prints text only if --verbose is set."
    public func verbose(_ text: String) {
        guard self.verbose else { return }
        rawLogNl(_withPrompt(text))
    }
    
    public func print(_ printable: Printable) {
        rawLog(printable.printableString(with: .defaultOptions()))
    }
    
    /// Prints printable only if --verbose is set.
    public func verbosePrint(_ printable: Printable) {
        guard self.verbose else { return }
        rawLog(printable.printableString(with: .defaultOptions()))
    }

}



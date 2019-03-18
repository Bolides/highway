// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

//: Do not change this code as it is autogenerated every time you build.
//: You can change the code in `../StencilTemplatesForSourcery/Application/AutoGenerateProtocol
import Foundation

// MARK: - AutoGenerateProtocol

//: From all Types implementing this protocol Sourcery adds:
//: - public/internal variables // private variables are ignored
//: - public/internal methods (skips initializers)
//: - initializers marked with annotation // sourcery:includeInitInProtocol
//: - of the above it does not add it if  // sourcery:skipProtocol
//: ---

/*

 // Generated protocol inline for Sourcery -> See code in the file of that type
 // sourcery:inline:Sourcery.AutoGenerateProtocol
 var uuid: String { get }
 var name: String { get }
 var templateFolder: FolderProtocol { get }
 var outputFolder: FolderProtocol { get }
 var sourcesFolders: [FolderProtocol] { get }
 var individualSourceFiles: [File]? { get }
 var sourceryAutoProtocolsFile: FileProtocol { get }
 var sourceryYMLFile: FileProtocol { get }
 var sourceryExecutableFile: FileProtocol { get }
 var imports: Set<TemplatePrepend> { get }

 init(
   productName: String,
   swiftPackageDependencies: DependencyProtocol,
   swiftPackageDump: DumpProtocol,
   sourceryExecutable: FileProtocol,
   signPost: SignPostProtocol
 )  throws
 // sourcery:end
 // Generated protocol inline for SourceryBuilder -> See code in the file of that type
 // sourcery:inline:SourceryBuilder.AutoGenerateProtocol
 static var executalbeName: String { get }

 init(
   swiftPackageWithSourceryFolder: FolderProtocol,
   terminal: TerminalProtocol,
   signPost: SignPostProtocol,
   systemExecutableProvider: SystemExecutableProviderProtocol
 )
 func attemptToBuildSourceryIfNeeded() throws  -> FileProtocol
 // sourcery:end
 // Generated protocol inline for SourceryWorker -> See code in the file of that type
 // sourcery:inline:SourceryWorker.AutoGenerateProtocol
 var sourcery: SourceryProtocol { get }

 init(
   sourcery: SourceryProtocol,
   terminalWorker: TerminalProtocol,
   signPost: SignPostProtocol,
   queue: HighwayDispatchProtocol
 )  throws
 func executor() throws  -> ArgumentExecutableProtocol
 func attempt(_ asyncSourceryWorkerOutput: @escaping (@escaping SourceryWorker.SyncOutput) -> Void)
 // sourcery:end
 // Generated protocol inline for TemplatePrepend -> See code in the file of that type
 // sourcery:inline:TemplatePrepend.AutoGenerateProtocol
 var names: Set<TemplatePrepend.Import> { get }
 var template: String { get }

 // sourcery:end
 // Generated protocol inline for TemplatePrepend.Import -> See code in the file of that type
 // sourcery:inline:TemplatePrepend.Import.AutoGenerateProtocol
 var name: String { get }
 var testable: Bool { get }

 // sourcery:end
 // Generated protocol inline for  -> See code in the file of that type

 // Generated protocol inline for  -> See code in the file of that type

 // Generated protocol inline for  -> See code in the file of that type

 // Generated protocol inline for  -> See code in the file of that type

 // Generated protocol inline for  -> See code in the file of that type

 // Generated protocol inline for  -> See code in the file of that type

 // Generated protocol inline for  -> See code in the file of that type

 // Generated protocol inline for  -> See code in the file of that type

 // Generated protocol inline for  -> See code in the file of that type

 // Generated protocol inline for  -> See code in the file of that type

 // Generated protocol inline for  -> See code in the file of that type

 */

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

 // Generated protocol inline for Archive -> See code in the file of that type
 // sourcery:inline:Archive.AutoGenerateProtocol
 var archiveFolder: FolderProtocol { get }
 var appFolder: FolderProtocol { get }
 var plist: ArchivePlistProtocol { get }

 // sourcery:end
 // Generated protocol inline for ArchiveOptions -> See code in the file of that type
 // sourcery:inline:ArchiveOptions.AutoGenerateProtocol
 var scheme: String { get }
 var project: String { get }
 var destination: DestinationProtocol { get }
 var archivePath: String { get }

 // sourcery:end
 // Generated protocol inline for ArchivePlist -> See code in the file of that type
 // sourcery:inline:ArchivePlist.AutoGenerateProtocol
 var applicationProperties: String { get }
 var applicationPath: String { get }

 // sourcery:end
 // Generated protocol inline for Destination -> See code in the file of that type
 // sourcery:inline:Destination.AutoGenerateProtocol
 var raw: [String: String] { get set }
 var asString: String { get }

 // sourcery:end
 // Generated protocol inline for DestinationFactory -> See code in the file of that type
 // sourcery:inline:DestinationFactory.AutoGenerateProtocol

 func macOS(architecture: Destination.Architecture) -> Destination
 func device(_ device: Destination.Device, name: String?, isGeneric: Bool, id: String?) -> Destination
 func simulator(_ simulator: Destination.Simulator, name: String, os: Destination.OS, id: String?) -> Destination
 // sourcery:end
 // Generated protocol inline for Export -> See code in the file of that type
 // sourcery:inline:Export.AutoGenerateProtocol
 var folder: FolderProtocol { get }
 var ipa: FileProtocol { get }

 // sourcery:end
 // Generated protocol inline for ExportArchiveOptions -> See code in the file of that type
 // sourcery:inline:ExportArchiveOptions.AutoGenerateProtocol
 var archivePath: FolderProtocol { get }
 var exportPath: String { get }

 func encode(to encoder: Encoder) throws
 // sourcery:end
 // Generated protocol inline for MinimalTestOptions -> See code in the file of that type
 // sourcery:inline:MinimalTestOptions.AutoGenerateProtocol
 var description: String { get }

 func arguments() throws  -> Arguments
 // sourcery:end
 // Generated protocol inline for TestOptions -> See code in the file of that type
 // sourcery:inline:TestOptions.AutoGenerateProtocol
 var scheme: String { get }
 var project: String { get }
 var destination: DestinationProtocol { get }
 var resultBundlePath: String { get }
 var derivedDataPath: FolderProtocol? { get }

 func arguments() throws  -> Arguments
 func executableFile() throws  -> FileProtocol
 // sourcery:end
 // Generated protocol inline for TestReport -> See code in the file of that type
 // sourcery:inline:TestReport.AutoGenerateProtocol
 var failingTests: ArraySlice<String>? { get }
 var buildErrors: [String]? { get }
 var output: [String] { get }
 var description: String { get }

 func failedTests() -> String
 // sourcery:end
 // Generated protocol inline for XCBuild -> See code in the file of that type
 // sourcery:inline:XCBuild.AutoGenerateProtocol

 func findPosibleDestinations(for scheme: String, in workspace: FolderProtocol) throws  -> [String]
 func archive(using options: ArchiveOptionsProtocol) throws  -> ArchiveProtocol
 func export(using options: ExportArchiveOptionsProtocol) throws  -> ExportProtocol
 func buildAndTest(using options: MinimalTestOptionsProtocol) throws  -> TestReportProtocol
 // sourcery:end
 // Generated protocol inline for XCBuildDestinations -> See code in the file of that type
 // sourcery:inline:XCBuildDestinations.AutoGenerateProtocol
 var platform: Destination.Platform { get }
 var id: String { get }
 var name: String { get }
 var os: Destination.OS { get }

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

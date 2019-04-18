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

// version 5.5
/*

 // types.implementing.AutoGenerateProtocol inline for Highway ..
 // sourcery:inline:Highway.AutoGenerateProtocol
 static var queue: HighwayDispatchProtocol { get }
 var package: PackageProtocol { get }
 var sourceryBuilder: SourceryBuilderProtocol? { get }
 var sourceryWorkers: [SourceryWorkerProtocol]? { get set }
 var queue: HighwayDispatchProtocol { get }
 var githooks: GitHooksWorkerProtocol? { get }
 var swiftformat: SwiftFormatWorkerProtocol { get }
 static var xcodeConfigOverride: [String] { get set }
 static var swiftCFlags: [String] { get set }
 var highwaySetupExecutableName: String? { get }

 func dependency(with name: String) throws  -> DependencyProtocol
 func gitHooks() throws  -> FolderProtocol
 func srcRoot() throws  -> FolderProtocol
 func templateFolder() throws  -> FolderProtocol
 func templateFolder(expectedName: String) throws  -> FolderProtocol
 func sourceryFolder() throws  -> FolderProtocol
 func sourceryAutoProtocolFile() throws  -> FileProtocol
 // sourcery:end
 // types.implementing.AutoGenerateProtocol inline for Highway ✅
 // types.implementing.AutoGenerateProtocol inline for Highway.Package ..
 // sourcery:inline:Highway.Package.AutoGenerateProtocol
 var name: String { get }
 var dependencies: DependencyProtocol { get }
 var dump: DumpProtocol { get }

 // sourcery:end
 // types.implementing.AutoGenerateProtocol inline for Highway.Package ✅
 // types.implementing.AutoGenerateProtocol inline for HighwayRunner ..
 // sourcery:inline:HighwayRunner.AutoGenerateProtocol
 static var queue: HighwayDispatchProtocol { get }
 var errors: [Swift.Error]? { get set }
 var highway: HighwayProtocol { get }

 func runTests(_ async: @escaping (@escaping HighwayRunner.SyncTestOutput) -> Void)
 func runSourcery(_ async: @escaping (@escaping SourceryWorker.SyncOutput) -> Void)
 func addGithooksPrePush() throws
 func runSwiftformat(_ async: @escaping (@escaping HighwayRunner.SyncSwiftformat) -> Void)
 func runSwiftPackageGenerateXcodeProject(_ async: @escaping (@escaping HighwayRunner.SyncSwiftPackageGenerateXcodeProj) -> Void)
 // sourcery:end
 // types.implementing.AutoGenerateProtocol inline for HighwayRunner ✅

 */

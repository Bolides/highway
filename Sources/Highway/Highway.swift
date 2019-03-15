//
//  SignPostPackages.swift
//  SPRunner
//
//  Created by Stijn Willems on 13/03/2019.
//

import Arguments
import Foundation
import GitHooks
import HighwayDispatch
import SignPost
import SourceryAutoProtocols
import SourceryWorker
import SwiftFormatWorker
import Terminal
import ZFile

public protocol HighwayProtocol: AutoMockable
{
    // sourcery:inline:Packages.AutoGenerateProtocol
    var packages: [PackageProtocol] { get }
    var sourceryBuilder: SourceryBuilderProtocol { get }
    var sourceryWorkers: [SourceryWorkerProtocol] { get }
    var queue: HighwayDispatchProtocol { get }
    var githooks: GitHooksWorkerProtocol { get }
    var swiftformat: SwiftFormatWorkerProtocol { get }
    // sourcery:end
}

public protocol PackageProtocol: AutoMockable
{
    // sourcery:inline:Highway.Package.AutoGenerateProtocol
    var name: String { get }
    var dependencies: DependencyProtocol { get }
    var dump: DumpProtocol { get }
    // sourcery:end
}

public struct Highway: HighwayProtocol, AutoGenerateProtocol
{
    public static let queue: HighwayDispatchProtocol = DispatchQueue(label: "be.dooz.highway")

    public struct Package: PackageProtocol, AutoGenerateProtocol
    {
        public let name: String
        public let dependencies: DependencyProtocol
        public let dump: DumpProtocol
    }

    public let packages: [PackageProtocol]
    public let rootPackage: PackageProtocol
    public let sourceryBuilder: SourceryBuilderProtocol
    public let sourceryWorkers: [SourceryWorkerProtocol]
    public let queue: HighwayDispatchProtocol
    public let githooks: GitHooksWorkerProtocol
    public let swiftformat: SwiftFormatWorkerProtocol

    // MARK: - STATIC - Generate Packages for Folders

    public static func package(for folder: FolderProtocol, dependencyService: DependencyServiceProtocol, terminal: TerminalProtocol = Terminal.shared) throws -> PackageProtocol
    {
        let originalFolder = FileSystem.shared.currentFolder
        FileManager.default.changeCurrentDirectoryPath(folder.path)

        let dependencies = try dependencyService.generateDependency()
        let highwayPackage = Highway.Package(
            name: folder.name,
            dependencies: dependencies,
            dump: try DumpService(terminal: terminal, swiftPackageDependencies: dependencies).dump
        )
        FileManager.default.changeCurrentDirectoryPath(originalFolder.path)
        return highwayPackage
    }

    // MARK: - Init

    // Will setup Highway in folder of srcRootDependencies and optionaly in the extra folders provided
    public init(
        rootPackage: PackageProtocol,
        highwaySetupPackage: (package: PackageProtocol, executable: String)?, // use the static function to optionally create package if it is not in the srcRootDependencies. This package will be used to create
        extraFolders: [FolderProtocol]? = nil, // Packages in these folders will be created
        dependencyService: DependencyServiceProtocol,
        swiftPackageWithSourceryFolder: FolderProtocol,
        swiftformatType: SwiftFormatWorkerProtocol.Type = SwiftFormatWorker.self,
        githooksType: GitHooksWorkerProtocol.Type = GitHooksWorker.self,
        sourceryWorkerType: SourceryWorkerProtocol.Type = SourceryWorker.self,
        sourceryBuilderType: SourceryBuilderProtocol.Type = SourceryBuilder.self,
        terminal: TerminalProtocol = Terminal.shared,
        signPost: SignPostProtocol = SignPost.shared,
        queue: HighwayDispatchProtocol = Highway.queue,
        sourceryType: SourceryProtocol.Type = Sourcery.self
    ) throws
    {
        self.queue = queue
        signPost.message("📦 \(Highway.self) ...")

        var packages = [PackageProtocol]()

        self.rootPackage = rootPackage

        packages.append(rootPackage)

        try extraFolders?.forEach { packages.append(try Highway.package(for: $0, dependencyService: dependencyService, terminal: terminal)) }

        signPost.message(
            """
            📦 \(Highway.self) for
            \(try packages.map { "  * \(try $0.dependencies.srcRoot().path)" }.joined(separator: "\n"))
            ✅
            """
        )
        self.packages = packages

        let builder = sourceryBuilderType.init(swiftPackageWithSourceryFolder: swiftPackageWithSourceryFolder, terminal: terminal, signPost: signPost, systemExecutableProvider: SystemExecutableProvider())
        sourceryBuilder = builder
        let sourcery = try builder.attemptToBuildSourceryIfNeeded()

        let temp: [[SourceryWorkerProtocol]] = try packages
            .compactMap
        { package in
            let dump = package.dump
            let dependencies = package.dependencies
            let products = dump.products.filter { !$0.name.hasSuffix("Mock") }

            let sourceryModels: [SourceryProtocol] = try products
                .map
            { product in
                try sourceryType.init(
                    productName: product.name,
                    swiftPackageDependencies: dependencies,
                    swiftPackageDump: dump,
                    sourceryExecutable: sourcery,
                    signPost: signPost
                )
            }
            return try sourceryModels.map { try sourceryWorkerType.init(sourcery: $0, terminalWorker: terminal, signPost: signPost, queue: queue) }
        }

        sourceryWorkers = temp.flatMap { $0 }

        if let highwaySetupPackage = highwaySetupPackage
        {
            githooks = githooksType.init(
                swiftPackageDependencies: highwaySetupPackage.package.dependencies,
                swiftPackageDump: highwaySetupPackage.package.dump,
                hwSetupExecutableProductName: highwaySetupPackage.executable,
                gitHooksFolder: try rootPackage.dependencies.srcRoot().subfolder(named: ".git/hooks"),
                signPost: signPost
            )
        }
        else
        {
            githooks = githooksType.init(
                swiftPackageDependencies: rootPackage.dependencies,
                swiftPackageDump: rootPackage.dump,
                hwSetupExecutableProductName: rootPackage.name,
                gitHooksFolder: try rootPackage.dependencies.srcRoot().subfolder(named: ".git/hooks"),
                signPost: signPost
            )
        }

        swiftformat = try swiftformatType.init(
            folderToFormatRecursive: try rootPackage.dependencies.srcRoot(),
            queue: queue,
            signPost: signPost
        )
    }
}

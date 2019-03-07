// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

public let package = Package(
    name: "Highway",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .executable(
            name: "HWSetup",
            targets: ["HWSetup"]),
        .library(
            name: "Errors",
            targets: ["Errors"]),
        .library(
            name: "GitHooks",
            targets: ["GitHooks"]),
        .library(
            name: "Arguments",
            targets: ["Arguments"]),
        .library(
            name: "ArgumentsMock",
            targets: ["ArgumentsMock"]),
        .library(
            name: "Url",
            targets: ["Url"]),
        .library(
            name: "POSIX",
            targets: ["POSIX"]),
        .library(
            name: "XCBuild",
            targets: ["XCBuild"]),
        .library(
            name: "XCBuildMock",
            targets: ["XCBuildMock"]),
        .library(
            name: "Terminal",
            targets: ["Terminal"]),
        .library(
            name: "TerminalMock",
            targets: ["TerminalMock"]),
        .library(
            name: "Git",
            targets: ["Git"]),
        .library(
            name: "SourceryWorker",
            targets: ["SourceryWorker"]),
        .library(
            name: "SourceryWorkerMock",
            targets: ["SourceryWorkerMock"]),
        .library(
            name: "SwiftFormatWorker",
            targets: ["SwiftFormatWorker"]),
        .library(
            name: "SwiftFormatWorkerMock",
            targets: ["SwiftFormatWorkerMock"]),
        .library(
            name: "CarthageWorker",
            targets: ["CarthageWorker"]),

    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://www.github.com/doozMen/ZFile", from: "2.0.2"),
        .package(url: "https://www.github.com/doozMen/SignPost", from: "1.0.0"),
        .package(url: "https://www.github.com/doozMen/template-sourcery", from: "1.2.2"),
        .package(url: "https://www.github.com/antitypical/Result", from: "4.1.0"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.39.4"),
        .package(url: "https://www.github.com/Quick/Quick", from: "1.3.4"),
        .package(url: "https://www.github.com/Quick/Nimble", from: "7.3.4"),
        .package(url: "https://www.github.com/doozMen/Sourcery", from: "0.16.3")
        ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Errors",
            dependencies: ["SourceryAutoProtocols"]
        ),
        .target(
            name: "Arguments",
            dependencies: ["SourceryAutoProtocols", "ZFile", "SignPost"]
        ),
        .target(
            name: "GitHooks",
            dependencies: ["SourceryAutoProtocols", "ZFile", "SignPost", "Terminal"]
        ),
        .testTarget(
            name: "GitHooksTests",
            dependencies: ["GitHooks", "Quick", "Nimble"]
        ),
        .target(
            name: "GitHooksMock",
            dependencies: ["SourceryAutoProtocols", "ZFile", "ZFileMock", "SignPost", "GitHooks"],
            path: "Sources/Generated/GitHooks"
        ),
        .target(
            name: "ArgumentsMock",
            dependencies: ["SourceryAutoProtocols", "ZFile", "ZFileMock", "SignPost", "Arguments"],
            path: "Sources/Generated/Arguments"
        ),
        .target(
            name: "Url",
            dependencies: []
        ),
        .target(
            name: "POSIX",
            dependencies: ["Url"]
        ),
        .testTarget(
            name: "POSIXTests",
            dependencies: ["POSIX", "Quick", "Nimble"]
        ),
        .target(
            name: "XCBuild",
            dependencies: ["Arguments", "Errors", "Url", "POSIX", "Terminal", "Result"]
        ),
        .testTarget(
            name: "XCBuildTests",
            dependencies: [
                "Terminal",
                "XCBuild",
                "TerminalMock",
                "Arguments",
                "ArgumentsMock",
                "XCBuildMock",
                "ZFileMock",
                "Quick", "Nimble"]
        ),
        .target(
            name: "XCBuildMock",
            dependencies: ["ZFile", "ZFileMock", "XCBuild", "Arguments", "SignPost"],
            path: "Sources/Generated/XCBuild"
        ),
        .target(
            name: "Terminal",
            dependencies: ["POSIX", "Arguments"]
        ),
         .target(
            name: "TerminalMock",
            dependencies: ["Terminal", "ZFile", "ZFileMock", "Arguments", "SourceryAutoProtocols"],
            path:"Sources/Generated/Terminal"
        ),
        .testTarget(
            name: "TerminalTests",
            dependencies: ["Terminal", "Quick", "Nimble"]
        ),
        .target(
            name: "Git",
            dependencies: ["Terminal", "Url", "Arguments", "Errors"]
        ),
        .testTarget(
            name: "GitTests",
            dependencies: ["Git", "Quick", "Nimble"]
        ),
        .target(
            name: "SourceryWorker",
            dependencies: ["Terminal"]
        ),
        .target(
            name: "SourceryWorkerMock",
            dependencies: ["SourceryWorker", "ZFileMock"],
            path: "Sources/Generated/SourceryWorker"
        ),
        .testTarget(
            name: "SourceryWorkerTests",
        dependencies: ["SourceryWorker", "SignPostMock", "SourceryWorkerMock", "Quick", "Nimble", "TerminalMock", "SignPostMock"]
        ),
        .target(
            name: "SwiftFormatWorker",
            dependencies: ["Errors", "Arguments", "FoundationGenericHelper", "ZFile", "SwiftFormat"]
        ),
        .target(
            name: "SwiftFormatWorkerMock",
            dependencies: ["SwiftFormatWorker", "ZFileMock", "SwiftFormatWorker"],
            path: "Sources/Generated/SwiftFormatWorker"
        ),
        .testTarget(
            name: "SwiftFormatWorkerTests",
            dependencies: ["SwiftFormatWorker", "SwiftFormatWorkerMock", "SignPostMock", "Quick", "Nimble"]
        ),
        .target(
                name: "CarthageWorker",
                dependencies: ["SourceryAutoProtocols"]
        ),
        .testTarget(
            name: "CarthageWorkerTests",
            dependencies: ["CarthageWorker", "SignPostMock", "Quick", "Nimble"]
        ),
        .target(
            name:   "HWSetup",
            dependencies: [
                    "Arguments",
                    "Errors",
                    "SignPost",
                    "SourceryAutoProtocols",
                    "SourceryWorker",
                    "SwiftFormatWorker",
                    "Terminal",
                    "ZFile",
                    "XCBuild",
                    "GitHooks"
            ]
        )
    ]
)

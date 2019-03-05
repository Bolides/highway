// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Highway",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Errors",
            targets: ["Errors"]),
        .library(
            name: "Arguments",
            targets: ["Arguments"]),
        .library(
            name: "ArgumentsMock",
            targets: ["ArgumentsMock"]),
        .library(
            name: "Url",
            targets: ["Url"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://www.github.com/doozMen/ZFile", from: "2.0.1"),
        .package(url: "https://www.github.com/doozMen/SignPost", from: "1.0.0"),
        .package(url: "https://www.github.com/doozMen/template-sourcery", from: "1.2.0"),
        ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Errors",
            dependencies: ["SourceryAutoProtocols"],
            path: "Sources/highway/Sources/Errors"
        ),
        .target(
            name: "Arguments",
            dependencies: ["SourceryAutoProtocols", "ZFile", "SignPost"],
            path: "Sources/highway/Sources/Arguments"
        ),
        .target(
            name: "ArgumentsMock",
            dependencies: ["SourceryAutoProtocols", "ZFile", "ZFileMock", "SignPost", "Arguments"],
            path: "Sources/highway/Sources/AutoGeneratedCode/Arguments"
        ),
        .target(
            name: "Url",
            dependencies: [],
            path: "Sources/highway/Sources/Url"
        )
    ]
)

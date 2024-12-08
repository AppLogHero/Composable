// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Composable",
    platforms: [.iOS(.v17), .macOS(.v14), .watchOS(.v10), .visionOS(.v2)],
    products: [        .library(
            name: "Composable",
            targets: ["Composable"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins.git", exact: "0.57.1")
    ],
    targets: [
        .target(
            name: "Composable",
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        ),
        .testTarget(
            name: "ComposableTests",
            dependencies: ["Composable"]
        ),
    ]
)

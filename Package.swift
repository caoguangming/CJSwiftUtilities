// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "CJSwiftUtilities",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "CJSwiftUtilities",
            targets: ["CJSwiftUtilities"]
        )
    ],
    targets: [
        .target(
            name: "CJSwiftUtilities",
            dependencies: [],
            path: "Sources/CJSwiftUtilities"
        )
    ]
)

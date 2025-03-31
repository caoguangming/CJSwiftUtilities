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
    dependencies: [
        .package(url: "https://github.com/siteline/swiftui-introspect", from: "1.3.0")
    ],
    targets: [
        .target(
            name: "CJSwiftUtilities",
            dependencies: [
                .product(name: "SwiftUIIntrospect", package: "swiftui-introspect")
            ],
            path: "CJSwiftUtilities/Sources/CJSwiftUtilities"
        )
    ]
)

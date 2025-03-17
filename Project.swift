import ProjectDescription

let project = Project(
    name: "CJSwiftUtilities",
    targets: [
        .target(
            name: "CJSwiftUtilities",
            destinations: .iOS,
            product: .framework,
            bundleId: "io.tuist.CJSwiftUtilities",
            infoPlist: .default,
            sources: ["CJSwiftUtilities/Sources/CJSwiftUtilities/**"],
            resources: ["CJSwiftUtilities/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "CJSwiftUtilitiesTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.CJSwiftUtilitiesTests",
            infoPlist: .default,
            sources: ["CJSwiftUtilities/Tests/**"],
            resources: [],
            dependencies: [.target(name: "CJSwiftUtilities")]
        ),
    ]
)

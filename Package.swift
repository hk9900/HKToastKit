// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "HKToastKit",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "HKToastKit",
            targets: ["HKToastKit"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "HKToastKit",
            dependencies: []
        ),
        .testTarget(
            name: "HKToastKitTests",
            dependencies: ["HKToastKit"]
        ),
    ]
)


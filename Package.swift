// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreDataStack",
    platforms: [.iOS(.v14), .macOS(.v10_15)],
    products: [
        .library(
            name: "CoreDataStack",
            targets: ["CoreDataStack"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "CoreDataStack",
            dependencies: []),
        .testTarget(
            name: "CoreDataStackTests",
            dependencies: ["CoreDataStack"]),
    ]
)

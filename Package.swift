// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MegaMathLib",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "MathLib",
            targets: ["MegaMathLibTargets"]),
        .library(
            name: "MathLibEx",
            targets: ["MegaMathLibTargets"]),
    ],
    targets: [
        .binaryTarget(name: "MathLib", path: "./Sources/MathLib.xcframework"),
        .binaryTarget(name: "MathLibEx", path: "./Sources/MathLibEx.xcframework"),
        .binaryTarget(name: "AdditionCalculator", path: "./Sources/AdditionCalculator.xcframework"),
        .target(name: "MegaMathLibTargets", dependencies: [
            .target(name: "MathLib", condition: .when(platforms: [.iOS])),
            .target(name: "MathLibEx", condition: .when(platforms: [.iOS])),
            .target(name: "AdditionCalculator", condition: .when(platforms: [.iOS])),
            ],
            path:"./Sources/MegaMathLibTargets")
    ]
)

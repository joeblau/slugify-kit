// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SlugifyKit",
    products: [
        .library(
            name: "SlugifyKit",
            targets: ["SlugifyKit"]),
    ],
    targets: [
        .target(
            name: "SlugifyKit",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "SlugifyKitTests",
            dependencies: ["SlugifyKit"],
            path: "Tests"),
    ]
)

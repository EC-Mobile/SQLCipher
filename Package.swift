// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SQLCipher",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SQLCipher",
            targets: ["SQLCipher"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SQLCipher",
            cSettings: [
                .define("SQLITE_HAS_CODEC=1"),
                .define("SQLITE_TEMP_STORE=3"),
                .define("SQLCIPHER_CRYPTO_CC"),
                .define("NDEBUG"),
            ],
            linkerSettings: [
                .linkedFramework("Foundation"),
                .linkedFramework ("Security"),
            ]
            ),
        .testTarget(
            name: "SQLCipherTests",
            dependencies: ["SQLCipher"]
        ),
    ]
)
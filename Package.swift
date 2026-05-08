// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "Scintilla",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(name: "ScintillaView", targets: ["ScintillaView"])
    ],
    dependencies: [

    ],
    targets: [
        .target(
            name: "ScintillaView",
            resources: [
                .process("Resources")
            ],
            linkerSettings: [
                .linkedLibrary("c++"),
                .linkedFramework("AppKit"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("CoreText"),
            ]
        )
    ],
    cxxLanguageStandard: .cxx17
)

// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "Scintilla",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(name: "Scintilla", targets: ["Scintilla"]),
        .library(name: "ScintillaView", targets: ["ScintillaView"]),
    ],
    dependencies: [

    ],
    targets: [
        .target(
            name: "Scintilla",
            cxxSettings: [
                .unsafeFlags(["-fcxx-modules"])
            ],
            linkerSettings: [
                .linkedLibrary("c++"),
                .linkedFramework("AppKit"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("CoreGraphics"),
            ]
        ),
        .target(
            name: "ScintillaView",
            dependencies: [
                .target(name: "Scintilla")
            ],
            resources: [
                .process("Resources")
            ],
            cxxSettings: [
                .headerSearchPath("../Scintilla/include"),
                .headerSearchPath("../Scintilla/src"),
            ],
            linkerSettings: [
                .linkedLibrary("c++"),
                .linkedFramework("Cocoa"),
                .linkedFramework("QuartzCore"),
            ]
        ),
    ],
    cxxLanguageStandard: .cxx17
)

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
                .define("std=c++17")
            ],
            linkerSettings: [
                .linkedLibrary("c++")
            ]
        ),
        .target(
            name: "ScintillaView",
            dependencies: [
                .target(name: "Scintilla")
            ],
            cxxSettings: [
                .define("std=c++17"),
                .unsafeFlags(["-fcxx-modules"]),  // 对应 Podspec 的 compiler_flags
            ]
        ),
    ],
    cxxLanguageStandard: .cxx17
)

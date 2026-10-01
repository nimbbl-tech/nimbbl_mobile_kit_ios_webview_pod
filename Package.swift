// swift-tools-version:5.9
import PackageDescription

// Nimbbl WebView SDK — Swift Package Manager (BINARY distribution).
//
// Public "pod" repo shipping the SDK as a prebuilt, closed-source XCFramework
// (same artifact as CocoaPods). No source is exposed.
//
// The WebView binary depends on the Core module, so this package pulls the Core
// pod (also binary) transitively. A `binaryTarget` cannot declare dependencies,
// so a tiny wrapper target (NimbblWebViewSPM) carries the Core dependency and
// re-exports both modules. Merchants add ONLY this package and write:
//
//     import nimbbl_mobile_kit_ios_webview_sdk
//
// LOCAL DEV: replace the Core .package(url:exact:) with
//   .package(name: "nimbbl_mobile_kit_ios_core_api_sdk", path: "../nimbbl_mobile_kit_ios_core_api_pod")
// Do not commit that change.
let package = Package(
    name: "nimbbl_mobile_kit_ios_webview_sdk",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "nimbbl_mobile_kit_ios_webview_sdk",
            targets: ["NimbblWebViewSPM"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_core_api_pod.git",
            exact: "2.1.0-alpha.2"
        )
    ],
    targets: [
        .binaryTarget(
            name: "nimbbl_mobile_kit_ios_webview_sdk_binary",
            path: "nimbbl_mobile_kit_ios_webview_sdk.xcframework"
        ),
        .target(
            name: "NimbblWebViewSPM",
            dependencies: [
                "nimbbl_mobile_kit_ios_webview_sdk_binary",
                .product(
                    name: "nimbbl_mobile_kit_ios_core_api_sdk",
                    package: "nimbbl_mobile_kit_ios_core_api_pod"
                )
            ],
            path: "SPM/NimbblWebViewSPM"
        )
    ]
)

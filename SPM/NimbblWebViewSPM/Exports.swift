// Wrapper module for SPM binary distribution.
//
// Re-exports the WebView and Core binary modules so that adding only the
// WebView pod package makes both APIs available with a single import:
//
//     import nimbbl_mobile_kit_ios_webview_sdk
//
// This target exists solely to attach the Core dependency to the WebView
// binaryTarget (a binaryTarget cannot declare dependencies of its own).
@_exported import nimbbl_mobile_kit_ios_webview_sdk
@_exported import nimbbl_mobile_kit_ios_core_api_sdk

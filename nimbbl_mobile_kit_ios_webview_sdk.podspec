Pod::Spec.new do |spec|
  spec.name         = "nimbbl_mobile_kit_ios_webview_sdk"
  spec.version      = "1.0.9"
  spec.summary      = "Nimbbl WebView SDK for iOS"
  spec.description  = "WebView SDK for Nimbbl payment integration on iOS. Provides XCFramework with universal architecture support for both device and simulator."
  spec.homepage     = "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Nimbbl" => "support@nimbbl.biz" }

  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod.git", :tag => "v#{spec.version}" }

  spec.static_framework = true
  spec.vendored_frameworks = "nimbbl_mobile_kit_ios_webview_sdk.xcframework"

  # Dependencies
  spec.dependency "nimbbl_mobile_kit_ios_core_api_sdk", "~> 1.3.6"

  # Linking configuration
  spec.pod_target_xcconfig = {
    "OTHER_LDFLAGS" => "-framework nimbbl_mobile_kit_ios_webview_sdk"
  }

  spec.frameworks   = "UIKit", "Foundation", "WebKit"
  spec.swift_version = "5.0"
end

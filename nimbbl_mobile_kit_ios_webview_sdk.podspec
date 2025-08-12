Pod::Spec.new do |spec|
  spec.name         = "nimbbl_mobile_kit_ios_webview_sdk"
  spec.version      = "1.0.2"
  spec.summary      = "Nimbbl WebView SDK for iOS"
  spec.description  = "WebView SDK for Nimbbl payment integration on iOS. This SDK provides a WebView-based checkout experience for payment processing."
  spec.homepage     = "https://nimbbl.biz"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Nimbbl" => "tools@nimbbl.biz" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod.git", :tag => "#{spec.version}" }

  # Framework distribution - no source code
  spec.vendored_frameworks = "nimbbl_mobile_kit_ios_webview_sdk.framework"

  spec.swift_version = "5.0"
  spec.framework    = "Foundation"
  spec.framework    = "UIKit"
  spec.framework    = "WebKit"

  # Dependencies
  spec.dependency "nimbbl_mobile_kit_ios_core_api_sdk", "~> 1.0.3"

  # Framework settings for dynamic framework
  spec.pod_target_xcconfig = {
    "BUILD_LIBRARY_FOR_DISTRIBUTION" => "YES",
    "SKIP_INSTALL" => "NO",
    "ENABLE_BITCODE" => "NO",
    "DEFINES_MODULE" => "YES"
  }

  # Add user target xcconfig for additional compatibility
  spec.user_target_xcconfig = {
    "GENERATE_INFOPLIST_FILE" => "YES"
  }
end

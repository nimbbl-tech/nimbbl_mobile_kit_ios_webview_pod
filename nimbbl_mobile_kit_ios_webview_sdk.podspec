Pod::Spec.new do |spec|
  spec.name         = "nimbbl_mobile_kit_ios_webview_sdk"
  spec.version      = "1.0.0"
  spec.summary      = "Nimbbl WebView SDK for iOS"
  spec.description  = "WebView SDK for Nimbbl payment integration on iOS. This SDK provides the WebView-based checkout flow for payment processing."
  spec.homepage     = "https://nimbbl.com"
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
  spec.dependency "nimbbl_mobile_kit_ios_core_api_sdk", "~> 1.0.0"
  
  # Static library configuration
  spec.static_framework = true
  
  # Add code signing configuration
  spec.pod_target_xcconfig = {
    "CODE_SIGNING_ALLOWED" => "NO",
    "CODE_SIGNING_REQUIRED" => "NO",
    "CODE_SIGNING_IDENTITY" => "",
    "EXPANDED_CODE_SIGN_IDENTITY" => "",
    "BUILD_LIBRARY_FOR_DISTRIBUTION" => "YES",
    "SKIP_INSTALL" => "NO",
    "ENABLE_BITCODE" => "NO",
    "COPY_PHASE_STRIP" => "NO",
    "STRIP_INSTALLED_PRODUCT" => "NO",
    "STRIP_STYLE" => "non-global",
    "MACH_O_TYPE" => "staticlib",
    "DEFINES_MODULE" => "YES"
  }
  
  # Add user target xcconfig for additional compatibility
  spec.user_target_xcconfig = {
    "GENERATE_INFOPLIST_FILE" => "YES"
  }
end

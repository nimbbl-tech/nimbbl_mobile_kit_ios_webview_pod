Pod::Spec.new do |spec|
  spec.name           = "nimbbl_mobile_kit_ios_webview_sdk"
  spec.version        = "2.0.15-alpha.4"
  spec.summary        = "Nimbbl WebView SDK for iOS"
  spec.description    = "WebView SDK for Nimbbl payments, depends on Core API SDK"
  spec.homepage       = "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod"
  spec.license        = { :type => 'MIT' }
  spec.author         = { "Nimbbl" => "support@nimbbl.biz" }
  spec.platform       = :ios, "13.0"
  spec.swift_version  = "5.0"
  # For production release
  spec.source         = { :git => "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod.git", :tag => "#{spec.version}" }
  spec.vendored_frameworks = "nimbbl_mobile_kit_ios_webview_sdk.xcframework"
  
  # For local development (comment out for production)
  # spec.source         = { :path => "." }
  # spec.vendored_frameworks = "nimbbl_mobile_kit_ios_webview_sdk.xcframework"
  
  # Flutter compatibility - module map for XCFramework
  spec.module_map = "nimbbl_mobile_kit_ios_webview_sdk.modulemap"
  
  # Dependency on core API SDK (latest published alpha version)
  spec.dependency "nimbbl_mobile_kit_ios_core_api_sdk", "2.0.15-alpha.3"
  spec.frameworks     = ["Foundation", "UIKit", "WebKit"]
  spec.static_framework = true
  
  # Enhanced pod target configuration for Flutter compatibility
  spec.pod_target_xcconfig = { 
    'CODE_SIGNING_ALLOWED' => 'NO',
    'DEFINES_MODULE' => 'YES',
    'SWIFT_VERSION' => '5.0'
  }
  
  # User target configuration for Flutter compatibility
  spec.user_target_xcconfig = {
    'DEFINES_MODULE' => 'YES'
  }
end

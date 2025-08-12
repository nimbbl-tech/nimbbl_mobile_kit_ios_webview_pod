Pod::Spec.new do |spec|
  spec.name         = "nimbbl_mobile_kit_ios_webview_sdk"
  spec.version      = "1.0.7"
  spec.summary      = "Nimbbl WebView SDK for iOS"
  spec.description  = "WebView SDK for Nimbbl payment integration on iOS. This SDK provides a WebView-based checkout experience for payment processing."
  spec.homepage     = "https://nimbbl.biz"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Nimbbl" => "tools@nimbbl.biz" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod.git", :tag => "#{spec.version}" }

  # Use static framework to avoid embedding issues
  spec.static_framework = true
  
  # Use the original framework
  spec.vendored_frameworks = "nimbbl_mobile_kit_ios_webview_sdk.framework"
  
  # Framework search paths
  spec.pod_target_xcconfig = {
    'FRAMEWORK_SEARCH_PATHS' => '$(PODS_ROOT)/nimbbl_mobile_kit_ios_webview_sdk',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }

  spec.swift_version = "5.0"
  spec.framework    = "Foundation"
  spec.framework    = "UIKit"
  spec.framework    = "WebKit"

  # Dependencies - use version 1.0.4 of core API SDK which was distributed as a framework
  spec.dependency "nimbbl_mobile_kit_ios_core_api_sdk", "1.0.4"
end

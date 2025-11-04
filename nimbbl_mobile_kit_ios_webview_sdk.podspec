Pod::Spec.new do |spec|
  spec.name           = "nimbbl_mobile_kit_ios_webview_sdk"
  spec.version        = "2.0.16"
  spec.summary        = "Nimbbl WebView SDK for iOS"
  spec.description    = "WebView SDK for Nimbbl payments, depends on Core API SDK"
  spec.homepage       = "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod"
  spec.license        = { :type => 'MIT' }
  spec.author         = { "Nimbbl" => "support@nimbbl.biz" }
  spec.platform       = :ios, "13.0"
  spec.swift_version  = "5.0"
  
  # Detect local development: check if source files exist in the podspec directory
  # If source files exist, use them for local development; otherwise use XCFramework for production
  source_dir = File.join(File.dirname(__FILE__), 'nimbbl_mobile_kit_ios_webview_sdk')
  has_source_files = File.directory?(source_dir) && !Dir[File.join(source_dir, '*.swift')].empty?
  
  if has_source_files
    # Local development mode - use source files (when :path is used in Podfile)
    spec.source = { :path => "." }
    spec.source_files = "nimbbl_mobile_kit_ios_webview_sdk/*.swift"
    # Use dynamic framework for proper embedding when using source files
    spec.static_framework = false
  else
    # Production release - use vendored XCFramework from git
    spec.source = { :git => "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod.git", :tag => "#{spec.version}" }
    spec.vendored_frameworks = "nimbbl_mobile_kit_ios_webview_sdk.xcframework"
    spec.module_map = "nimbbl_mobile_kit_ios_webview_sdk.modulemap"
    spec.static_framework = true
  end
  
  # Dependency on core API SDK
  spec.dependency "nimbbl_mobile_kit_ios_core_api_sdk", "2.0.15"
  spec.frameworks     = ["Foundation", "UIKit", "WebKit"]
  
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

Pod::Spec.new do |spec|
  spec.name           = "nimbbl_mobile_kit_ios_webview_sdk"
  spec.version        = "2.0.6"
  spec.summary        = "Nimbbl WebView SDK for iOS"
  spec.description    = "WebView SDK for Nimbbl payments, depends on Core API SDK"
  spec.homepage       = "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod"
  spec.license        = { :type => 'MIT' }
  spec.author         = { "Nimbbl" => "support@nimbbl.biz" }
  spec.platform       = :ios, "13.0"
  spec.swift_version  = "5.0"
  # For local development (uncomment for local development)
  # spec.source         = { :path => "." }
  # spec.source_files = "nimbbl_mobile_kit_ios_webview_sdk/*.swift"
  
  # For production release (uncomment for production)
  spec.source         = { :git => "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod.git", :tag => "#{spec.version}" }
  spec.vendored_frameworks = "nimbbl_mobile_kit_ios_webview_sdk.xcframework"
  
  # Dependency on core API SDK
  spec.dependency "nimbbl_mobile_kit_ios_core_api_sdk", "~> 2.0.6"
  spec.frameworks     = ["Foundation", "UIKit", "WebKit"]
  spec.static_framework = true
  spec.pod_target_xcconfig = { 'CODE_SIGNING_ALLOWED' => 'NO' }
end

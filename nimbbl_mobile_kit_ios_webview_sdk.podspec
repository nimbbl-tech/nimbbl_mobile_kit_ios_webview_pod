Pod::Spec.new do |spec|
  spec.name           = "nimbbl_mobile_kit_ios_webview_sdk"
  spec.version        = "2.0.1"
  spec.summary        = "Nimbbl WebView SDK for iOS"
  spec.description    = "WebView SDK for Nimbbl payments, depends on Core API SDK"
  spec.homepage       = "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod"
  spec.license        = { :type => 'MIT' }
  spec.author         = { "Nimbbl" => "support@nimbbl.com" }
  spec.platform       = :ios, "13.0"
  spec.swift_version  = "5.0"
  spec.source         = { :git => "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod.git", :tag => "#{spec.version}" }
  spec.vendored_frameworks = "nimbbl_mobile_kit_ios_webview_sdk.xcframework"
  spec.dependency "nimbbl_mobile_kit_ios_core_api_sdk", "~> 2.0.0-SNAPSHOT-20250925180037"
  spec.frameworks     = ["Foundation", "UIKit", "WebKit"]
  spec.static_framework = true
  spec.pod_target_xcconfig = { 'CODE_SIGNING_ALLOWED' => 'NO' }
end

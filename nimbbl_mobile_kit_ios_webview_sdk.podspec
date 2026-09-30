Pod::Spec.new do |spec|
  spec.name           = "nimbbl_mobile_kit_ios_webview_sdk"

  # Single source of truth for the version: version.properties (kept in sync by
  # the release scripts). The same value is used for the tag, the Package.swift
  # binaryTarget, and the Core dependency below.
  version_file = File.join(File.dirname(__FILE__), 'version.properties')
  fallback_version = "2.0.17"
  if File.exist?(version_file)
    m = File.read(version_file).match(/^SDK_VERSION=(.+)$/)
    spec.version = m ? m[1].strip : fallback_version
  else
    spec.version = fallback_version
  end

  spec.summary        = "Nimbbl WebView SDK for iOS"
  spec.description    = "WebView SDK for Nimbbl payments, depends on Core API SDK"
  spec.homepage       = "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod"
  spec.license        = { :type => 'MIT' }
  spec.author         = { "Nimbbl" => "support@nimbbl.biz" }
  spec.platform       = :ios, "15.0"
  spec.swift_version  = "5.0"

  # Binary distribution: vendored XCFramework from this repo's git tag.
  spec.source = { :git => "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod.git", :tag => "#{spec.version}" }
  spec.vendored_frameworks = "nimbbl_mobile_kit_ios_webview_sdk.xcframework"
  spec.static_framework = true

  # Depends on the Core API SDK at the exact same version (mirrors Package.swift).
  spec.dependency "nimbbl_mobile_kit_ios_core_api_sdk", "#{spec.version}"
  spec.frameworks     = ["Foundation", "UIKit", "WebKit"]

  # Enhanced pod target configuration for Flutter compatibility
  spec.pod_target_xcconfig = {
    'CODE_SIGNING_ALLOWED' => 'NO',
    'DEFINES_MODULE' => 'YES',
    'SWIFT_VERSION' => '5.0'
  }

  spec.user_target_xcconfig = {
    'DEFINES_MODULE' => 'YES'
  }
end

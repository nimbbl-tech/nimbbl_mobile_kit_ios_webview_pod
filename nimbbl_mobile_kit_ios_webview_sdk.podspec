Pod::Spec.new do |spec|
  spec.name           = "nimbbl_mobile_kit_ios_webview_sdk"

  # Single source of truth: version.properties (kept in sync by the release
  # scripts). SDK_VERSION drives this pod's tag + binaryTarget. Core is pinned
  # SEPARATELY via CORE_API_SDK_VERSION — the WebView and Core SDKs version
  # independently, so this is NOT assumed equal to spec.version.
  version_file = File.join(File.dirname(__FILE__), 'version.properties')
  fallback_version = "2.0.17"
  props = File.exist?(version_file) ? File.read(version_file) : ""
  sdk_m  = props.match(/^SDK_VERSION=(.+)$/)
  core_m = props.match(/^CORE_API_SDK_VERSION=(.+)$/)
  spec.version = sdk_m ? sdk_m[1].strip : fallback_version
  core_version = core_m ? core_m[1].strip : spec.version   # fallback: lockstep

  spec.summary        = "Nimbbl WebView SDK for iOS"
  spec.description    = "WebView SDK for Nimbbl payments, depends on Core API SDK"
  spec.homepage       = "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod"
  spec.license        = { :type => 'MIT' }
  spec.author         = { "Nimbbl" => "help@nimbbl.biz" }
  spec.platform       = :ios, "15.0"
  spec.swift_version  = "5.0"

  # Binary distribution: vendored XCFramework from this repo's git tag.
  spec.source = { :git => "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod.git", :tag => "#{spec.version}" }
  spec.vendored_frameworks = "nimbbl_mobile_kit_ios_webview_sdk.xcframework"
  spec.static_framework = true

  # Depends on Core at its own pinned version (mirrors Package.swift `exact:`).
  spec.dependency "nimbbl_mobile_kit_ios_core_api_sdk", "#{core_version}"
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

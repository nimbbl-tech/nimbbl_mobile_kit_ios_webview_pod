Pod::Spec.new do |spec|
  spec.name         = "nimbbl_mobile_kit_ios_webview_sdk"
  spec.version      = "1.0.6"
  spec.summary      = "Nimbbl WebView SDK for iOS"
  spec.description  = "WebView SDK for Nimbbl payment integration on iOS. This SDK provides a WebView-based checkout experience for payment processing."
  spec.homepage     = "https://nimbbl.biz"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Nimbbl" => "tools@nimbbl.biz" }
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod.git", :tag => "#{spec.version}" }

  # Use static library to avoid embedding issues
  spec.static_framework = true
  
  # Static library and headers
  spec.source_files = "static_lib/Headers/*.h"
  spec.public_header_files = "static_lib/Headers/*.h"

  # No source code compilation
  spec.requires_arc = false

  # Configure build settings for static library
  spec.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
    'MACH_O_TYPE' => 'staticlib',
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'NO',
    'ENABLE_BITCODE' => 'NO',
    'CODE_SIGNING_ALLOWED' => 'NO',
    'CODE_SIGNING_REQUIRED' => 'NO',
    'ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES' => 'NO',
    'EMBEDDED_CONTENT_CONTAINS_SWIFT' => 'NO',
    'LIBRARY_SEARCH_PATHS' => '$(inherited) $(PODS_ROOT)/nimbbl_mobile_kit_ios_webview_sdk/static_lib',
    'OTHER_LDFLAGS' => '$(inherited) -lnimbbl_mobile_kit_ios_webview_sdk'
  }
  
  # User target configuration to prevent embedding
  spec.user_target_xcconfig = {
    'MACH_O_TYPE' => 'staticlib',
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'NO',
    'ENABLE_BITCODE' => 'NO',
    'ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES' => 'NO',
    'EMBEDDED_CONTENT_CONTAINS_SWIFT' => 'NO',
    'LIBRARY_SEARCH_PATHS' => '$(inherited) $(PODS_ROOT)/nimbbl_mobile_kit_ios_webview_sdk/static_lib',
    'OTHER_LDFLAGS' => '$(inherited) -lnimbbl_mobile_kit_ios_webview_sdk'
  }

  spec.swift_version = "5.0"
  spec.framework    = "Foundation"
  spec.framework    = "UIKit"
  spec.framework    = "WebKit"

  # Dependencies
  spec.dependency "nimbbl_mobile_kit_ios_core_api_sdk", "1.0.7"
end

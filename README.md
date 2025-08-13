# Nimbbl WebView SDK for iOS

A universal XCFramework for Nimbbl payment integration on iOS, providing WebView-based checkout flow for payment processing.

## Features

- **Universal XCFramework**: Supports both device (arm64) and simulator (arm64 + x86_64) architectures
- **iOS 13.0+**: Compatible with iOS 13.0 and later
- **Swift 5.0**: Built with latest Swift version
- **Static Framework**: No external dependencies except Core API SDK
- **WebView Integration**: Seamless payment flow through WebView

## Installation

### CocoaPods

Add this line to your Podfile:

```ruby
pod "nimbbl_mobile_kit_ios_webview_sdk", "~> 1.0.9"
```

Then run:

```bash
pod install
```

## Dependencies

This SDK requires the Core API SDK:

```ruby
pod "nimbbl_mobile_kit_ios_core_api_sdk", "~> 1.3.6"
```

## Usage

```swift
import nimbbl_mobile_kit_ios_webview_sdk

// Initialize the SDK
let webViewSDK = NimbblCheckoutSDK.shared

// Set delegate
webViewSDK.delegate = self

// Present checkout
webViewSDK.presentCheckout(from: self, options: checkoutOptions)
```

## Requirements

- iOS 13.0+
- Xcode 12.0+
- Swift 5.0+

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For support, email support@nimbbl.biz

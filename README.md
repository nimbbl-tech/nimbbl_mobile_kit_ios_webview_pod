# Nimbbl WebView SDK for iOS

A prebuilt XCFramework for Nimbbl payment integration on iOS, providing a
WebView-based checkout flow. Distributed via **Swift Package Manager** and
**CocoaPods**. Depends on the Nimbbl Core API SDK (resolved automatically).

## Features

- **Binary XCFramework**: device (arm64) + simulator (arm64 + x86_64)
- **iOS 15.0+**
- **Swift 5.0+**, built against the iOS 27 SDK
- **WebView checkout**: seamless payment flow
- Core API SDK pulled in automatically as a dependency

## Installation

### Swift Package Manager (recommended)

In Xcode: **File ▸ Add Package Dependencies…** and enter:

```
https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod.git
```

Pick the latest version and add the **`nimbbl_mobile_kit_ios_webview_sdk`**
library to your app target. The Core API SDK is pulled in automatically — you do
not add it yourself.

Or in `Package.swift`:

```swift
dependencies: [
    .package(
        url: "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod.git",
        exact: "2.1.0-alpha.1"
    )
]
```

See [SPM_INTEGRATION.md](SPM_INTEGRATION.md) for details.

### CocoaPods (legacy — 2.0.x only)

> **2.1.0 and later are distributed via Swift Package Manager only.** CocoaPods
> continues to serve existing **2.0.x** releases. CocoaPods Trunk goes read-only
> on **2 Dec 2026**, after which no new pod versions can be published — new and
> upgrading integrations should use SPM.

```ruby
pod 'nimbbl_mobile_kit_ios_webview_sdk', '~> 2.0.17'
```

```bash
pod install
```

The Core API SDK is resolved transitively via the podspec dependency.

## Usage

```swift
import nimbbl_mobile_kit_ios_webview_sdk

// Set the delegate (conform to NimbblCheckoutSDKDelegate)
NimbblCheckoutSDK.shared.delegate = self

// Build options and start checkout
let options = NimbblCheckoutOptions(
    orderToken: orderToken,
    paymentModeCode: nil,
    bankCode: nil,
    walletCode: nil,
    paymentFlow: nil
)
NimbblCheckoutSDK.shared.checkout(from: self, options: options)
```

## Requirements

- iOS 15.0+
- Xcode 15.0+ (built against the iOS 27 SDK)
- Swift 5.0+

## License

Licensed under the MIT License — see [LICENSE](LICENSE).

## Support

For support, email help@nimbbl.biz

# Swift Package Manager integration

From **2.1.0**, the Nimbbl iOS SDKs ship via Swift Package Manager as prebuilt
**binary XCFrameworks** (the same artifacts used for CocoaPods), delivered from
these public "pod" repos. Module names match the pods, so `import` is identical
across SPM and CocoaPods.

- **Minimum iOS:** 15.0 · **Built against:** iOS 27 SDK

## Add the package (Xcode)

File ▸ Add Package Dependencies… and enter:

```
https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod.git
```

Pick `2.1.0-alpha.1` (or the latest release) and add the
`nimbbl_mobile_kit_ios_webview_sdk` library product to your app target.
The **Core API SDK is pulled in automatically** (transitive) — you do not add it.

## Add the package (Package.swift)

```swift
dependencies: [
    .package(
        url: "https://github.com/nimbbl-tech/nimbbl_mobile_kit_ios_webview_pod.git",
        exact: "2.1.0-alpha.1"
    )
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [
            .product(
                name: "nimbbl_mobile_kit_ios_webview_sdk",
                package: "nimbbl_mobile_kit_ios_webview_pod"
            )
        ]
    )
]
```

## Usage

```swift
import nimbbl_mobile_kit_ios_webview_sdk

let options = NimbblCheckoutOptionsBuilder()
    .setOrderToken(orderToken)
    .buildSwift()

NimbblCheckoutSDK.shared.delegate = self
NimbblCheckoutSDK.shared.checkout(from: self, options: options)
```

## CocoaPods (still supported)

```ruby
pod 'nimbbl_mobile_kit_ios_webview_sdk', '2.1.0-alpha.1'
```

## Notes

- These repos ship **binary** frameworks — no source is exposed.
- Every release is a git **tag** on both repos; the WebView package pins the Core
  package to the exact same version, so Core is tagged before/with WebView.

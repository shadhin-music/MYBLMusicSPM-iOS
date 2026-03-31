# MYBLMusicSDK

[![Version](https://img.shields.io/github/v/release/shadhin-music/MYBLMusicSPM-iOS)](https://github.com/shadhin-music/MYBLMusicSPM-iOS/releases)
[![License](https://img.shields.io/github/license/shadhin-music/MYBLMusicSPM-iOS)](https://github.com/shadhin-music/MYBLMusicSPM-iOS/blob/main/LICENSE)
[![Platforms](https://img.shields.io/badge/Platforms-iOS%2014%2B-blue.svg)](#)
[![Languages](https://img.shields.io/badge/language-%20swift-FF69B4.svg?style=plastic)](#)
[![SPM](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen)](#)

## Installation

### Swift Package Manager

MYBLMusicSDK is available through [Swift Package Manager](https://swift.org/package-manager/).

1. In Xcode, go to **File → Add Package Dependencies...**
2. Enter the repository URL:
   ```
   https://github.com/shadhin-music/MYBLMusicSPM-iOS
   ```
3. Select version **1.0.2** or **Up to Next Major Version**
4. Add **MYBLShadhinSDK** to your target
5. Click **Add Package**

## SDK Initialization

Import the framework in `AppDelegate` and initialize with your token:

```swift
import Shadhin_BL

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Receive music control from notification bar
    application.beginReceivingRemoteControlEvents()
    // Initialize SDK with token
    ShadhinBL.shared.initialize(with: "", delegate: self)
    return true
}
```

### Media Control Setup

```swift
override func remoteControlReceived(with event: UIEvent?) {
    if let event = event {
        // Register event
        ShadhinBL.shared.eventRegister(with: event)
    }
}
```

## Usage

Get the Music home controller by passing your root navigation controller. The mini player will always be visible from any controller.

Pass the membership status value accordingly:

```swift
ShadhinBL.shared.gotoHome(with: self.tabBarController, navigationController: self.navigationController!, membership: "silver")
```

## Features

Navigate directly to any feature using `openPatch`:

### Popular Artist
```swift
ShadhinBL.shared.openPatch(patchID: FeatureType.POPULAR_ARTIST.rawValue, navigationController: self.navigationController!, tabController: self.tabBarController)
```

### Latest Release
```swift
ShadhinBL.shared.openPatch(patchID: FeatureType.LATEST_RELEASE.rawValue, navigationController: self.navigationController!, tabController: self.tabBarController)
```

### Popular Video
```swift
ShadhinBL.shared.openPatch(patchID: FeatureType.POPULAR_VIDEO.rawValue, navigationController: self.navigationController!, tabController: self.tabBarController)
```

### Podcast
```swift
ShadhinBL.shared.openPatch(patchID: FeatureType.PODCAST.rawValue, navigationController: self.navigationController!, tabController: self.tabBarController)
```

### Amar Tune
```swift
ShadhinBL.shared.openPatch(patchID: FeatureType.AMAR_TUNE.rawValue, navigationController: self.navigationController!, tabController: self.tabBarController)
```

### Amar Tune Top 100
```swift
ShadhinBL.shared.openPatch(patchID: FeatureType.AMAR_TUNE_TOP_100.rawValue, navigationController: self.navigationController!, tabController: self.tabBarController)
```

### Radio
```swift
ShadhinBL.shared.gotoRadio(nav: self.navigationController!, tabController: self.tabBarController)
```

### Open RC Code
```swift
ShadhinBL.shared.openPatch(patchID: "MjM1OV9QREJD", navigationController: self.navigationController!, tabController: self.tabBarController)
```

## Playback Controls

```swift
ShadhinBL.shared.playMusic()     // Play
ShadhinBL.shared.pauseMusic()    // Pause
ShadhinBL.shared.stopMusic()     // Stop
ShadhinBL.shared.clearAllCache() // Clear all cache
```

## Permissions

Add App Transport Security to your `Info.plist`:

```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

In your project target under **Signing & Capabilities**, add **Background Modes** and enable:
- `Audio, AirPlay, and Picture in Picture`
- `Background Processing`

## Maintainer Guide — Releasing a New Version

Follow these steps every time a new feature is added to the source project.

### Step 1 — Rebuild XCFramework

```bash
cd "/path/to/BLMusiciOS"

xcodebuild archive \
  -project Shadhin_BL.xcodeproj \
  -scheme Shadhin_BL \
  -configuration Release \
  -destination "generic/platform=iOS" \
  -archivePath /tmp/bl-archives/Shadhin_BL-iOS \
  SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
  -project Shadhin_BL.xcodeproj \
  -scheme Shadhin_BL \
  -configuration Release \
  -destination "generic/platform=iOS Simulator" \
  -archivePath /tmp/bl-archives/Shadhin_BL-Simulator \
  SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

rm -rf MYBLShadhinSDK.xcframework
xcodebuild -create-xcframework \
  -framework /tmp/bl-archives/Shadhin_BL-iOS.xcarchive/Products/Library/Frameworks/Shadhin_BL.framework \
  -framework /tmp/bl-archives/Shadhin_BL-Simulator.xcarchive/Products/Library/Frameworks/Shadhin_BL.framework \
  -output MYBLShadhinSDK.xcframework
```

### Step 2 — Zip and compute checksum

```bash
rm -f MYBLShadhinSDK.xcframework.zip
zip -r MYBLShadhinSDK.xcframework.zip MYBLShadhinSDK.xcframework -x "*.DS_Store"
swift package compute-checksum MYBLShadhinSDK.xcframework.zip
```

Copy the checksum printed in Terminal.

### Step 3 — Create GitHub release

```bash
gh release create 1.0.3 \
  MYBLShadhinSDK.xcframework.zip \
  --repo shadhin-music/MYBLMusicSPM-iOS \
  --title "MYBLShadhinSDK 1.0.3" \
  --notes "Description of what changed"
```

### Step 4 — Update Package.swift

Update the `url` and `checksum` in `Package.swift`:

```swift
url: "https://github.com/shadhin-music/MYBLMusicSPM-iOS/releases/download/1.0.3/MYBLShadhinSDK.xcframework.zip",
checksum: "PASTE_NEW_CHECKSUM_HERE"
```

Then push:

```bash
git add Package.swift
git commit -m "Release 1.0.3"
git push
```

## Author

MD Maruf Prodhan — mdmaruf.shadhin@gmail.com

## Company

[Gakk Media](https://gakkmedia.com)

## License

MYBLMusicSDK is available under the MIT license. See the LICENSE file for more info.

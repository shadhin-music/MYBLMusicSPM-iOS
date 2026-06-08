# MYBLMusicSDK

[![Version](https://img.shields.io/github/v/release/shadhin-music/MYBLMusicSPM-iOS)](https://github.com/shadhin-music/MYBLMusicSPM-iOS/releases)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/shadhin-music/MYBLMusicSPM-iOS/blob/main/LICENSE)
[![Platforms](https://img.shields.io/badge/Platforms-iOS%2014%2B-blue.svg)](#)
[![Swift](https://img.shields.io/badge/language-Swift-FF69B4.svg?style=plastic)](#)
[![SPM](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen)](#)

---

## Requirements

- iOS 14.0+
- Xcode 13+
- Swift 5.5+

---

## Installation

### Swift Package Manager

1. In Xcode, go to **File → Add Package Dependencies...**
2. Enter the repository URL:

```
https://github.com/shadhin-music/MYBLMusicSPM-iOS
```

3. Select version **1.0.8** or **Up to Next Major Version**
4. Add **MYBLShadhinSDK** to your target
5. Click **Add Package**

---

## SDK Initialization

In `AppDelegate`, initialize the SDK with your token:

```swift
import MYBLShadhinSDK

func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
) -> Bool {
    application.beginReceivingRemoteControlEvents()
    ShadhinBL.shared.initialize(with: "YOUR_TOKEN", delegate: self)
    return true
}
```

### Media Control

```swift
override func remoteControlReceived(with event: UIEvent?) {
    if let event = event {
        ShadhinBL.shared.eventRegister(with: event)
    }
}
```

---

## Usage

### Open Music Home

```swift
ShadhinBL.shared.gotoHome(
    with: self.tabBarController,
    navigationController: self.navigationController!,
    membership: "silver"
)
```

---

## Features

### Popular Artist

```swift
ShadhinBL.shared.openPatch(
    patchID: FeatureType.POPULAR_ARTIST.rawValue,
    navigationController: self.navigationController!,
    tabController: self.tabBarController
)
```

### Latest Release

```swift
ShadhinBL.shared.openPatch(
    patchID: FeatureType.LATEST_RELEASE.rawValue,
    navigationController: self.navigationController!,
    tabController: self.tabBarController
)
```

### Popular Video

```swift
ShadhinBL.shared.openPatch(
    patchID: FeatureType.POPULAR_VIDEO.rawValue,
    navigationController: self.navigationController!,
    tabController: self.tabBarController
)
```

### Podcast

```swift
ShadhinBL.shared.openPatch(
    patchID: FeatureType.PODCAST.rawValue,
    navigationController: self.navigationController!,
    tabController: self.tabBarController
)
```

### Amar Tune

```swift
ShadhinBL.shared.openPatch(
    patchID: FeatureType.AMAR_TUNE.rawValue,
    navigationController: self.navigationController!,
    tabController: self.tabBarController
)
```

### Amar Tune Top 100

```swift
ShadhinBL.shared.openPatch(
    patchID: FeatureType.AMAR_TUNE_TOP_100.rawValue,
    navigationController: self.navigationController!,
    tabController: self.tabBarController
)
```

### Radio

```swift
ShadhinBL.shared.gotoRadio(
    nav: self.navigationController!,
    tabController: self.tabBarController
)
```

---

## Playback Controls

```swift
ShadhinBL.shared.playMusic()      // Play
ShadhinBL.shared.pauseMusic()     // Pause
ShadhinBL.shared.stopMusic()      // Stop
ShadhinBL.shared.clearAllCache()  // Clear all cache
```

---

## Permissions

Add to your `Info.plist`:

```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

Under **Signing & Capabilities → Background Modes**, enable:

- Audio, AirPlay, and Picture in Picture
- Background Processing

---

## Changelog

### 1.0.8
- Fixed NSRangeException crash in ShortsPlayerVC when returning from ChannelVC
- Fixed framework header compatibility (double-quoted imports in LNPopupController)

### 1.0.7
- Previous release

---

## Author

MD Maruf Prodhan — mdmaruf.shadhin@gmail.com

## Company

[Gakk Media](https://gakkmedia.com)

## License

MYBLMusicSDK is available under the MIT license. See the [LICENSE](https://github.com/shadhin-music/MYBLMusicSPM-iOS/blob/main/LICENSE) file for more info.

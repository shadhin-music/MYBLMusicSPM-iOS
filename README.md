# MYBLShadhinSDK

iOS music SDK for BL (Banglalink) distributed as a Swift Package Manager binary framework.

## Requirements

- iOS 14.0+
- Xcode 13+
- Swift 5.6+

## Installation

### Swift Package Manager

1. In Xcode, go to **File → Add Package Dependencies...**
2. Enter the repository URL:
   ```
   https://github.com/shadhin-music/MYBLMusicSPM-iOS
   ```
3. Select version **1.0.2** or **Up to Next Major Version**
4. Add **MYBLShadhinSDK** to your target
5. Click **Add Package**

## Usage

Import the framework in your Swift file:

```swift
import Shadhin_BL
```

## Updating the Package (For Maintainers)

Follow these steps every time a new feature is added.

### Step 1 — Rebuild XCFramework

```bash
cd "/path/to/BLMusiciOS"

# Archive for device
xcodebuild archive \
  -project Shadhin_BL.xcodeproj \
  -scheme Shadhin_BL \
  -configuration Release \
  -destination "generic/platform=iOS" \
  -archivePath /tmp/bl-archives/Shadhin_BL-iOS \
  SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Archive for simulator
xcodebuild archive \
  -project Shadhin_BL.xcodeproj \
  -scheme Shadhin_BL \
  -configuration Release \
  -destination "generic/platform=iOS Simulator" \
  -archivePath /tmp/bl-archives/Shadhin_BL-Simulator \
  SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Create XCFramework
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

Copy the checksum from the Terminal output.

### Step 3 — Create GitHub release

```bash
gh release create 1.0.3 \
  MYBLShadhinSDK.xcframework.zip \
  --repo shadhin-music/MYBLMusicSPM-iOS \
  --title "MYBLShadhinSDK 1.0.3" \
  --notes "Description of what changed"
```

### Step 4 — Update Package.swift

In this repo, update `Package.swift` with the new version and checksum:

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

## License

Copyright © Shadhin Music. All rights reserved.

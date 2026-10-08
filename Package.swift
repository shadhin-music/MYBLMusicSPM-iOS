// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "MYBLShadhinSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "MYBLShadhinSDK",
            targets: ["MYBLShadhinSDK"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "MYBLShadhinSDK",
            url: "https://github.com/shadhin-music/MYBLMusicSPM-iOS/releases/download/1.2.0/MYBLShadhinSDK.xcframework.zip",
            checksum: "b0ec9e7ef033d4bec62b7d77d2d07a04ff113cd9682800c32b256ecb9f6937b9"
        )
    ]
)

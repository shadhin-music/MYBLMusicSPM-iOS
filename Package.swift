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
            url: "https://github.com/shadhin-music/MYBLMusicSPM-iOS/releases/download/1.2.2/MYBLShadhinSDK.xcframework.zip",
            checksum: "6d0f0ecc6e8917eb167c63222f6223763fba593e217b363a5ac6af277b1e566b"
        )
    ]
)

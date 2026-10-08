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
            url: "https://github.com/shadhin-music/MYBLMusicSPM-iOS/releases/download/1.2.1/MYBLShadhinSDK.xcframework.zip",
            checksum: "bffccf3bc58af29584cc5389cbaa7f9750396c72c5f62c2ed08cc1b6650577ba"
        )
    ]
)

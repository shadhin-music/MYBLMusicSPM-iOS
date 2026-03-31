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
            url: "https://github.com/shadhin-music/MYBLMusicSPM-iOS/releases/download/1.0.2/MYBLShadhinSDK.xcframework.zip",
            checksum: "6dc5f5c569b2d0019568ed52177d15be3c81788f98e76402326708b95c10dca2"
        )
    ]
)

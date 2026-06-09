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
            url: "https://github.com/shadhin-music/MYBLMusicSPM-iOS/releases/download/1.0.9/MYBLShadhinSDK.xcframework.zip",
            checksum: "d976f3b890970c1a5537ff18ed1b206d28fdc23b878befc3fccb43e474ae25b2"
        )
    ]
)

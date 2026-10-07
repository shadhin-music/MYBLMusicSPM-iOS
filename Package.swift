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
            url: "https://github.com/shadhin-music/MYBLMusicSPM-iOS/releases/download/1.1.0/MYBLShadhinSDK.xcframework.zip",
            checksum: "1353ce7f35fd50e99ebe0c9b529cb1efc6a5c18b94172052a0723e705b563253"
        )
    ]
)

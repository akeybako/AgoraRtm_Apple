// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "AgoraRTM",
    platforms: [.iOS(.v12), .macOS(.v10_15)],
    products: [
        .library(
            name: "AgoraRTM",
            targets: ["AgoraRtmKit"]
        ),
    ],
    dependencies: [
        // AgoraInfra_iOSからaoslを取得（RtcEngine_iOSと共有）
        .package(url: "https://github.com/AgoraIO/AgoraInfra_iOS.git", exact: "1.3.0")
    ],
    targets: [
        .binaryTarget(
            name: "AgoraRtmKit",
            url: "https://download.agora.io/rtmsdk/release/AgoraRtmKit.xcframework_2.2.5.zip",
            checksum: "856aba19003bcfaf09daac35db6717a068a3a687d2fe99a16809d810afa069bc"
        ),
        // 注: aoslターゲットは削除し、AgoraInfra_iOSから提供されるものを使用
        // これによりAgoraRtcEngine_iOSとの競合を回避
    ]
)

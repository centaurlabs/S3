// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "S3Centaur",
    products: [
        .library(name: "S3Centaur", targets: ["S3Centaur"]),
        .library(name: "S3Signer", targets: ["S3Signer"]),
        .library(name: "S3TestTools", targets: ["S3TestTools"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        .package(url: "https://github.com/LiveUI/XMLCoding.git", from: "0.1.0"),
        .package(url: "https://github.com/LiveUI/VaporTestTools.git", from: "0.1.5")
    ],
    targets: [
        .target(name: "S3Centaur", dependencies: [
            "Vapor",
            "S3Signer",
            "XMLCoding"
            ]
        ),
        .target(name: "S3DemoRun", dependencies: [
            "S3DemoApp"
            ]
        ),
        .target(name: "S3DemoApp", dependencies: [
            "Vapor",
            "S3Centaur",
            "S3Signer"
            ]
        ),
        .target(name: "S3Signer", dependencies: [
            "Vapor"
            ]
        ),
        .target(name: "S3TestTools", dependencies: [
            "Vapor",
            "VaporTestTools",
            "S3Centaur"
            ]
        ),
        .testTarget(name: "S3Tests", dependencies: [
            "S3Centaur"
            ]
        )
    ]
)

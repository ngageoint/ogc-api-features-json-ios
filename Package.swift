// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "OGC_APIFeaturesJSON",
    platforms: [
        .iOS(.v13), .macOS(.v12)
    ],
    products: [
        .library(
            name: "OGC_APIFeaturesJSON",
            targets: ["OGC_APIFeaturesJSON"])
    ],
    dependencies: [
        .package(url: "https://github.com/ngageoint/simple-features-geojson-ios", from: "5.0.0"),
    ],
    targets: [
        .target(
            name: "OGC_APIFeaturesJSON",
            dependencies: [
                .product(name: "SimpleFeaturesGeoJSON", package: "simple-features-geojson-ios")
            ],
            path: "ogc-api-features-json-ios"
        ),
        .testTarget(
            name: "OGCAPIFeaturesJSONTests",
            dependencies: [
                "OGC_APIFeaturesJSON"
            ],
            path: "ogc-api-features-json-iosTests"
        )
    ]
)

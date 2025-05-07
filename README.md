# OGC API Features JSON iOS

#### OGC API Features JSON Lib ####

The OGC API Libraries were developed at the [National Geospatial-Intelligence Agency (NGA)](http://www.nga.mil/) in collaboration with [BIT Systems](https://www.caci.com/bit-systems/). The government has "unlimited rights" and is releasing this software to increase the impact of government investments by providing developers with the opportunity to take things in new directions. The software use, modification, and distribution rights are stipulated within the [MIT license](http://choosealicense.com/licenses/mit/).

### Pull Requests ###
If you'd like to contribute to this project, please make a pull request. We'll review the pull request and discuss the changes. All pull request contributions to this project will be released under the MIT license.

Software source code previously released under an open source license and then modified by NGA staff is considered a "joint work" (see 17 USC § 101); it is partially copyrighted, partially public domain, and as a whole is protected by the copyrights of the non-government authors and must be released according to the terms of the original open source license.

### About ###

[OGC API Features JSON](http://ngageoint.github.io/ogc-api-features-json-ios/) is an iOS Objective-C library for writing and reading [OGC API - Features](https://github.com/opengeospatial/WFS_FES) to and from JSON.

### Usage ###

View the latest [Appledoc](http://ngageoint.github.io/ogc-api-features-json-ios/docs/api/)

#### Read ####

```objectivec
@import OGC_APIFeaturesJSON;
 
OAFCollections *collections = [OAFFeaturesConverter jsonToCollections:collectionsContent];
OAFCollection *collection = [OAFFeaturesConverter jsonToCollection:collectionContent];
OAFFeatureCollection *featureCollection = [OAFFeaturesConverter jsonToFeatureCollection:featureCollectionContent];

```

#### Write ####

```objectivec

NSString *collectionsContent = [OAFFeaturesConverter objectToJSON:collections];
NSString *collectionContent = [OAFFeaturesConverter objectToJSON:collection];
NSString *featureCollectionContent = [OAFFeaturesConverter objectToJSON:featureCollection];

```

### Build ###

[![Build](https://github.com/ngageoint/ogc-api-features-json-ios/workflows/Build/badge.svg)](https://github.com/ngageoint/ogc-api-features-json-ios/actions/workflows/build.yml)

Build this repository using Swift Package Manager:

    swift build

Run tests from Xcode or from command line:

    swift test

Open the Swift Package in Xcode from command line:

    open Package.swift

### Include Library ###

Use this library via SPM in your Package.swift:

    dependencies: [
        .package(url: "https://github.com/ngageoint/ogc-api-features-json-ios.git", branch: "release/5.0.0"),
    ]
    
Or as a tagged release:

    dependencies: [
        .package(url: "https://github.com/ngageoint/ogc-api-features-json-ios.git", from: "5.0.0"),
    ]

Reference it in your Package.swift target:

    .target(
        name: "MyApp",
        dependencies: [
            .product(name: "OGC_APIFeaturesJSON", package: "ogc-api-features-json-ios"),
        ],
    ),

### Swift ###

To use from Swift:

    import OGC_APIFeaturesJSON

### Remote Dependencies ###

* [Simple Features GeoJSON](https://github.com/ngageoint/simple-features-geojson-ios) (The MIT License (MIT)) - Simple Features GeoJSON Lib

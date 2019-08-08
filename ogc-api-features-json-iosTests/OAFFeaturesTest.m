//
//  OAFFeaturesTest.m
//  ogc-api-features-json-iosTests
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFFeaturesTest.h"
#import "OAFTestUtils.h"
#import "SFGFeature.h"
#import "SFGFeatureConverter.h"
#import "OAFFeaturesConverter.h"

@implementation OAFFeaturesTest

-(void) testFeatureCollection{
    
    NSString *json = @"{\n  \"type\": \"FeatureCollection\",\n  \"features\": [\n    {\n      \"type\": \"Feature\",\n      \"geometry\": {\n        \"type\": \"Point\"\n      },\n      \"properties\": {}\n    }\n  ],\n  \"links\": [\n    {\n      \"href\": \"http://data.example.org/\",\n      \"rel\": \"self\",\n      \"type\": \"application/geo+json\",\n      \"hreflang\": \"en\"\n    }\n  ],\n  \"timeStamp\": \"2018-04-02T15:14:20-04:00\",\n  \"numberMatched\": 10,\n  \"numberReturned\": 5\n}";
    OAFFeatureCollection *featureCollection = [OAFFeaturesConverter jsonToFeatureCollection:json];
    [OAFTestUtils assertNotNil:featureCollection];
    // TODO
    //[OAFTestUtils assertEqualIntWithValue:10 andValue2:[[featureCollection numberMatched] intValue]];
    //[OAFTestUtils assertEqualIntWithValue:5 andValue2:[[featureCollection numberReturned] intValue]];
    //[OAFTestUtils assertEqualWithValue:@"2018-04-02T15:14:20-04:00" andValue2:[featureCollection timeStamp]];
    NSMutableArray<OAFLink *> *links = [featureCollection links];
    // TODO
    //[OAFTestUtils assertNotNil:links];
    //[OAFTestUtils assertEqualIntWithValue:1 andValue2:(int)links.count];
    //OAFLink *link = [links objectAtIndex:0];
    //[OAFTestUtils assertEqualWithValue:@"http://data.example.org/" andValue2:[link href]];
    //[OAFTestUtils assertEqualWithValue:@"http://data.example.org/" andValue2:[link rel]];
    //[OAFTestUtils assertEqualWithValue:@"application/geo+json" andValue2:[link type]];
    //[OAFTestUtils assertEqualWithValue:@"en" andValue2:[link hreflang]];
    
    [featureCollection setLinks:links];
    
    NSString *jsonValue = [SFGFeatureConverter treeToJSON:[featureCollection toTree]];
    [OAFTestUtils assertNotNil:jsonValue];
    NSDictionary *tree = [OAFFeaturesConverter objectToTree:featureCollection];
    [OAFTestUtils assertNotNil:tree];
    
    json = [OAFFeaturesConverter objectToJSON:featureCollection];
    [OAFTestUtils assertNotNil:json];
    [OAFTestUtils assertNotNil:[OAFFeaturesConverter jsonToFeatureCollection:json]];
    
}

-(void) testFeature{
    
    NSString *json = @"{\n  \"type\": \"Feature\",\n  \"geometry\": {\n    \"type\": \"Point\"\n  },\n  \"properties\": {\n    \"name\": \"string\",\n    \"function\": \"residential\",\n    \"floors\": 0,\n    \"lastUpdate\": \"2019-06-15T21:55:52.722Z\"\n  }\n}";
    SFGFeature *feature = [SFGFeatureConverter jsonToFeature:json];
    [OAFTestUtils assertNotNil:feature];
    
    json = [SFGFeatureConverter objectToJSON:feature];
    [OAFTestUtils assertNotNil:json];
    [OAFTestUtils assertNotNil:[SFGFeatureConverter jsonToFeature:json]];
    
}

@end

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
#import "OAFCrs.h"

@implementation OAFFeaturesTest

-(void) testFeatureCollection{
    
    NSString *json = @"{\"type\":\"FeatureCollection\",\"features\":[{\"type\":\"Feature\",\"geometry\":{\"type\":\"Point\",\"coordinates\":[100,5]},\"properties\":{}}],\"links\":[{\"href\":\"http://data.example.org/\",\"rel\":\"self\",\"type\":\"application/geo+json\",\"hreflang\":\"en\"}],\"timeStamp\":\"2018-04-02T15:14:20-04:00\",\"numberMatched\":10,\"numberReturned\":5}";
    OAFFeatureCollection *featureCollection = [OAFFeaturesConverter jsonToFeatureCollection:json];
    [OAFTestUtils assertNotNil:featureCollection];
    
    [OAFTestUtils assertEqualIntWithValue:1 andValue2:(int)featureCollection.featureCollection.features.count];
    SFGFeature *feature = [featureCollection.featureCollection.features objectAtIndex:0];
    [OAFTestUtils assertNotNil:feature];
    SFGeometry * geometry = [feature simpleGeometry];
    [OAFTestUtils assertTrue:[geometry class] == [SFPoint class]];
    SFPoint *point = (SFPoint *) geometry;
    [OAFTestUtils assertEqualDoubleWithValue:100.0 andValue2:[point.x doubleValue]];
    [OAFTestUtils assertEqualDoubleWithValue:5.0 andValue2:[point.y doubleValue]];
    
    [OAFTestUtils assertEqualIntWithValue:10 andValue2:[[featureCollection numberMatched] intValue]];
    [OAFTestUtils assertEqualIntWithValue:5 andValue2:[[featureCollection numberReturned] intValue]];
    [OAFTestUtils assertEqualWithValue:@"2018-04-02T15:14:20-04:00" andValue2:[featureCollection timeStamp]];
    NSMutableArray<OAFLink *> *links = [featureCollection links];
    [OAFTestUtils assertNotNil:links];
    [OAFTestUtils assertEqualIntWithValue:1 andValue2:(int)links.count];
    OAFLink *link = [links objectAtIndex:0];
    [OAFTestUtils assertEqualWithValue:@"http://data.example.org/" andValue2:[link href]];
    [OAFTestUtils assertEqualWithValue:@"self" andValue2:[link rel]];
    [OAFTestUtils assertEqualWithValue:@"application/geo+json" andValue2:[link type]];
    [OAFTestUtils assertEqualWithValue:@"en" andValue2:[link hreflang]];
    
    [featureCollection setLinks:links];
    
    NSString *json2 = [SFGFeatureConverter treeToJSON:[featureCollection toTree]];
    [OAFTestUtils assertNotNil:json2];
    [OAFTestUtils assertEqualWithValue:json andValue2:json2];
    NSDictionary *tree = [OAFFeaturesConverter objectToTree:featureCollection];
    [OAFTestUtils assertNotNil:tree];
    
    NSString *json3 = [OAFFeaturesConverter objectToJSON:featureCollection];
    [OAFTestUtils assertNotNil:json];
    [OAFTestUtils assertEqualWithValue:json andValue2:json3];
    [OAFTestUtils assertNotNil:[OAFFeaturesConverter jsonToFeatureCollection:json]];
}

-(void) testFeature{
    
    NSString *json = @"{\n  \"type\": \"Feature\",\n  \"geometry\": {\n    \"type\": \"Point\"\n  },\n  \"properties\": {\n    \"name\": \"string\",\n    \"function\": \"residential\",\n    \"floors\": 0,\n    \"lastUpdate\": \"2019-06-15T21:55:52.722Z\"\n  }\n}";
    NSString *jsonTest = @"{\"type\":\"Feature\",\"geometry\":null,\"properties\":{\"floors\":0,\"function\":\"residential\",\"name\":\"string\",\"lastUpdate\":\"2019-06-15T21:55:52.722Z\"}}";
    SFGFeature *feature = [SFGFeatureConverter jsonToFeature:json];
    [OAFTestUtils assertNotNil:feature];
    
    NSString *json2 = [SFGFeatureConverter objectToJSON:feature];
    [OAFTestUtils assertNotNil:json2];
    [OAFTestUtils assertEqualWithValue:jsonTest andValue2:json2];
    [OAFTestUtils assertNotNil:[SFGFeatureConverter jsonToFeature:json2]];
    
}

-(void) testCrs{
    
    OAFCrs *crs = [[OAFCrs alloc] initWithCrs:@"http://www.opengis.net/def/crs/EPSG/0/25832"];
    [OAFTestUtils assertEqualWithValue:@"EPSG" andValue2:crs.authority];
    [OAFTestUtils assertEqualWithValue:@"0" andValue2:crs.version];
    [OAFTestUtils assertEqualWithValue:@"25832" andValue2:crs.code];
    
    crs = [[OAFCrs alloc] initWithCrs:@"http://www.opengis.net/def/crs/OGC/1.3/CRS84"];
    [OAFTestUtils assertEqualWithValue:@"OGC" andValue2:crs.authority];
    [OAFTestUtils assertEqualWithValue:@"1.3" andValue2:crs.version];
    [OAFTestUtils assertEqualWithValue:@"CRS84" andValue2:crs.code];
    
}

@end

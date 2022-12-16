//
//  OAFFeaturesTest.m
//  ogc-api-features-json-iosTests
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFFeaturesTest.h"
#import "OAFTestUtils.h"
#import "SFGFeatureConverter.h"
#import "OAFFeaturesConverter.h"
#import "OAFCrs.h"

@implementation OAFFeaturesTest

-(void) testCollections{
    
    NSString *content = @"{\n";
    content = [content stringByAppendingString:@"  \"links\" : [ {\n"];
    content = [content stringByAppendingString:@"    \"rel\" : \"self\",\n"];
    content = [content stringByAppendingString:@"    \"type\" : \"application/json\",\n"];
    content = [content stringByAppendingString:@"    \"title\" : \"this document\",\n"];
    content = [content stringByAppendingString:@"    \"href\" : \"https://www.ldproxy.nrw.de/kataster/collections?f=json\"\n"];
    content = [content stringByAppendingString:@"  }, {\n"];
    content = [content stringByAppendingString:@"    \"rel\" : \"alternate\",\n"];
    content = [content stringByAppendingString:@"    \"type\" : \"application/xml\",\n"];
    content = [content stringByAppendingString:@"    \"title\" : \"this document as XML\",\n"];
    content = [content stringByAppendingString:@"    \"href\" : \"https://www.ldproxy.nrw.de/kataster/collections?f=xml\"\n"];
    content = [content stringByAppendingString:@"  }, {\n"];
    content = [content stringByAppendingString:@"    \"rel\" : \"alternate\",\n"];
    content = [content stringByAppendingString:@"    \"type\" : \"text/html\",\n"];
    content = [content stringByAppendingString:@"    \"title\" : \"this document as HTML\",\n"];
    content = [content stringByAppendingString:@"    \"href\" : \"https://www.ldproxy.nrw.de/kataster/collections?f=html\"\n"];
    content = [content stringByAppendingString:@"  }, {\n"];
    content = [content stringByAppendingString:@"    \"rel\" : \"service\",\n"];
    content = [content stringByAppendingString:@"    \"type\" : \"application/openapi+json;version=3.0\",\n"];
    content = [content stringByAppendingString:@"    \"title\" : \"the OpenAPI definition as JSON\",\n"];
    content = [content stringByAppendingString:@"    \"href\" : \"https://www.ldproxy.nrw.de/kataster/api?f=json\"\n"];
    content = [content stringByAppendingString:@"  }, {\n"];
    content = [content stringByAppendingString:@"    \"rel\" : \"service\",\n"];
    content = [content stringByAppendingString:@"    \"type\" : \"text/html\",\n"];
    content = [content stringByAppendingString:@"    \"title\" : \"the OpenAPI definition as HTML\",\n"];
    content = [content stringByAppendingString:@"    \"href\" : \"https://www.ldproxy.nrw.de/kataster/api?f=html\"\n"];
    content = [content stringByAppendingString:@"  }, {\n"];
    content = [content stringByAppendingString:@"    \"rel\" : \"conformance\",\n"];
    content = [content stringByAppendingString:@"    \"type\" : \"application/json\",\n"];
    content = [content stringByAppendingString:@"    \"title\" : \"WFS 3.0 conformance classes implemented by this server\",\n"];
    content = [content stringByAppendingString:@"    \"href\" : \"https://www.ldproxy.nrw.de/kataster/conformance?f=json\"\n"];
    content = [content stringByAppendingString:@"  } ],\n"];
    content = [content stringByAppendingString:@"  \"crs\" : [ \"http://www.opengis.net/def/crs/EPSG/0/25832\", \"http://www.opengis.net/def/crs/OGC/1.3/CRS84\", \"http://www.opengis.net/def/crs/EPSG/0/3034\", \"http://www.opengis.net/def/crs/EPSG/0/3035\", \"http://www.opengis.net/def/crs/EPSG/0/3043\", \"http://www.opengis.net/def/crs/EPSG/0/3044\", \"http://www.opengis.net/def/crs/EPSG/0/3045\", \"http://www.opengis.net/def/crs/EPSG/0/3857\", \"http://www.opengis.net/def/crs/EPSG/0/4258\", \"http://www.opengis.net/def/crs/EPSG/0/4326\", \"http://www.opengis.net/def/crs/EPSG/0/4647\", \"http://www.opengis.net/def/crs/EPSG/0/5649\", \"http://www.opengis.net/def/crs/EPSG/0/5650\", \"http://www.opengis.net/def/crs/EPSG/0/5651\", \"http://www.opengis.net/def/crs/EPSG/0/5652\", \"http://www.opengis.net/def/crs/EPSG/0/5653\", \"http://www.opengis.net/def/crs/EPSG/0/28992\", \"http://www.opengis.net/def/crs/EPSG/0/25831\", \"http://www.opengis.net/def/crs/EPSG/0/25832\", \"http://www.opengis.net/def/crs/EPSG/0/25833\" ],\n"];
    content = [content stringByAppendingString:@"  \"collections\" : [ {\n"];
    content = [content stringByAppendingString:@"    \"id\" : \"flurstueck\",\n"];
    content = [content stringByAppendingString:@"    \"title\" : \"Flurstück\",\n"];
    content = [content stringByAppendingString:@"    \"extent\" : {\n"];
    content = [content stringByAppendingString:@"      \"spatial\" : { \"bbox\" : [ 5.61272621360749, 50.2373512077239, 9.58963433710139, 52.5286304537795 ] },\n"];
    content = [content stringByAppendingString:@"      \"temporal\" : { \"interval\" : [ \"2018-05-18T14:45:44Z\", \"2019-06-17T21:41:19Z\" ] }\n"];
    content = [content stringByAppendingString:@"    },\n"];
    content = [content stringByAppendingString:@"    \"links\" : [ {\n"];
    content = [content stringByAppendingString:@"      \"rel\" : \"item\",\n"];
    content = [content stringByAppendingString:@"      \"type\" : \"application/geo+json\",\n"];
    content = [content stringByAppendingString:@"      \"title\" : \"Flurstück as GeoJSON\",\n"];
    content = [content stringByAppendingString:@"      \"href\" : \"https://www.ldproxy.nrw.de/kataster/collections/flurstueck/items?f=json\"\n"];
    content = [content stringByAppendingString:@"    }, {\n"];
    content = [content stringByAppendingString:@"      \"rel\" : \"item\",\n"];
    content = [content stringByAppendingString:@"      \"type\" : \"application/gml+xml;profile=\\\"http://www.opengis.net/def/profile/ogc/2.0/gml-sf2\\\";version=3.2\",\n"];
    content = [content stringByAppendingString:@"      \"title\" : \"Flurstück as GML\",\n"];
    content = [content stringByAppendingString:@"      \"href\" : \"https://www.ldproxy.nrw.de/kataster/collections/flurstueck/items?f=xml\"\n"];
    content = [content stringByAppendingString:@"    }, {\n"];
    content = [content stringByAppendingString:@"      \"rel\" : \"item\",\n"];
    content = [content stringByAppendingString:@"      \"type\" : \"text/html\",\n"];
    content = [content stringByAppendingString:@"      \"title\" : \"Flurstück as HTML\",\n"];
    content = [content stringByAppendingString:@"      \"href\" : \"https://www.ldproxy.nrw.de/kataster/collections/flurstueck/items?f=html\"\n"];
    content = [content stringByAppendingString:@"    }, {\n"];
    content = [content stringByAppendingString:@"      \"rel\" : \"data\",\n"];
    content = [content stringByAppendingString:@"      \"type\" : \"application/json\",\n"];
    content = [content stringByAppendingString:@"      \"title\" : \"Information about the Flurstück data\",\n"];
    content = [content stringByAppendingString:@"      \"href\" : \"https://www.ldproxy.nrw.de/kataster/collections/flurstueck?f=json\"\n"];
    content = [content stringByAppendingString:@"    }, {\n"];
    content = [content stringByAppendingString:@"      \"rel\" : \"data\",\n"];
    content = [content stringByAppendingString:@"      \"type\" : \"application/gml+xml;profile=\\\\\\\"http://www.opengis.net/def/profile/ogc/2.0/gml-sf2\\\\\\\";version=3.2\",\n"];
    content = [content stringByAppendingString:@"      \"title\" : \"Information about the Flurstück data\",\n"];
    content = [content stringByAppendingString:@"      \"href\" : \"https://www.ldproxy.nrw.de/kataster/collections/flurstueck?f=xml\"\n"];
    content = [content stringByAppendingString:@"    }, {\n"];
    content = [content stringByAppendingString:@"      \"rel\" : \"data\",\n"];
    content = [content stringByAppendingString:@"      \"type\" : \"text/html\",\n"];
    content = [content stringByAppendingString:@"      \"title\" : \"Information about the Flurstück data\",\n"];
    content = [content stringByAppendingString:@"      \"href\" : \"https://www.ldproxy.nrw.de/kataster/collections/flurstueck?f=html\"\n"];
    content = [content stringByAppendingString:@"    } ],\n"];
    content = [content stringByAppendingString:@"    \"crs\" : [ \"http://www.opengis.net/def/crs/EPSG/0/25832\", \"http://www.opengis.net/def/crs/OGC/1.3/CRS84\", \"http://www.opengis.net/def/crs/EPSG/0/3034\", \"http://www.opengis.net/def/crs/EPSG/0/3035\", \"http://www.opengis.net/def/crs/EPSG/0/3043\", \"http://www.opengis.net/def/crs/EPSG/0/3044\", \"http://www.opengis.net/def/crs/EPSG/0/3045\", \"http://www.opengis.net/def/crs/EPSG/0/3857\", \"http://www.opengis.net/def/crs/EPSG/0/4258\", \"http://www.opengis.net/def/crs/EPSG/0/4326\", \"http://www.opengis.net/def/crs/EPSG/0/4647\", \"http://www.opengis.net/def/crs/EPSG/0/5649\", \"http://www.opengis.net/def/crs/EPSG/0/5650\", \"http://www.opengis.net/def/crs/EPSG/0/5651\", \"http://www.opengis.net/def/crs/EPSG/0/5652\", \"http://www.opengis.net/def/crs/EPSG/0/5653\", \"http://www.opengis.net/def/crs/EPSG/0/28992\", \"http://www.opengis.net/def/crs/EPSG/0/25831\", \"http://www.opengis.net/def/crs/EPSG/0/25832\", \"http://www.opengis.net/def/crs/EPSG/0/25833\" ],\n"];
    content = [content stringByAppendingString:@"    \"relations\" : {\n"];
    content = [content stringByAppendingString:@"      \"bahnstrecken\" : \"Bahnstrecken in 500m Umkreis\",\n"];
    content = [content stringByAppendingString:@"      \"gewaesser\" : \"Stehende Gewässer in 4km Umkreis\"\n"];
    content = [content stringByAppendingString:@"    }\n"];
    content = [content stringByAppendingString:@"  }, {\n"];
    content = [content stringByAppendingString:@"    \"id\" : \"gebaeudebauwerk\",\n"];
    content = [content stringByAppendingString:@"    \"title\" : \"Gebäude, Bauwerk\",\n"];
    content = [content stringByAppendingString:@"    \"extent\" : {\n"];
    content = [content stringByAppendingString:@"      \"spatial\" : { \"bbox\" : [ 5.61272621360749, 50.2373512077239, 9.58963433710139, 52.5286304537795 ] },\n"];
    content = [content stringByAppendingString:@"      \"temporal\" : { \"interval\" : [ \"2018-05-18T14:45:44Z\", \"2019-06-17T21:41:19Z\" ] }\n"];
    content = [content stringByAppendingString:@"    },\n"];
    content = [content stringByAppendingString:@"    \"links\" : [ {\n"];
    content = [content stringByAppendingString:@"      \"rel\" : \"item\",\n"];
    content = [content stringByAppendingString:@"      \"type\" : \"application/geo+json\",\n"];
    content = [content stringByAppendingString:@"      \"title\" : \"Gebäude, Bauwerk as GeoJSON\",\n"];
    content = [content stringByAppendingString:@"      \"href\" : \"https://www.ldproxy.nrw.de/kataster/collections/gebaeudebauwerk/items?f=json\"\n"];
    content = [content stringByAppendingString:@"    }, {\n"];
    content = [content stringByAppendingString:@"      \"rel\" : \"item\",\n"];
    content = [content stringByAppendingString:@"      \"type\" : \"application/gml+xml;profile=\\\"http://www.opengis.net/def/profile/ogc/2.0/gml-sf2\\\";version=3.2\",\n"];
    content = [content stringByAppendingString:@"      \"title\" : \"Gebäude, Bauwerk as GML\",\n"];
    content = [content stringByAppendingString:@"      \"href\" : \"https://www.ldproxy.nrw.de/kataster/collections/gebaeudebauwerk/items?f=xml\"\n"];
    content = [content stringByAppendingString:@"    }, {\n"];
    content = [content stringByAppendingString:@"      \"rel\" : \"item\",\n"];
    content = [content stringByAppendingString:@"      \"type\" : \"text/html\",\n"];
    content = [content stringByAppendingString:@"      \"title\" : \"Gebäude, Bauwerk as HTML\",\n"];
    content = [content stringByAppendingString:@"      \"href\" : \"https://www.ldproxy.nrw.de/kataster/collections/gebaeudebauwerk/items?f=html\"\n"];
    content = [content stringByAppendingString:@"    }, {\n"];
    content = [content stringByAppendingString:@"      \"rel\" : \"data\",\n"];
    content = [content stringByAppendingString:@"      \"type\" : \"application/json\",\n"];
    content = [content stringByAppendingString:@"      \"title\" : \"Information about the Gebäude, Bauwerk data\",\n"];
    content = [content stringByAppendingString:@"      \"href\" : \"https://www.ldproxy.nrw.de/kataster/collections/gebaeudebauwerk?f=json\"\n"];
    content = [content stringByAppendingString:@"    }, {\n"];
    content = [content stringByAppendingString:@"      \"rel\" : \"data\",\n"];
    content = [content stringByAppendingString:@"      \"type\" : \"application/gml+xml;profile=\\\\\\\"http://www.opengis.net/def/profile/ogc/2.0/gml-sf2\\\\\\\";version=3.2\",\n"];
    content = [content stringByAppendingString:@"      \"title\" : \"Information about the Gebäude, Bauwerk data\",\n"];
    content = [content stringByAppendingString:@"      \"href\" : \"https://www.ldproxy.nrw.de/kataster/collections/gebaeudebauwerk?f=xml\"\n"];
    content = [content stringByAppendingString:@"    }, {\n"];
    content = [content stringByAppendingString:@"      \"rel\" : \"data\",\n"];
    content = [content stringByAppendingString:@"      \"type\" : \"text/html\",\n"];
    content = [content stringByAppendingString:@"      \"title\" : \"Information about the Gebäude, Bauwerk data\",\n"];
    content = [content stringByAppendingString:@"      \"href\" : \"https://www.ldproxy.nrw.de/kataster/collections/gebaeudebauwerk?f=html\"\n"];
    content = [content stringByAppendingString:@"    } ],\n"];
    content = [content stringByAppendingString:@"    \"crs\" : [ \"http://www.opengis.net/def/crs/EPSG/0/25832\", \"http://www.opengis.net/def/crs/OGC/1.3/CRS84\", \"http://www.opengis.net/def/crs/EPSG/0/3034\", \"http://www.opengis.net/def/crs/EPSG/0/3035\", \"http://www.opengis.net/def/crs/EPSG/0/3043\", \"http://www.opengis.net/def/crs/EPSG/0/3044\", \"http://www.opengis.net/def/crs/EPSG/0/3045\", \"http://www.opengis.net/def/crs/EPSG/0/3857\", \"http://www.opengis.net/def/crs/EPSG/0/4258\", \"http://www.opengis.net/def/crs/EPSG/0/4326\", \"http://www.opengis.net/def/crs/EPSG/0/4647\", \"http://www.opengis.net/def/crs/EPSG/0/5649\", \"http://www.opengis.net/def/crs/EPSG/0/5650\", \"http://www.opengis.net/def/crs/EPSG/0/5651\", \"http://www.opengis.net/def/crs/EPSG/0/5652\", \"http://www.opengis.net/def/crs/EPSG/0/5653\", \"http://www.opengis.net/def/crs/EPSG/0/28992\", \"http://www.opengis.net/def/crs/EPSG/0/25831\", \"http://www.opengis.net/def/crs/EPSG/0/25832\", \"http://www.opengis.net/def/crs/EPSG/0/25833\" ]\n"];
    content = [content stringByAppendingString:@"  }, {\n"];
    content = [content stringByAppendingString:@"    \"id\" : \"verwaltungseinheit\",\n"];
    content = [content stringByAppendingString:@"    \"title\" : \"Verwaltungseinheit\",\n"];
    content = [content stringByAppendingString:@"    \"extent\" : {\n"];
    content = [content stringByAppendingString:@"      \"spatial\" : { \"bbox\" : [ 5.61272621360749, 50.2373512077239, 9.58963433710139, 52.5286304537795 ] },\n"];
    content = [content stringByAppendingString:@"      \"temporal\" : { \"interval\" : [ \"2018-05-18T14:45:44Z\", \"2019-06-17T21:41:19Z\" ] }\n"];
    content = [content stringByAppendingString:@"    },\n"];
    content = [content stringByAppendingString:@"    \"links\" : [ {\n"];
    content = [content stringByAppendingString:@"      \"rel\" : \"item\",\n"];
    content = [content stringByAppendingString:@"      \"type\" : \"application/geo+json\",\n"];
    content = [content stringByAppendingString:@"      \"title\" : \"Verwaltungseinheit as GeoJSON\",\n"];
    content = [content stringByAppendingString:@"      \"href\" : \"https://www.ldproxy.nrw.de/kataster/collections/verwaltungseinheit/items?f=json\"\n"];
    content = [content stringByAppendingString:@"    }, {\n"];
    content = [content stringByAppendingString:@"      \"rel\" : \"item\",\n"];
    content = [content stringByAppendingString:@"      \"type\" : \"application/gml+xml;profile=\\\"http://www.opengis.net/def/profile/ogc/2.0/gml-sf2\\\";version=3.2\",\n"];
    content = [content stringByAppendingString:@"      \"title\" : \"Verwaltungseinheit as GML\",\n"];
    content = [content stringByAppendingString:@"      \"href\" : \"https://www.ldproxy.nrw.de/kataster/collections/verwaltungseinheit/items?f=xml\"\n"];
    content = [content stringByAppendingString:@"    }, {\n"];
    content = [content stringByAppendingString:@"      \"rel\" : \"item\",\n"];
    content = [content stringByAppendingString:@"      \"type\" : \"text/html\",\n"];
    content = [content stringByAppendingString:@"      \"title\" : \"Verwaltungseinheit as HTML\",\n"];
    content = [content stringByAppendingString:@"      \"href\" : \"https://www.ldproxy.nrw.de/kataster/collections/verwaltungseinheit/items?f=html\"\n"];
    content = [content stringByAppendingString:@"    }, {\n"];
    content = [content stringByAppendingString:@"      \"rel\" : \"data\",\n"];
    content = [content stringByAppendingString:@"      \"type\" : \"application/json\",\n"];
    content = [content stringByAppendingString:@"      \"title\" : \"Information about the Verwaltungseinheit data\",\n"];
    content = [content stringByAppendingString:@"      \"href\" : \"https://www.ldproxy.nrw.de/kataster/collections/verwaltungseinheit?f=json\"\n"];
    content = [content stringByAppendingString:@"    }, {\n"];
    content = [content stringByAppendingString:@"      \"rel\" : \"data\",\n"];
    content = [content stringByAppendingString:@"      \"type\" : \"application/gml+xml;profile=\\\\\\\"http://www.opengis.net/def/profile/ogc/2.0/gml-sf2\\\\\\\";version=3.2\",\n"];
    content = [content stringByAppendingString:@"      \"title\" : \"Information about the Verwaltungseinheit data\",\n"];
    content = [content stringByAppendingString:@"      \"href\" : \"https://www.ldproxy.nrw.de/kataster/collections/verwaltungseinheit?f=xml\"\n"];
    content = [content stringByAppendingString:@"    }, {\n"];
    content = [content stringByAppendingString:@"      \"rel\" : \"data\",\n"];
    content = [content stringByAppendingString:@"      \"type\" : \"text/html\",\n"];
    content = [content stringByAppendingString:@"      \"title\" : \"Information about the Verwaltungseinheit data\",\n"];
    content = [content stringByAppendingString:@"      \"href\" : \"https://www.ldproxy.nrw.de/kataster/collections/verwaltungseinheit?f=html\"\n"];
    content = [content stringByAppendingString:@"    } ],\n"];
    content = [content stringByAppendingString:@"    \"crs\" : [ \"http://www.opengis.net/def/crs/EPSG/0/25832\", \"http://www.opengis.net/def/crs/OGC/1.3/CRS84\", \"http://www.opengis.net/def/crs/EPSG/0/3034\", \"http://www.opengis.net/def/crs/EPSG/0/3035\", \"http://www.opengis.net/def/crs/EPSG/0/3043\", \"http://www.opengis.net/def/crs/EPSG/0/3044\", \"http://www.opengis.net/def/crs/EPSG/0/3045\", \"http://www.opengis.net/def/crs/EPSG/0/3857\", \"http://www.opengis.net/def/crs/EPSG/0/4258\", \"http://www.opengis.net/def/crs/EPSG/0/4326\", \"http://www.opengis.net/def/crs/EPSG/0/4647\", \"http://www.opengis.net/def/crs/EPSG/0/5649\", \"http://www.opengis.net/def/crs/EPSG/0/5650\", \"http://www.opengis.net/def/crs/EPSG/0/5651\", \"http://www.opengis.net/def/crs/EPSG/0/5652\", \"http://www.opengis.net/def/crs/EPSG/0/5653\", \"http://www.opengis.net/def/crs/EPSG/0/28992\", \"http://www.opengis.net/def/crs/EPSG/0/25831\", \"http://www.opengis.net/def/crs/EPSG/0/25832\", \"http://www.opengis.net/def/crs/EPSG/0/25833\" ]\n"];
    content = [content stringByAppendingString:@"  } ]\n"];
    content = [content stringByAppendingString:@"}"];
    
    OAFCollections *collections = [OAFFeaturesConverter jsonToCollections:content];
    [self validateCollections:collections];
    
    NSString *json = [OAFFeaturesConverter objectToJSON:collections];
    [OAFTestUtils assertNotNil:json];
    
    OAFCollections *collections2 = [OAFFeaturesConverter jsonToCollections:json];
    [self validateCollections:collections2];
    
}

-(void) validateCollections: (OAFCollections *) collections{
    [OAFTestUtils assertNotNil:collections];
    [self validateLinks:collections.links withCount:6];
    [self validateCollectionArray:collections.collections withCount:3];
    [OAFTestUtils assertNotNil:collections.foreignMembers];
    [OAFTestUtils assertEqualIntWithValue:1 andValue2:(int)collections.foreignMembers.count];
    NSArray *crs = (NSArray *)[collections.foreignMembers objectForKey:OAF_CRS];
    [OAFTestUtils assertEqualIntWithValue:20 andValue2:(int)crs.count];
}

-(void) validateCollectionArray: (NSMutableArray<OAFCollection *> *) collections withCount: (int) count{
    [OAFTestUtils assertEqualIntWithValue:count andValue2:(int)collections.count];
    for(int i = 0; i < count; i++){
        [self validateCollection:[collections objectAtIndex:i]];
    }
}

-(void) validateCollection: (OAFCollection *) collection{
    [OAFTestUtils assertNotNil:collection.id];
    [OAFTestUtils assertNotNil:collection.title];
    [OAFTestUtils assertNotNil:collection.extent];
    [OAFTestUtils assertNotNil:collection.extent.spatial];
    [OAFTestUtils assertNotNil:collection.extent.spatial.bbox];
    [OAFTestUtils assertEqualIntWithValue:4 andValue2:(int)collection.extent.spatial.bbox.count];
    [OAFTestUtils assertNotNil:collection.extent.temporal];
    [OAFTestUtils assertNotNil:collection.extent.temporal.interval];
    [OAFTestUtils assertEqualIntWithValue:2 andValue2:(int)collection.extent.temporal.interval.count];
    [self validateLinks:collection.links withCount:6];
    [OAFTestUtils assertEqualIntWithValue:20 andValue2:(int)collection.crs.count];
}

-(void) validateLinks: (NSMutableArray<OAFLink *> *) links withCount: (int) count{
    [OAFTestUtils assertEqualIntWithValue:count andValue2:(int)links.count];
    for(int i = 0; i < count; i++){
        [self validateLink:[links objectAtIndex:i]];
    }
}

-(void) validateLink: (OAFLink *) link{
    [OAFTestUtils assertNotNil:link.rel];
    [OAFTestUtils assertNotNil:link.type];
    [OAFTestUtils assertNotNil:link.title];
    [OAFTestUtils assertNotNil:link.href];
}

-(void) testCollection{
    
    NSString *content = @"{\n";
    content = [content stringByAppendingString:@"  \"id\": \"buildings\",\n"];
    content = [content stringByAppendingString:@"  \"title\": \"Buildings\",\n"];
    content = [content stringByAppendingString:@"  \"description\": \"Buildings in the city of Bonn.\",\n"];
    content = [content stringByAppendingString:@"  \"extent\": {\n"];
    content = [content stringByAppendingString:@"  \"spatial\": { \"bbox\" : [ 7.01, 50.63, 7.22, 50.78 ] },\n"];
    content = [content stringByAppendingString:@"  \"temporal\": { \"interval\" : [ \"2010-02-15T12:34:56Z\", \"2018-03-18T12:11:00Z\" ] }\n"];
    content = [content stringByAppendingString:@"  },\n"];
    content = [content stringByAppendingString:@"  \"links\": [\n"];
    content = [content stringByAppendingString:@"  { \"href\": \"http://data.example.org/collections/buildings/items\",\n"];
    content = [content stringByAppendingString:@"  \"rel\": \"item\", \"type\": \"application/geo+json\",\n"];
    content = [content stringByAppendingString:@"  \"title\": \"Buildings\" },\n"];
    content = [content stringByAppendingString:@"  { \"href\": \"http://example.org/concepts/building.html\",\n"];
    content = [content stringByAppendingString:@"  \"rel\": \"describedBy\", \"type\": \"text/html\",\n"];
    content = [content stringByAppendingString:@"  \"title\": \"Feature catalogue for buildings\" }\n"];
    content = [content stringByAppendingString:@"  ] }"];
    
    OAFCollection *collection = [OAFFeaturesConverter jsonToCollection:content];
    [OAFTestUtils assertNotNil:collection];
    [self validateSingleCollection:collection];

    NSString *json = [OAFFeaturesConverter objectToJSON:collection];
    [OAFTestUtils assertNotNil:json];
    OAFCollection *collection2 = [OAFFeaturesConverter jsonToCollection:json];
    [OAFTestUtils assertNotNil:collection2];
    [self validateSingleCollection:collection2];
    
}

-(void) validateSingleCollection: (OAFCollection *) collection{
    [OAFTestUtils assertEqualWithValue:@"buildings" andValue2:collection.id];
    [OAFTestUtils assertEqualWithValue:@"Buildings" andValue2:collection.title];
    [OAFTestUtils assertEqualWithValue:@"Buildings in the city of Bonn." andValue2:collection.theDescription];
    OAFExtent *extent = collection.extent;
    [OAFTestUtils assertNotNil:extent];
    [OAFTestUtils assertEqualIntWithValue:4 andValue2:(int)extent.spatial.bbox.count];
    [OAFTestUtils assertEqualDoubleWithValue:7.01 andValue2:[[extent.spatial.bbox objectAtIndex:0] doubleValue]];
    [OAFTestUtils assertEqualDoubleWithValue:50.63 andValue2:[[extent.spatial.bbox objectAtIndex:1] doubleValue]];
    [OAFTestUtils assertEqualDoubleWithValue:7.22 andValue2:[[extent.spatial.bbox objectAtIndex:2] doubleValue] andDelta:0.000000000000001];
    [OAFTestUtils assertEqualDoubleWithValue:50.78 andValue2:[[extent.spatial.bbox objectAtIndex:3] doubleValue]];
    [OAFTestUtils assertEqualIntWithValue:2 andValue2:(int)extent.temporal.interval.count];
    [OAFTestUtils assertEqualWithValue:@"2010-02-15T12:34:56Z" andValue2:[extent.temporal.interval objectAtIndex:0]];
    [OAFTestUtils assertEqualWithValue:@"2018-03-18T12:11:00Z" andValue2:[extent.temporal.interval objectAtIndex:1]];
    NSMutableArray<OAFLink *> *links = collection.links;
    [OAFTestUtils assertNotNil:links];
    [OAFTestUtils assertEqualIntWithValue:2 andValue2:(int)links.count];
    [OAFTestUtils assertEqualWithValue:@"http://data.example.org/collections/buildings/items" andValue2:[links objectAtIndex:0].href];
    [OAFTestUtils assertEqualWithValue:@"item" andValue2:[links objectAtIndex:0].rel];
    [OAFTestUtils assertEqualWithValue:@"http://example.org/concepts/building.html" andValue2:[links objectAtIndex:1].href];
    [OAFTestUtils assertEqualWithValue:@"describedBy" andValue2:[links objectAtIndex:1].rel];
}

-(void) testFeatureCollection{
    
    NSString *json = @"{\"type\":\"FeatureCollection\",\"features\":[{\"type\":\"Feature\",\"geometry\":{\"type\":\"Point\",\"coordinates\":[100,5]},\"properties\":{}}],\"links\":[{\"href\":\"http://data.example.org/\",\"rel\":\"self\",\"type\":\"application/geo+json\",\"hreflang\":\"en\"}],\"timeStamp\":\"2018-04-02T15:14:20-04:00\",\"numberMatched\":10,\"numberReturned\":5}";
    OAFFeatureCollection *featureCollection = [OAFFeaturesConverter jsonToFeatureCollection:json];
    [OAFTestUtils assertNotNil:featureCollection];
    
    [OAFTestUtils assertEqualIntWithValue:1 andValue2:(int)featureCollection.featureCollection.features.count];
    SFGFeature *feature = [featureCollection.featureCollection.features objectAtIndex:0];
    [OAFTestUtils assertNotNil:feature];
    SFGeometry *geometry = [feature simpleGeometry];
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
    NSString *jsonTest = @"{\"type\":\"Feature\",\"geometry\":{\"type\":\"Point\",\"coordinates\":[]},\"properties\":{\"floors\":0,\"function\":\"residential\",\"name\":\"string\",\"lastUpdate\":\"2019-06-15T21:55:52.722Z\"}}";
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

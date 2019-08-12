//
//  OAFFeaturesConverter.m
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFFeaturesConverter.h"
#import "SFGFeatureConverter.h"

@implementation OAFFeaturesConverter

+(OAFCollections *) jsonToCollections: (NSString *) json{
    return [self treeToCollections:[SFGFeatureConverter jsonToTree:json]];
}

+(OAFCollections *) treeToCollections: (NSDictionary *) tree{
    return [[OAFCollections alloc] initWithTree:tree];
}

+(OAFCollection *) jsonToCollection: (NSString *) json{
    return [self treeToCollection:[SFGFeatureConverter jsonToTree:json]];
}

+(OAFCollection *) treeToCollection: (NSDictionary *) tree{
    return [[OAFCollection alloc] initWithTree:tree];
}

+(OAFFeatureCollection *) jsonToFeatureCollection: (NSString *) json{
    return [self treeToFeatureCollection:[SFGFeatureConverter jsonToTree:json]];
}

+(OAFFeatureCollection *) treeToFeatureCollection: (NSDictionary *) tree{
    return [[OAFFeatureCollection alloc] initWithTree:tree];
}

+(OAFFeatureCollection *) simpleGeometryToFeatureCollection: (SFGeometry *) simpleGeometry{
    return [[OAFFeatureCollection alloc] initWithFeatureCollection:[SFGFeatureConverter simpleGeometryToFeatureCollection:simpleGeometry]];
}

+(OAFFeatureCollection *) simpleGeometriesToFeatureCollection: (NSArray<SFGeometry *> *) simpleGeometries{
    return [[OAFFeatureCollection alloc] initWithFeatureCollection:[SFGFeatureConverter simpleGeometriesToFeatureCollection:simpleGeometries]];
}

+(OAFLink *) jsonToLink: (NSString *) json{
    return [self treeToLink:[SFGFeatureConverter jsonToTree:json]];
}

+(OAFLink *) treeToLink: (NSDictionary *) tree{
    return [[OAFLink alloc] initWithTree:tree];
}

+(OAFSpatial *) jsonToSpatial: (NSString *) json{
    return [self treeToSpatial:[SFGFeatureConverter jsonToTree:json]];
}

+(OAFSpatial *) treeToSpatial: (NSDictionary *) tree{
    return [[OAFSpatial alloc] initWithTree:tree];
}

+(OAFTemporal *) jsonToTemporal: (NSString *) json{
    return [self treeToTemporal:[SFGFeatureConverter jsonToTree:json]];
}

+(OAFTemporal *) treeToTemporal: (NSDictionary *) tree{
    return [[OAFTemporal alloc] initWithTree:tree];
}

+(OAFExtent *) jsonToExtent: (NSString *) json{
    return [self treeToExtent:[SFGFeatureConverter jsonToTree:json]];
}

+(OAFExtent *) treeToExtent: (NSDictionary *) tree{
    return [[OAFExtent alloc] initWithTree:tree];
}

+(NSString *) objectToJSON: (OAFFeaturesObject *) object{
    NSDictionary *tree = [self objectToTree:object];
    NSString *json = [SFGFeatureConverter treeToJSON:tree];
    return json;
}

+(NSMutableDictionary *) objectToMutableTree: (OAFFeaturesObject *) object{
    return [object toTree];
}

+(NSDictionary *) objectToTree: (OAFFeaturesObject *) object{
    return [self objectToMutableTree:object];
}

@end

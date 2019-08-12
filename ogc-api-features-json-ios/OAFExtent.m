//
//  OAFExtent.m
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFExtent.h"
#import "OAFFeaturesConverter.h"

NSString * const OAF_SPATIAL = @"spatial";
NSString * const OAF_TEMPORAL = @"temporal";

@implementation OAFExtent

-(instancetype) init{
    self = [super init];
    return self;
}

-(instancetype) initWithTree: (NSDictionary *) tree{
    self = [super initWithTree:tree];
    return self;
}

-(NSMutableDictionary *) toTree{
    NSMutableDictionary *tree = [super toTree];
    if(self.spatial != nil){
        [tree setObject:[self.spatial toTree] forKey:OAF_SPATIAL];
    }
    if(self.temporal != nil){
        [tree setObject:[self.temporal toTree] forKey:OAF_TEMPORAL];
    }
    return tree;
}

-(void) fromTree: (NSDictionary *) tree{
    [super fromTree:tree];
    NSDictionary *spatialTree = [tree objectForKey:OAF_SPATIAL];
    OAFSpatial *spatial = nil;
    if(![spatialTree isEqual:[NSNull null]] && spatialTree != nil){
        spatial = [OAFFeaturesConverter treeToSpatial:spatialTree];
    }
    [self setSpatial:spatial];
    NSDictionary *temporalTree = [tree objectForKey:OAF_TEMPORAL];
    OAFTemporal *temporal = nil;
    if(![temporalTree isEqual:[NSNull null]] && temporalTree != nil){
        temporal = [OAFFeaturesConverter treeToTemporal:temporalTree];
    }
    [self setTemporal:temporal];
}

@end

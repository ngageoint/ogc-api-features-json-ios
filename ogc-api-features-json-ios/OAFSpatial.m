//
//  OAFSpatial.m
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFSpatial.h"

NSString * const OAF_BBOX = @"bbox";
NSString * const OAF_CRS = @"crs";

static NSOrderedSet *keys = nil;

@implementation OAFSpatial

+ (void)initialize {
    if(keys == nil){
        keys = [NSOrderedSet orderedSetWithObjects:OAF_BBOX, OAF_CRS, nil];
    }
}

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
    if(self.bbox != nil){
        [tree setObject:self.bbox forKey:OAF_BBOX];
    }
    if(self.crs != nil){
        [tree setObject:self.crs forKey:OAF_CRS];
    }
    return tree;
}

-(void) fromTree: (NSDictionary *) tree{
    [super fromTree:tree];
    NSArray *boundingBox = [tree objectForKey:OAF_BBOX];
    if(![boundingBox isEqual:[NSNull null]] && boundingBox != nil){
        self.bbox = [NSMutableArray array];
        for(NSNumber *number in boundingBox){
            [self.bbox addObject:[[NSDecimalNumber alloc] initWithDouble:[number doubleValue]]];
        }
    }
    self.crs = [tree objectForKey:OAF_CRS];
}

-(NSOrderedSet<NSString *> *) keys{
    return keys;
}

@end

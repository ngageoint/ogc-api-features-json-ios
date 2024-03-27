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

-(int) bboxCount{
    return _bbox != nil ? (int) _bbox.count : 0;
}

-(NSMutableArray<NSDecimalNumber *> *) firstBbox{
    return [self bboxAtIndex:0];
}

-(NSMutableArray<NSDecimalNumber *> *) bboxAtIndex: (int) index{
    return [_bbox objectAtIndex:index];
}

-(void) addBbox: (NSMutableArray<NSDecimalNumber *> *) bbox{
    if(_bbox == nil){
        _bbox = [NSMutableArray array];
    }
    [_bbox addObject:bbox];
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
        for(NSArray<NSNumber *> *boundingBoxItem in boundingBox){
            NSMutableArray<NSDecimalNumber *> *bboxItem = [NSMutableArray array];
            for(NSNumber *number in boundingBoxItem){
                [bboxItem addObject:[[NSDecimalNumber alloc] initWithDouble:[number doubleValue]]];
            }
            [self addBbox:bboxItem];
        }
    }
    self.crs = [tree objectForKey:OAF_CRS];
}

-(NSOrderedSet<NSString *> *) keys{
    return keys;
}

@end

//
//  OAFCollection.m
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFCollection.h"

NSString * const OAF_ID = @"id";
NSString * const OAF_DESCRIPTION = @"description";
NSString * const OAF_EXTENT = @"extent";
NSString * const OAF_ITEM_TYPE = @"itemType";

@implementation OAFCollection

-(instancetype) init{
    self = [super init];
    return self;
}

-(instancetype) initWithId: (NSString *) id{
    self = [super init];
    if(self != nil){
        self.id = id;
    }
    return self;
}

-(instancetype) initWithTree: (NSDictionary *) tree{
    self = [super initWithTree:tree];
    return self;
}

-(void) addLink: (OAFLink *) link{
    [self.links addObject:link];
}

-(void) addCrs: (NSString *) crs{
    [self.crs addObject:crs];
}

-(NSMutableDictionary *) toTree{
    NSMutableDictionary *tree = [super toTree];
    //TODO
    return tree;
}

-(void) fromTree: (NSDictionary *) tree{
    [super fromTree:tree];
    //TODO
}

@end

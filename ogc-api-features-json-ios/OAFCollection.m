//
//  OAFCollection.m
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFCollection.h"
#import "OAFFeatureCollection.h"
#import "OAFFeaturesConverter.h"

NSString * const OAF_ID = @"id";
NSString * const OAF_DESCRIPTION = @"description";
NSString * const OAF_EXTENT = @"extent";
NSString * const OAF_ITEM_TYPE = @"itemType";

static NSOrderedSet *keys = nil;

@implementation OAFCollection

+ (void)initialize {
    if(keys == nil){
        keys = [NSOrderedSet orderedSetWithObjects:OAF_ID, OAF_TITLE, OAF_DESCRIPTION, OAF_LINKS, OAF_EXTENT, OAF_CRS, OAF_ITEM_TYPE, nil];
    }
}

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
    [tree setObject:self.id != nil ? self.id : [NSNull null] forKey:OAF_ID];
    if(self.title != nil){
        [tree setObject:self.title forKey:OAF_TITLE];
    }
    if(self.theDescription != nil){
        [tree setObject:self.theDescription forKey:OAF_DESCRIPTION];
    }
    NSMutableArray *links = [NSMutableArray array];
    for(OAFLink *link in self.links){
        [links addObject:[link toTree]];
    }
    [tree setObject:links forKey:OAF_LINKS];
    if(self.extent != nil){
        [tree setObject:[self.extent toTree] forKey:OAF_EXTENT];
    }
    if(self.crs != nil){
        [tree setObject:self.crs forKey:OAF_CRS];
    }
    if(self.itemType != nil){
        [tree setObject:self.theDescription forKey:OAF_ITEM_TYPE];
    }
    return tree;
}

-(void) fromTree: (NSDictionary *) tree{
    [super fromTree:tree];
    self.id = [tree objectForKey:OAF_ID];
    if([self.id isEqual:[NSNull null]]){
        self.id = nil;
    }
    self.title = [tree objectForKey:OAF_TITLE];
    self.theDescription = [tree objectForKey:OAF_DESCRIPTION];
    NSArray *linksArray = [tree objectForKey:OAF_LINKS];
    if(![linksArray isEqual:[NSNull null]] && linksArray != nil){
        self.links = [NSMutableArray array];
        for(NSDictionary *linkTree in linksArray){
            [self.links addObject:[OAFFeaturesConverter treeToLink:linkTree]];
        }
    }
    NSDictionary *extentTree = [tree objectForKey:OAF_EXTENT];
    OAFExtent *extent = nil;
    if(![extentTree isEqual:[NSNull null]] && extentTree != nil){
        extent = [OAFFeaturesConverter treeToExtent:extentTree];
    }
    [self setExtent:extent];
    NSArray *crs = [tree objectForKey:OAF_CRS];
    if(![crs isEqual:[NSNull null]] && crs != nil){
        self.crs = [NSMutableArray array];
        for(NSString *value in crs){
            [self.crs addObject:[NSMutableString stringWithString:value]];
        }
    }
    self.itemType = [tree objectForKey:OAF_ITEM_TYPE];
}

-(NSOrderedSet<NSString *> *) keys{
    return keys;
}

@end

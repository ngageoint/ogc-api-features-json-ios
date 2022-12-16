//
//  OAFCollections.m
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFCollections.h"
#import "OAFFeaturesConverter.h"

NSString * const OAF_COLLECTIONS = @"collections";

static NSOrderedSet *keys = nil;

@implementation OAFCollections

+ (void)initialize {
    if(keys == nil){
        keys = [NSOrderedSet orderedSetWithObjects:OAF_LINKS, OAF_COLLECTIONS, nil];
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

-(void) addLink: (OAFLink *) link{
    [self.links addObject:link];
}

-(void) addCollection: (OAFCollection *) collection{
    [self.collections addObject:collection];
}

-(NSMutableDictionary *) toTree{
    NSMutableDictionary *tree = [super toTree];
    NSMutableArray *links = [NSMutableArray array];
    for(OAFLink *link in self.links){
        [links addObject:[link toTree]];
    }
    [tree setObject:links forKey:OAF_LINKS];
    NSMutableArray *collections = [NSMutableArray array];
    for(OAFCollection *collection in self.collections){
        [collections addObject:[collection toTree]];
    }
    [tree setObject:collections forKey:OAF_COLLECTIONS];
    return tree;
}

-(void) fromTree: (NSDictionary *) tree{
    [super fromTree:tree];
    self.links = [NSMutableArray array];
    NSArray *linksArray = [tree objectForKey:OAF_LINKS];
    if(![linksArray isEqual:[NSNull null]] && linksArray != nil){
        for(NSDictionary *linkTree in linksArray){
            [self.links addObject:[OAFFeaturesConverter treeToLink:linkTree]];
        }
    }
    self.collections = [NSMutableArray array];
    NSArray *collectionsArray = [tree objectForKey:OAF_COLLECTIONS];
    if(![collectionsArray isEqual:[NSNull null]] && collectionsArray != nil){
        for(NSDictionary *collectionTree in collectionsArray){
            [self.collections addObject:[OAFFeaturesConverter treeToCollection:collectionTree]];
        }
    }
}

-(NSOrderedSet<NSString *> *) keys{
    return keys;
}

@end

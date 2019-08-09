//
//  OAFFeatureCollection.m
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFFeatureCollection.h"
#import "OAFFeaturesConverter.h"
#import "SFGFeatureConverter.h"

NSString * const OAF_LINKS = @"links";
NSString * const OAF_TIME_STAMP = @"timeStamp";
NSString * const OAF_NUMBER_MATCHED = @"numberMatched";
NSString * const OAF_NUMBER_RETURNED = @"numberReturned";
NSString * const OAF_LINK_RELATION_NEXT = @"next";
int const OAF_LIMIT_DEFAULT = 10;

@implementation OAFFeatureCollection

-(instancetype) init{
    return [self initWithFeatureCollection:[[SFGFeatureCollection alloc] init]];
}

-(instancetype) initWithFeatureCollection: (SFGFeatureCollection *) featureCollection{
    self = [super init];
    if(self != nil){
        self.featureCollection = featureCollection;
    }
    return self;
}

-(instancetype) initWithTree: (NSDictionary *) tree{
    self = [super initWithTree:tree];
    return self;
}

-(NSDictionary<NSString *, NSMutableArray<OAFLink *> *> *) relationLinks{
    NSDictionary<NSString *, NSMutableArray<OAFLink *> *> *links = [[NSMutableDictionary alloc] init];
    NSMutableArray<OAFLink *> *allLinks = [self links];
    if(allLinks != nil){
        for (OAFLink *link in allLinks) {
            NSString *relation = [link rel];
            NSMutableArray<OAFLink *> *relationLinks = [links objectForKey:relation];
            if(relationLinks == nil){
                relationLinks = [[NSMutableArray alloc] init];
                [links setValue:relationLinks forKey:relation];
            }
            [relationLinks addObject:link];
        }
    }
    return links;
}

-(NSMutableDictionary *) toTree{
    NSMutableDictionary *tree = [SFGFeatureConverter objectToMutableTree:self.featureCollection];
    if(self.links != nil){
        NSMutableArray *links = [[NSMutableArray alloc] init];
        for(OAFLink *link in self.links){
            [links addObject:[link toTree]];
        }
        [tree setObject:links forKey:OAF_LINKS];
    }
    if(self.timeStamp != nil){
        [tree setObject:self.timeStamp forKey:OAF_TIME_STAMP];
    }
    if(self.numberMatched != nil){
        [tree setObject:self.numberMatched forKey:OAF_NUMBER_MATCHED];
    }
    if(self.numberReturned != nil){
        [tree setObject:self.numberReturned forKey:OAF_NUMBER_RETURNED];
    }
    return tree;
}

-(void) fromTree: (NSDictionary *) tree{
    [super fromTree:tree];
    self.featureCollection = [SFGFeatureConverter treeToFeatureCollection:tree];
    NSArray *linksArray = [tree objectForKey:OAF_LINKS];
    self.links = [[NSMutableArray alloc] init];
    if(![linksArray isEqual:[NSNull null]] && linksArray != nil){
        for(NSDictionary *linkTree in linksArray){
            [self.links addObject:[OAFFeaturesConverter treeToLink:linkTree]];
        }
    }
    self.timeStamp = [tree objectForKey:OAF_TIME_STAMP];
    self.numberMatched = [tree objectForKey:OAF_NUMBER_MATCHED];
    self.numberReturned = [tree objectForKey:OAF_NUMBER_RETURNED];
}

@end

//
//  OAFFeatureCollection.m
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFFeatureCollection.h"
#import "SFGFeatureConverter.h"

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
    return [self initWithFeatureCollection:[SFGFeatureConverter treeToFeatureCollection:tree]];
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

@end

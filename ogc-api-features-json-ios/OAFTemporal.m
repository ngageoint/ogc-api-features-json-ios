//
//  OAFTemporal.m
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFTemporal.h"

NSString * const OAF_INTERVAL = @"interval";
NSString * const OAF_TRS = @"trs";

static NSOrderedSet *keys = nil;

@implementation OAFTemporal

+ (void)initialize {
    if(keys == nil){
        keys = [NSOrderedSet orderedSetWithObjects:OAF_INTERVAL, OAF_TRS, nil];
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
    if(self.interval != nil){
        [tree setObject:self.interval forKey:OAF_INTERVAL];
    }
    if(self.trs != nil){
        [tree setObject:self.trs forKey:OAF_TRS];
    }
    return tree;
}

-(void) fromTree: (NSDictionary *) tree{
    [super fromTree:tree];
    NSArray *interval = [tree objectForKey:OAF_INTERVAL];
    if(![interval isEqual:[NSNull null]] && interval != nil){
        self.interval = [NSMutableArray array];
        for(NSString *value in interval){
            [self.interval addObject:[NSMutableString stringWithString:value]];
        }
    }
    self.trs = [tree objectForKey:OAF_TRS];
}

-(NSOrderedSet<NSString *> *) keys{
    return keys;
}

@end

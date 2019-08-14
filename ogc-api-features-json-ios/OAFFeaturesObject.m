//
//  OAFFeaturesObject.m
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFFeaturesObject.h"
#import "SFGOrderedDictionary.h"

@implementation OAFFeaturesObject

-(instancetype) init{
    self = [super init];
    if(self != nil){
        self.foreignMembers = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(instancetype) initWithTree: (NSDictionary *) tree{
    self = [super init];
    if(self != nil){
        [self fromTree:tree];
    }
    return self;
}

-(NSMutableDictionary *) toTree{
    NSMutableDictionary *tree = [[SFGOrderedDictionary alloc] init];
    if(self.foreignMembers != nil && self.foreignMembers.count > 0){
        [tree addEntriesFromDictionary:self.foreignMembers];
    }
    return tree;
}

-(void) fromTree: (NSDictionary *) tree{
    self.foreignMembers = [[NSMutableDictionary alloc] init];
    NSOrderedSet<NSString *> *keys = [self keys];
    if(keys != nil && keys.count > 0){
        for(NSString *key in [tree allKeys]){
            if(![keys containsObject:key]){
                [self.foreignMembers setObject:[tree objectForKey:key] forKey:key];
            }
        }
    }
}

-(NSOrderedSet<NSString *> *) keys{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

@end

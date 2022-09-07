//
//  OAFLink.m
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFLink.h"

NSString * const OAF_HREF = @"href";
NSString * const OAF_REL = @"rel";
NSString * const OAF_TYPE = @"type";
NSString * const OAF_HREFLANG = @"hreflang";
NSString * const OAF_TITLE = @"title";
NSString * const OAF_LENGTH = @"length";

static NSOrderedSet *keys = nil;

@implementation OAFLink

+ (void)initialize {
    if(keys == nil){
        keys = [NSOrderedSet orderedSetWithObjects:OAF_HREF, OAF_REL, OAF_TYPE, OAF_HREFLANG, OAF_TITLE, OAF_LENGTH, nil];
    }
}

-(instancetype) init{
    self = [super init];
    return self;
}

-(instancetype) initWithHref: (NSString *) href{
    self = [super init];
    if(self != nil){
        self.href = href;
    }
    return self;
}

-(instancetype) initWithTree: (NSDictionary *) tree{
    self = [super initWithTree:tree];
    return self;
}

-(NSMutableDictionary *) toTree{
    NSMutableDictionary *tree = [super toTree];
    if(self.href != nil){
        [tree setObject:self.href forKey:OAF_HREF];
    }
    if(self.rel != nil){
        [tree setObject:self.rel forKey:OAF_REL];
    }
    if(self.type != nil){
        [tree setObject:self.type forKey:OAF_TYPE];
    }
    if(self.hreflang != nil){
        [tree setObject:self.hreflang forKey:OAF_HREFLANG];
    }
    if(self.title != nil){
        [tree setObject:self.title forKey:OAF_TITLE];
    }
    if(self.length != nil){
        [tree setObject:self.length forKey:OAF_LENGTH];
    }
    return tree;
}

-(void) fromTree: (NSDictionary *) tree{
    [super fromTree:tree];
    self.href = [tree objectForKey:OAF_HREF];
    self.rel = [tree objectForKey:OAF_REL];
    self.type = [tree objectForKey:OAF_TYPE];
    self.hreflang = [tree objectForKey:OAF_HREFLANG];
    self.title = [tree objectForKey:OAF_TITLE];
    self.length = [tree objectForKey:OAF_LENGTH];
}

-(NSOrderedSet<NSString *> *) keys{
    return keys;
}

@end

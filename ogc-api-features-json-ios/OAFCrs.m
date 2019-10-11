//
//  OAFCrs.m
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFCrs.h"

NSString *const OAF_CRS_PATTERN = @"http.+/([^/]+)/([^/]+)/([^/]+)$";
int const OAF_CRS_PATTERN_AUTHORITY_GROUP = 1;
int const OAF_CRS_PATTERN_VERSION_GROUP = 2;
int const OAF_CRS_PATTERN_CODE_GROUP = 3;
NSString *const OAF_CRS_BASE_URL = @"http://www.opengis.net/def/crs";

@implementation OAFCrs

static NSRegularExpression *crsExpression = nil;

-(instancetype) init{
    self = [super init];
    return self;
}

-(instancetype) initWithCrs: (NSString *) crs{
    self = [super init];
    if(self != nil){
        [self setCrs:crs];
    }
    return self;
}

-(instancetype) initWithAuthority: (NSString *) authority andVersion: (NSString *) version andCode: (NSString *) code{
    self = [super init];
    if(self != nil){
        self.authority = authority;
        self.version = version;
        self.code = code;
    }
    return self;
}

-(BOOL) setCrs: (NSString *) crs{
    
    BOOL valid = NO;
    
    if(crsExpression == nil){
        NSError  *error = nil;
        crsExpression = [NSRegularExpression regularExpressionWithPattern:OAF_CRS_PATTERN options:0 error:&error];
        if(error){
            [NSException raise:@"CRS Regular Expression" format:@"Failed to create CRS regular expression with error: %@", error];
        }
    }
    
    NSArray * matches = [crsExpression matchesInString:crs options:0 range:NSMakeRange(0, [crs length])];
    if([matches count] > 0){
        NSTextCheckingResult* match = (NSTextCheckingResult*) [matches objectAtIndex:0];
        self.authority = [crs substringWithRange:[match rangeAtIndex:OAF_CRS_PATTERN_AUTHORITY_GROUP]];
        self.version = [crs substringWithRange:[match rangeAtIndex:OAF_CRS_PATTERN_VERSION_GROUP]];
        self.code = [crs substringWithRange:[match rangeAtIndex:OAF_CRS_PATTERN_CODE_GROUP]];
        valid = YES;
    }
    
    return valid;
}

-(BOOL) isValid{
    return self.authority != nil && self.version != nil && self.code != nil;
}

-(NSString *) description{
    return [NSString stringWithFormat:@"%@/%@/%@/%@", OAF_CRS_BASE_URL, _authority, _version, _code];
}

@end

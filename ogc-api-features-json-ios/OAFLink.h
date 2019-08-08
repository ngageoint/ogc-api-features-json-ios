//
//  OAFLink.h
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFFeaturesObject.h"

@interface OAFLink : OAFFeaturesObject

/**
 *  href
 */
@property (nonatomic, strong) NSString *href;

/**
 *  rel
 */
@property (nonatomic, strong) NSString *rel;

/**
 *  type
 */
@property (nonatomic, strong) NSString *type;

/**
 *  hreflang
 */
@property (nonatomic, strong) NSString *hreflang;

/**
 *  title
 */
@property (nonatomic, strong) NSString *title;

/**
 *  length
 */
@property (nonatomic, strong) NSNumber *length;

@end

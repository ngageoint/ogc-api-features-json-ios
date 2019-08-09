//
//  OAFLink.h
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFFeaturesObject.h"

/**
 * href property name
 */
extern NSString * const OAF_HREF;

/**
 * rel property name
 */
extern NSString * const OAF_REL;

/**
 * type property name
 */
extern NSString * const OAF_TYPE;

/**
 * hreflang property name
 */
extern NSString * const OAF_HREFLANG;

/**
 * title property name
 */
extern NSString * const OAF_TITLE;

/**
 * length property name
 */
extern NSString * const OAF_LENGTH;

/**
 * Link
 */
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

/**
 *  Initialize
 *
 *  @return new link
 */
-(instancetype) init;

/**
 *  Initialize
 *
 *  @param href href value
 *
 *  @return new link
 */
-(instancetype) initWithHref: (NSString *) href;

/**
 *  Initialize
 *
 *  @param tree JSON tree
 *
 *  @return new link
 */
-(instancetype) initWithTree: (NSDictionary *) tree;

@end

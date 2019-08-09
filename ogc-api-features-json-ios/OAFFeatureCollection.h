//
//  OAFFeatureCollection.h
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFFeaturesObject.h"
#import "SFGFeatureCollection.h"
#import "OAFLink.h"

/**
 * Links property name
 */
extern NSString * const OAF_LINKS;

/**
 * Time Stamp property name
 */
extern NSString * const OAF_TIME_STAMP;

/**
 * Number Matched property name
 */
extern NSString * const OAF_NUMBER_MATCHED;

/**
 * Number Returned property name
 */
extern NSString * const OAF_NUMBER_RETURNED;

/**
 * Link relation for next
 */
extern NSString * const OAF_LINK_RELATION_NEXT;

/**
 * Limit default
 */
extern int const OAF_LIMIT_DEFAULT;

/**
 * Feature Collection
 */
@interface OAFFeatureCollection : OAFFeaturesObject

/**
 *  Feature collection
 */
@property (nonatomic, strong) SFGFeatureCollection *featureCollection;

/**
 *  Links
 */
@property (nonatomic, strong) NSMutableArray<OAFLink *> *links;

/**
 *  Time Stamp
 */
@property (nonatomic, strong) NSString *timeStamp;

/**
 *  Number Matched
 */
@property (nonatomic, strong) NSNumber *numberMatched;

/**
 *  Number Returned
 */
@property (nonatomic, strong) NSNumber *numberReturned;

/**
 *  Initialize
 *
 *  @return new feature collection
 */
-(instancetype) init;

/**
 *  Initialize
 *
 *  @param featureCollection feature collection
 *
 *  @return new feature collection
 */
-(instancetype) initWithFeatureCollection: (SFGFeatureCollection *) featureCollection;

/**
 *  Initialize
 *
 *  @param tree JSON tree
 *
 *  @return new feature collection
 */
-(instancetype) initWithTree: (NSDictionary *) tree;

/**
 * Get a mapping between link relations and links
 *
 * @return relation links
 */
-(NSDictionary<NSString *, NSMutableArray<OAFLink *> *> *) relationLinks;

@end

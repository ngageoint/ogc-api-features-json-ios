//
//  OAFExtent.h
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFFeaturesObject.h"
#import "OAFSpatial.h"
#import "OAFTemporal.h"

/**
 * spatial property name
 */
extern NSString * const OAF_SPATIAL;

/**
 * temporal property name
 */
extern NSString * const OAF_TEMPORAL;

/**
 * The extent of the features in the collection. In the Core only spatial and
 * temporal extents are specified. Extensions may add additional members to
 * represent other extents, for example, thermal or pressure ranges.
 */
@interface OAFExtent : OAFFeaturesObject

/**
 *  The spatial extent of the features in the collection.
 */
@property (nonatomic, strong) OAFSpatial *spatial;

/**
 *  The temporal extent of the features in the collection.
 */
@property (nonatomic, strong) OAFTemporal *temporal;

/**
 *  Initialize
 *
 *  @return new extent
 */
-(instancetype) init;

/**
 *  Initialize
 *
 *  @param tree JSON tree
 *
 *  @return new extent
 */
-(instancetype) initWithTree: (NSDictionary *) tree;

@end

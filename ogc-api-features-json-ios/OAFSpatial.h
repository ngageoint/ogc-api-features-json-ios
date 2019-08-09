//
//  OAFSpatial.h
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFFeaturesObject.h"

/**
 * bbox property name
 */
extern NSString * const OAF_BBOX;

/**
 * crs property name
 */
extern NSString * const OAF_CRS;

/**
 * The spatial extent of the features in the collection.
 */
@interface OAFSpatial : OAFFeaturesObject

/**
 * West, south, east, north edges of the bounding box. The coordinates are
 * in the coordinate reference system specified in `crs`. By default this is
 * WGS 84 longitude/latitude.
 */
@property (nonatomic, strong) NSMutableArray<NSDecimalNumber *> *bbox;

/**
 * Coordinate reference system of the coordinates in the spatial extent
 * (property `bbox`). The default reference system is WGS 84
 * longitude/latitude. In the Core this is the only supported coordinate
 * reference system. Extensions may support additional coordinate reference
 * systems and add additional enum values.
 */
@property (nonatomic, strong) NSString *crs;

/**
 *  Initialize
 *
 *  @return new spatial
 */
-(instancetype) init;

/**
 *  Initialize
 *
 *  @param tree JSON tree
 *
 *  @return new spatial
 */
-(instancetype) initWithTree: (NSDictionary *) tree;

@end

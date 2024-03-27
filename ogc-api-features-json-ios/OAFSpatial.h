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
 * One or more bounding boxes that describe the spatial extent of the
 * dataset. In the Core only a single bounding box is supported. Extensions
 * may support additional areas. If multiple areas are provided, the union
 * of the bounding boxes describes the spatial extent.
 */
@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSDecimalNumber *>*> *bbox;

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

/**
 * Get the bounding box collection count
 *
 * @return count
 */
-(int) bboxCount;

/**
 * Get the first bounding box
 *
 * @return bounding box
 */
-(NSMutableArray<NSDecimalNumber *> *) firstBbox;

/**
 * Get the bounding box at the index
 *
 * @param index
 *            0 based index
 * @return bounding box
 */
-(NSMutableArray<NSDecimalNumber *> *) bboxAtIndex: (int) index;

/**
 * Add a bounding box
 *
 * @param bbox
 *            single bounding box
 */
-(void) addBbox: (NSMutableArray<NSDecimalNumber *> *) bbox;

@end

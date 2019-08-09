//
//  OAFTemporal.h
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFFeaturesObject.h"

/**
 * interval property name
 */
extern NSString * const OAF_INTERVAL;

/**
 * trs property name
 */
extern NSString * const OAF_TRS;

/**
 * The temporal extent of the features in the collection.
 */
@interface OAFTemporal : OAFFeaturesObject

/**
 * Begin and end times of the time interval. The timestamps are in the
 * coordinate reference system specified in `trs`. By default this is the
 * Gregorian calendar.
 */
@property (nonatomic, strong) NSMutableArray<NSString *> *interval;

/**
 * Coordinate reference system of the coordinates in the temporal extent
 * (property `interval`). The default reference system is the Gregorian
 * calendar. In the Core this is the only supported temporal reference
 * system. Extensions may support additional temporal reference systems and
 * add additional enum values.
 */
@property (nonatomic, strong) NSString *trs;

/**
 *  Initialize
 *
 *  @return new temporal
 */
-(instancetype) init;

/**
 *  Initialize
 *
 *  @param tree JSON tree
 *
 *  @return new temporal
 */
-(instancetype) initWithTree: (NSDictionary *) tree;

@end

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
 * One or more time intervals that describe the temporal extent of the
 * dataset. The value `null` is supported and indicates an unbounded
 * interval end. In the Core only a single time interval is supported.
 * Extensions may support multiple intervals. If multiple intervals are
 * provided, the union of the intervals describes the temporal extent.
 */
@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSString *> *> *interval;

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

/**
 * Get the interval collection count
 *
 * @return count
 */
-(int) intervalCount;

/**
 * Get the first interval
 *
 * @return interval
 */
-(NSMutableArray<NSString *> *) firstInterval;

/**
 * Get the interval at the index
 *
 * @param index
 *            0 based index
 * @return interval
 */
-(NSMutableArray<NSString *> *) intervalAtIndex: (int) index;

/**
 * Add an interval
 *
 * @param interval
 *            single interval
 */
-(void) addInterval: (NSMutableArray<NSString *> *) interval;

@end

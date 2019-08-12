//
//  OAFCollection.h
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFFeaturesObject.h"
#import "OAFLink.h"
#import "OAFExtent.h"

/**
 * id property name
 */
extern NSString * const OAF_ID;

/**
 * description property name
 */
extern NSString * const OAF_DESCRIPTION;

/**
 * extent property name
 */
extern NSString * const OAF_EXTENT;

/**
 * item type property name
 */
extern NSString * const OAF_ITEM_TYPE;

/**
 * Collection
 */
@interface OAFCollection : OAFFeaturesObject

/**
 * Identifier of the collection used
 */
@property (nonatomic, strong) NSString *id;

/**
 * Human readable title of the collection
 */
@property (nonatomic, strong) NSString *title;

/**
 * A description of the features in the collection
 */
@property (nonatomic, strong) NSString *theDescription;

/**
 * Collection of links
 */
@property (nonatomic, strong) NSMutableArray<OAFLink *> *links;

/**
 * Extent
 */
@property (nonatomic, strong) OAFExtent *extent;

/**
 * The list of coordinate reference systems supported by the service; the
 * first item is the default coordinate reference system
 */
@property (nonatomic, strong) NSMutableArray<NSString *> *crs;

/**
 * Indicator about the type of the items in the collection (the default
 * value is 'feature')
 */
@property (nonatomic, strong) NSString *itemType;

/**
 *  Initialize
 *
 *  @return new collection
 */
-(instancetype) init;

/**
 *  Initialize
 *
 *  @param id id
 *
 *  @return new collection
 */
-(instancetype) initWithId: (NSString *) id;

/**
 *  Initialize
 *
 *  @param tree JSON tree
 *
 *  @return new collection
 */
-(instancetype) initWithTree: (NSDictionary *) tree;

/**
 * Add a link
 *
 * @param link
 *            link
 */
-(void) addLink: (OAFLink *) link;

/**
 * Add a crs
 *
 * @param crs
 *            crs
 */
-(void) addCrs: (NSString *) crs;

@end

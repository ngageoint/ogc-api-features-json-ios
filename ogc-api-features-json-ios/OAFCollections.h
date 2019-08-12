//
//  OAFCollections.h
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFFeaturesObject.h"
#import "OAFLink.h"
#import "OAFCollection.h"

/**
 * collections property name
 */
extern NSString * const OAF_COLLECTIONS;

@interface OAFCollections : OAFFeaturesObject

/**
 * Collection of links
 */
@property (nonatomic, strong) NSMutableArray<OAFLink *> *links;

/**
 * Collection of collections
 */
@property (nonatomic, strong) NSMutableArray<OAFCollection *> *collections;

/**
 *  Initialize
 *
 *  @return new collections
 */
-(instancetype) init;

/**
 *  Initialize
 *
 *  @param tree JSON tree
 *
 *  @return new collections
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
 * Add a collection
 *
 * @param collection
 *            collection
 */
-(void) addCollection: (OAFCollection *) collection;

@end

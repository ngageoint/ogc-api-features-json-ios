//
//  OAFFeaturesObject.h
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Features Object
 */
@interface OAFFeaturesObject : NSObject

/**
 *  Foreign members
 */
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSObject *> *foreignMembers;

/**
 *  Initialize
 *
 *  @return new object
 */
-(instancetype) init;

/**
 *  Initialize
 *
 *  @param tree JSON tree
 *
 *  @return new object
 */
-(instancetype) initWithTree: (NSDictionary *) tree;

/**
 * Convert to a JSON tree
 *
 * @return JSON tree
 */
-(NSMutableDictionary *) toTree;

/**
 * Set from a JSON tree
 *
 * @param tree JSON tree
 */
-(void) fromTree: (NSDictionary *) tree;

/**
 * Get the JSON keys
 *
 * @return JSON keys
 */
-(NSOrderedSet<NSString *> *) keys;

@end

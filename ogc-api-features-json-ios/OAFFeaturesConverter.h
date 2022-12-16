//
//  OAFFeaturesConverter.h
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import "OAFCollections.h"
#import "OAFFeatureCollection.h"

/**
 * Features Converter
 */
@interface OAFFeaturesConverter : NSObject

/**
 * Convert the JSON string to a collections
 *
 * @param json
 *            JSON string
 * @return collections
 */
+(OAFCollections *) jsonToCollections: (NSString *) json;

/**
 * Convert the JSON tree to a collections
 *
 * @param tree
 *            tree node
 * @return collections
 */
+(OAFCollections *) treeToCollections: (NSDictionary *) tree;

/**
 * Convert the JSON string to a collection
 *
 * @param json
 *            JSON string
 * @return collection
 */
+(OAFCollection *) jsonToCollection: (NSString *) json;

/**
 * Convert the JSON tree to a collection
 *
 * @param tree
 *            tree node
 * @return collection
 */
+(OAFCollection *) treeToCollection: (NSDictionary *) tree;

/**
 * Convert the JSON string to a feature collection
 *
 * @param json
 *            JSON string
 * @return feature collection
 */
+(OAFFeatureCollection *) jsonToFeatureCollection: (NSString *) json;

/**
 * Convert the JSON tree to a feature collection
 *
 * @param tree
 *            tree node
 * @return feature collection
 */
+(OAFFeatureCollection *) treeToFeatureCollection: (NSDictionary *) tree;

/**
 * Convert a simple geometry to a feature collection
 *
 * @param simpleGeometry
 *            simple geometry
 * @return feature collection
 */
+(OAFFeatureCollection *) simpleGeometryToFeatureCollection: (SFGeometry *) simpleGeometry;

/**
 * Convert simple geometries to a feature collection
 *
 * @param simpleGeometries
 *            simple geometries
 * @return feature collection
 */
+(OAFFeatureCollection *) simpleGeometriesToFeatureCollection: (NSArray<SFGeometry *> *) simpleGeometries;

/**
 * Convert the JSON string to a link
 *
 * @param json
 *            JSON string
 * @return link
 */
+(OAFLink *) jsonToLink: (NSString *) json;

/**
 * Convert the JSON tree to a link
 *
 * @param tree
 *            tree node
 * @return link
 */
+(OAFLink *) treeToLink: (NSDictionary *) tree;

/**
 * Convert the JSON string to a spatial
 *
 * @param json
 *            JSON string
 * @return spatial
 */
+(OAFSpatial *) jsonToSpatial: (NSString *) json;

/**
 * Convert the JSON tree to a spatial
 *
 * @param tree
 *            tree node
 * @return spatial
 */
+(OAFSpatial *) treeToSpatial: (NSDictionary *) tree;

/**
 * Convert the JSON string to a temporal
 *
 * @param json
 *            JSON string
 * @return temporal
 */
+(OAFTemporal *) jsonToTemporal: (NSString *) json;

/**
 * Convert the JSON tree to a temporal
 *
 * @param tree
 *            tree node
 * @return temporal
 */
+(OAFTemporal *) treeToTemporal: (NSDictionary *) tree;

/**
 * Convert the JSON string to an extent
 *
 * @param json
 *            JSON string
 * @return extent
 */
+(OAFExtent *) jsonToExtent: (NSString *) json;

/**
 * Convert the JSON tree to an extent
 *
 * @param tree
 *            tree node
 * @return extent
 */
+(OAFExtent *) treeToExtent: (NSDictionary *) tree;

/**
 * Convert the object to a JSON value
 *
 * @param object
 *            object
 * @return string value
 */
+(NSString *) objectToJSON: (OAFFeaturesObject *) object;

/**
 * Convert the Features object to a mutable tree
 *
 * @param object
 *            Features object
 * @return object map
 */
+(NSMutableDictionary *) objectToMutableTree: (OAFFeaturesObject *) object;

/**
 * Convert the Features object to a tree
 *
 * @param object
 *            Features object
 * @return object map
 */
+(NSDictionary *) objectToTree: (OAFFeaturesObject *) object;

@end

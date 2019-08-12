//
//  OAFCrs.h
//  ogc-api-features-json-ios
//
//  Created by Brian Osborn on 8/7/19.
//  Copyright © 2019 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * CRS pattern
 */
extern NSString *const OAF_CRS_PATTERN;

/**
 * CRS pattern authority group
 */
extern int const OAF_CRS_PATTERN_AUTHORITY_GROUP;

/**
 * CRS pattern code group
 */
extern int const OAF_CRS_PATTERN_VERSION_GROUP;

/**
 * CRS pattern code group
 */
extern int const OAF_CRS_PATTERN_CODE_GROUP;

/**
 * Base CRS URL
 */
extern NSString *const OAF_CRS_BASE_URL;

/**
 * Coordinate Reference System
 *
 * http://www.opengis.net/def/crs/{authority}/{version}/{code}
 */
@interface OAFCrs : NSObject

/**
 *  CRS Authority
 */
@property (nonatomic, strong) NSString *authority;

/**
 *  CRS Version
 */
@property (nonatomic, strong) NSString *version;

/**
 *  CRS Code
 */
@property (nonatomic, strong) NSString *code;

/**
 *  Initialize
 *
 *  @return new crs
 */
-(instancetype) init;

/**
 *  Initialize
 *
 *  @param crs CRS URL
 *
 *  @return new crs
 */
-(instancetype) initWithCrs: (NSString *) crs;

/**
 *  Initialize
 *
 *  @param authority
 *            authority
 *  @param version
 *            version
 *  @param code
 *            code
 *
 *  @return new crs
 */
-(instancetype) initWithAuthority: (NSString *) authority andVersion: (NSString *) version andCode: (NSString *) code;

/**
 * Set the CRS
 *
 * @param crs
 *            CRS URL
 * @return true if a valid CRS and values were set
 */
-(BOOL) setCrs: (NSString *) crs;

/**
 * Determine if all parts of the CRS are set
 *
 * @return true if valid
 */
-(BOOL) isValid;

@end

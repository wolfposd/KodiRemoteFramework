//
//  KodiRemoteBasics.h
//  KodiRemoteFramework
//
//  Created by wolf on 08.10.15.
//  Copyright © 2015 WP. All rights reserved.
//

#import <Foundation/Foundation.h>




#define JSONDICTBASIC @{ @"jsonrpc":@"2.0", @"id":@1}

@interface KodiRemoteBasics : NSObject

+(NSString*) dictToJSONString_escaped:(NSDictionary*) dict;

+(NSMutableDictionary*) makeDictionaryForMethod:(NSString*) method;


/**
 *  Creates a Dictionary from input data
 *
 *  @param input input data
 *
 *  @return dict
 */
+(NSDictionary*) JSONtoDictFromData:(NSData*) input;
+(NSDictionary*) JSONtoDictFromString:(NSString*) input;

/**
 *  Creates an Array from input data
 *
 *  @param input input data
 *
 *  @return array
 */
+(NSArray*) JSONtoArrayFromData:(NSData*) input;
+(NSArray*) JSONtoArrayFromString:(NSString*) input;

@end

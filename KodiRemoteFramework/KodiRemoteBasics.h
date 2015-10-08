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

@end

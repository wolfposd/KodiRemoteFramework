//
//  KodiRemoteBasics.m
//  KodiRemoteFramework
//
//  Created by wolf on 08.10.15.
//  Copyright © 2015 WP. All rights reserved.
//

#import "KodiRemoteBasics.h"

@implementation KodiRemoteBasics




+(NSString*) dictToJSONString_escaped:(NSDictionary*) dict
{
    NSError* error = nil;
    NSData* jsondata = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:&error];
    NSString* json = [[NSString alloc] initWithData:jsondata encoding:NSUTF8StringEncoding];
    
    return [json stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet alphanumericCharacterSet]];
    //return [json stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}


+(NSMutableDictionary*) makeDictionaryForMethod:(NSString*) method
{
    NSMutableDictionary* dict = [JSONDICTBASIC mutableCopy];
    dict[@"method"] = method;
    return dict;
}


+(NSDictionary*) JSONtoDictFromData:(NSData*) input
{
    NSError* error = nil;
    NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:input options:kNilOptions error:&error];
    
    if(!dict)
        // do stuff with error?
        return nil;
    else
        return dict;
}

+(NSDictionary*) JSONtoDictFromString:(NSString*) input
{
    return [self JSONtoDictFromData:[input dataUsingEncoding:NSUTF8StringEncoding]];
}


+(NSArray*) JSONtoArrayFromData:(NSData*) input
{
    NSError* error = nil;
    NSArray* array = [NSJSONSerialization JSONObjectWithData:input options:kNilOptions error:&error];
    
    if(!array)
        // do stuff with error?
        return nil;
    else
        return array;
}

+(NSArray*) JSONtoArrayFromString:(NSString*) input
{
    return [self JSONtoArrayFromData:[input dataUsingEncoding:NSUTF8StringEncoding]];
}

@end

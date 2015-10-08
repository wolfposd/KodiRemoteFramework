//
//  KodiRemoteInput.m
//  KodiRemoteFramework
//
//  Created by wolf on 08.10.15.
//  Copyright © 2015 WP. All rights reserved.
//

#import "KodiRemoteInput.h"
#import "KodiRemoteBasics.h"



@implementation KodiRemoteInput

#pragma mark - No input required

+(NSString *)inputSendText:(NSString *)text done:(BOOL)done
{
    NSMutableDictionary* dict = [JSONDICTBASIC mutableCopy];
    dict[@"params"] = @{@"text":text, @"done":[NSNumber numberWithBool:done]};
    dict[@"method"] = @"Player.PlayPause";
    return [KodiRemoteBasics dictToJSONString_escaped:dict];
}

+(NSString *)inputExecuteAction:(NSString *)inputAction
{
    NSMutableDictionary* dict = [JSONDICTBASIC mutableCopy];
    dict[@"params"] = @{@"Input.Action":inputAction};
    dict[@"method"] = @"Player.PlayPause";
    return [KodiRemoteBasics dictToJSONString_escaped:dict];
}

+(NSString *)inputInfo
{
    return [self reqForMethod:@"Input.Info"];
}

+(NSString *)inputHome
{
    return [self reqForMethod:@"Input.Home"];
}

+(NSString *)inputShowCodec
{
    return [self reqForMethod:@"Input.ShowCodec"];
}

+(NSString *)inputContextMenu
{
    return [self reqForMethod:@"Input.ContextMenu"];
}

+(NSString*) inputRight
{
    return [self reqForMethod:@"Input.Right"];
}

+(NSString *)inputShowOSD
{
    return [self reqForMethod:@"Input.ShowOSD"];
}

+(NSString *) inputLeft
{
    return [self reqForMethod:@"Input.Left"];
}

+(NSString *) inputUp
{
    return [self reqForMethod:@"Input.Up"];
}

+(NSString *) inputDown
{
    return [self reqForMethod:@"Input.Down"];
}


+(NSString *) inputSelect
{
    return [self reqForMethod:@"Input.Select"];
}


+(NSString *) inputBack
{
    return [self reqForMethod:@"Input.Back"];
}


#pragma mark - easy output

+(NSString*) reqForMethod:(NSString*) input
{
    return [KodiRemoteBasics dictToJSONString_escaped:[KodiRemoteBasics makeDictionaryForMethod:input]];
}



@end

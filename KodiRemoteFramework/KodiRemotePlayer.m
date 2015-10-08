//
//  KodiRemotePlayer.m
//  KodiRemoteFramework
//
//  Created by wolf on 08.10.15.
//  Copyright © 2015 WP. All rights reserved.
//

#import "KodiRemotePlayer.h"
#import "KodiRemoteBasics.h"

@implementation KodiRemotePlayer

+(NSString *)playerGetActivePlayers
{
    return [KodiRemoteBasics dictToJSONString_escaped:[KodiRemoteBasics makeDictionaryForMethod:@"Player.GetActivePlayers"]];
}


+(NSString *) playerPlayPause:(NSInteger) playerid
{
    NSMutableDictionary* dict = [JSONDICTBASIC mutableCopy];
    dict[@"params"] = @{@"playerid":[NSNumber numberWithInteger:playerid]};
    dict[@"method"] = @"Player.PlayPause";
    return [KodiRemoteBasics dictToJSONString_escaped:dict];
}


+(NSString *)playerStop:(NSInteger) playerid
{
    NSMutableDictionary* dict = [JSONDICTBASIC mutableCopy];
    dict[@"params"] = @{@"playerid":[NSNumber numberWithInteger:playerid]};
    dict[@"method"] = @"Player.Stop";
    return [KodiRemoteBasics dictToJSONString_escaped:dict];
}




+(NSString *) playerSeek:(NSInteger) playerid percentage:(NSInteger) percentage
{
    NSMutableDictionary* dict = [JSONDICTBASIC mutableCopy];
    dict[@"params"] = @{
                        @"playerid":[NSNumber numberWithInteger:playerid],
                        @"value":[NSNumber numberWithInteger:percentage]
                        };
    dict[@"method"] = @"Player.Seek";
    return [KodiRemoteBasics dictToJSONString_escaped:dict];
}

+(NSString *) playerSeek:(NSInteger) playerid time:(NSDictionary *)hourMinutesSecondsMilliseconds
{
    NSMutableDictionary* dict = [JSONDICTBASIC mutableCopy];
    dict[@"params"] = @{
                        @"playerid":[NSNumber numberWithInteger:playerid],
                        @"value":hourMinutesSecondsMilliseconds
                        };
    dict[@"method"] = @"Player.Seek";
    return [KodiRemoteBasics dictToJSONString_escaped:dict];
}

+(NSString *) playerSeek:(NSInteger) playerid predefinedJump:(NSString *)predefinedJump
{
    NSMutableDictionary* dict = [JSONDICTBASIC mutableCopy];
    dict[@"params"] = @{
                        @"playerid":[NSNumber numberWithInteger:playerid],
                        @"value":predefinedJump
                        };
    dict[@"method"] = @"Player.Seek";
    return [KodiRemoteBasics dictToJSONString_escaped:dict];
}
@end

//
//  KodiRemotePlayer.h
//  KodiRemoteFramework
//
//  Created by wolf on 08.10.15.
//  Copyright © 2015 WP. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Player Commands. Some return responses.
 */
@interface KodiRemotePlayer : NSObject

/**
 *  Returns all active players
 *
 *  http://kodi.wiki/view/JSON-RPC_API/v6#Player.GetActivePlayers
 *
 *  @return Kodi-Return-Type:array
 */
+(NSString *) playerGetActivePlayers;

+(NSString *) playerPlayPause:(NSInteger) playerid;

+(NSString *) playerStop:(NSInteger) playerid;


/**
 *  Seek to a position
 *
 *  http://kodi.wiki/view/JSON-RPC_API/v6#Player.Seek
 *
 *  @param playerid   player id
 *  @param percentage the percentage value between 0 and 100
 *
 *  @return Kodi-Return-Type:object
 */
+(NSString *) playerSeek:(NSInteger) playerid percentage:(NSInteger) percentage;
/**
 *  Seek to a position
 *
 *  http://kodi.wiki/view/JSON-RPC_API/v6#Player.Seek
 *
 *  @param playerid                       player id
 *  @param hourMinutesSecondsMilliseconds Dictionary containt values for "hours", "minutes", "seconds" and "milliseconds"
 *
 *  @return Kodi-Return-Type:object
 */
+(NSString *) playerSeek:(NSInteger) playerid time:(NSDictionary*) hourMinutesSecondsMilliseconds;
/**
 *  Seek to a position
 *
 *  http://kodi.wiki/view/JSON-RPC_API/v6#Player.Seek
 *
 *  @param playerid       player id
 *  @param predefinedJump jumps are: smallforward, smallbackward, bigforward, bigbackward
 *
 *  @return Kodi-Return-Type:object
 */
+(NSString *) playerSeek:(NSInteger) playerid predefinedJump:(NSString*) predefinedJump;

@end

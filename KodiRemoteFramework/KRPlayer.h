//
//  KRPlayer.h
//  KodiRemoteFramework
//
//  Created by wolf on 12.10.15.
//  Copyright © 2015 WP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KodiRemoteAPI.h"



typedef void (^TimeResultBlock)(NSInteger percentage, NSInteger time, NSInteger totalTime);

@interface KRPlayer : NSObject

-(instancetype) initWithRemote:(KodiRemoteAPI**) remoteAPI;



-(void) playerGetActivePlayersOnCompletion:(void(^)(NSArray* activePlayers)) completion;

-(void) playerSeek:(NSInteger) playerid percentage:(NSInteger) percentage onCompletion:(TimeResultBlock) completion;

@end

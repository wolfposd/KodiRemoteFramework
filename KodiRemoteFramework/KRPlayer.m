//
//  KRPlayer.m
//  KodiRemoteFramework
//
//  Created by wolf on 12.10.15.
//  Copyright © 2015 WP. All rights reserved.
//

#import "KRPlayer.h"
#import "KodiRemotePlayer.h"
#import "KodiRemoteBasics.h"

@interface KRPlayer ()

@property (nonatomic) KodiRemoteAPI* api;

@end


@implementation KRPlayer


-(instancetype)initWithRemote:(KodiRemoteAPI *__autoreleasing *)remoteAPI
{
    self = [super init];
    if(self)
    {
        _api = *remoteAPI;
    }
    return self;
}


-(void) playerGetActivePlayersOnCompletion:(void(^)(NSArray* activePlayers)) completion
{
    NSString* apicall = [KodiRemotePlayer playerGetActivePlayers];
    [self.api sendRequest:apicall result:^(NSData* resultOrNil)
    {
        if(resultOrNil)
        {
            NSArray* actPla = [KodiRemoteBasics JSONtoArrayFromData:resultOrNil];
            if(actPla)
                completion(actPla);
            else
                completion(@[]);
        }
        else
        {
            completion(@[]);
        }
    }];
}


-(void) playerSeek:(NSInteger) playerid percentage:(NSInteger) percentage onCompletion:(TimeResultBlock) completion
{
    
    NSString* apicall = [KodiRemotePlayer playerSeek:playerid percentage:percentage];
    
    [self.api sendRequest:apicall result:^(NSData* resultDataOrNil)
    {
        if(resultDataOrNil)
        {
            NSDictionary* dict = [KodiRemoteBasics JSONtoDictFromData:resultDataOrNil];
            
            if(dict)
                completion( [dict[@"properties.percentage"]integerValue], [dict[@"properties.time"] integerValue], [dict[@"properties.totaltime"] integerValue] );
            else
                completion(-1,-1,-1);
        }
        else
        {
            completion(-1,-1,-1);
        }
    }];
    
}




@end

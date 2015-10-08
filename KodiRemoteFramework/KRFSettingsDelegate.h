//
//  KRFSettingsDelegate.h
//  KodiRemoteFramework
//
//  Created by wolf on 08.10.15.
//  Copyright © 2015 WP. All rights reserved.
//



@protocol KRFSettingsDelegate <NSObject>


-(NSString*) hostAddress;
-(NSString*) portNumber;

-(NSString*) username;
-(NSString*) password;

@end
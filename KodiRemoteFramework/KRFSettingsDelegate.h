//
//  KRFSettingsDelegate.h
//  KodiRemoteFramework
//
//  Created by wolf on 08.10.15.
//  Copyright © 2015 WP. All rights reserved.
//


/**
 *  Delegate enabling access to Kodi Auth Settings
 */
@protocol KRFSettingsDelegate <NSObject>

/**
 *  Host address of Kodi instance
 *
 *  @return in the form of an IP address, e.g. \@"192.168.0.1"
 */
-(NSString*) hostAddress;

/**
 *  Portnumber of webinterface
 *
 *  @return as string, e.g. \@"8080"
 */
-(NSString*) portNumber;

/**
 *  Kodi remote username
 *
 *  @return as String
 */
-(NSString*) username;

/**
 *  Kodi remote password
 *
 *  @return as String
 */
-(NSString*) password;

@end
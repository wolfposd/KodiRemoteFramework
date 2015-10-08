//
//  KodiRemoteInput.h
//  KodiRemoteFramework
//
//  Created by wolf on 08.10.15.
//  Copyright © 2015 WP. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Contains all "INPUT" Commands. They usually dont supply responses, except for status-messages
 */
@interface KodiRemoteInput : NSObject

+(NSString*) inputBack;

+(NSString*) inputContextMenu;

+(NSString*) inputDown;

+(NSString*) inputExecuteAction:(NSString*) inputAction;

+(NSString*) inputHome;

+(NSString*) inputInfo;

+(NSString*) inputLeft;

+(NSString*) inputRight;

+(NSString*) inputSelect;

+(NSString*) inputSendText:(NSString*) text done:(BOOL) done;

+(NSString*) inputShowCodec;

+(NSString*) inputShowOSD;

+(NSString*) inputUp;

@end

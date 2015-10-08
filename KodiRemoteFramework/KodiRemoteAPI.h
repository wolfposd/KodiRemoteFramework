//
//  KodiRemoteAPI.h
//  KodiRemoteFramework
//
//  Created by wolf on 08.10.15.
//  Copyright © 2015 WP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KRFSettingsDelegate.h"

@interface KodiRemoteAPI : NSObject


/**
 *  initiate the Remote with a settingsdelegate
 *
 *  @param delegate settings for use with this Kodi-Instance
 *
 *  @return initialized remote
 */
-(instancetype) initWithDelegate:(id<KRFSettingsDelegate>) delegate;


/**
 *  Sends a request to Kodi not demanding a result
 *
 *  @param request request to send
 */
-(void) sendRequest:(NSURLRequest*) request;


/**
 *  Sends a request to Kodi returning the result
 *
 *  @param request       request to send
 *  @param resulthandler the expected result data or nil
 */
-(void) sendRequest:(NSURLRequest *)request result:(void (^)(NSData* resultDataOrNil)) resulthandler;


-(NSURLRequest*) requestForPlayButton;

-(NSURLRequest*) requestForRightButton;

-(NSURLRequest*) requestForLeftButton;

-(NSURLRequest*) requestForUpButton;

-(NSURLRequest*) requestForDownButton;

-(NSURLRequest*) requestForStopButton;

-(NSURLRequest*) requestForSelectButton;

-(NSURLRequest*) requestForBackButton;

@end

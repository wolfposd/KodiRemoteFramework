//
//  KodiRemoteAPI.m
//  KodiRemoteFramework
//
//  Created by wolf on 08.10.15.
//  Copyright © 2015 WP. All rights reserved.
//

#import "KodiRemoteAPI.h"


@interface KodiRemoteAPI ()

@property (nonatomic, retain) id<KRFSettingsDelegate> delegate;

@end

@implementation KodiRemoteAPI


-(instancetype)initWithDelegate:(id<KRFSettingsDelegate>)delegate
{
    self = [super init];
    if(self)
    {
        _delegate = delegate;
    }
    return self;
}


#define JSONDICTBASIC @{ @"jsonrpc":@"2.0", @"id":@1}

-(void) sendRequest:(NSURLRequest*) request
{
    [self sendRequest:request result:^(NSData* data){ /* no result interest */ }];
}

-(void) sendRequest:(NSURLRequest *)request result:(void (^)(NSData* resultDataOrNil)) resulthandler
{
    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:
     ^(NSURLResponse* resp, NSData* data, NSError* err)
     {
         resulthandler(data);
     }];
}

-(NSURLRequest*) requestForPlayButton
{
    NSMutableDictionary* dict = [JSONDICTBASIC mutableCopy];
    dict[@"params"] = @{@"playerid":@0};
    dict[@"method"] = @"Player.PlayPause";
    return [self getBasicRequest:[KodiRemoteAPI dictToJSONString_escaped:dict]];
}

-(NSURLRequest *)requestForStopButton
{
    NSMutableDictionary* dict = [JSONDICTBASIC mutableCopy];
    dict[@"params"] = @{@"playerid":@0};
    dict[@"method"] = @"Player.Stop";
    return [self getBasicRequest:[KodiRemoteAPI dictToJSONString_escaped:dict]];
}


-(NSURLRequest*) requestForRightButton
{
    NSString* json = [KodiRemoteAPI dictToJSONString_escaped:[KodiRemoteAPI makeDictionaryForMethod:@"Input.Right"]];
    NSURLRequest* req = [self getBasicRequest:json];
    return req;
}


-(NSURLRequest *)requestForLeftButton
{
    NSString* json = [KodiRemoteAPI dictToJSONString_escaped:[KodiRemoteAPI makeDictionaryForMethod:@"Input.Left"]];
    NSURLRequest* req = [self getBasicRequest:json];
    return req;
}

-(NSURLRequest *)requestForUpButton
{
    NSString* json = [KodiRemoteAPI dictToJSONString_escaped:[KodiRemoteAPI makeDictionaryForMethod:@"Input.Up"]];
    NSURLRequest* req = [self getBasicRequest:json];
    return req;
}

-(NSURLRequest *)requestForDownButton
{
    NSString* json = [KodiRemoteAPI dictToJSONString_escaped:[KodiRemoteAPI makeDictionaryForMethod:@"Input.Down"]];
    NSURLRequest* req = [self getBasicRequest:json];
    return req;
}



-(NSURLRequest *) requestForSelectButton
{
    NSString* json = [KodiRemoteAPI dictToJSONString_escaped:[KodiRemoteAPI makeDictionaryForMethod:@"Input.Select"]];
    NSURLRequest* req = [self getBasicRequest:json];
    return req;
}


-(NSURLRequest *) requestForBackButton
{
    NSString* json = [KodiRemoteAPI dictToJSONString_escaped:[KodiRemoteAPI makeDictionaryForMethod:@"Input.Back"]];
    NSURLRequest* req = [self getBasicRequest:json];
    return req;
}




#pragma mark - Private Methods

+(NSString*) dictToJSONString_escaped:(NSDictionary*) dict
{
    NSError* error = nil;
    NSData* jsondata = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:&error];
    NSString* json = [[NSString alloc] initWithData:jsondata encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", json);
    
    return [json stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}


+(NSMutableDictionary*) makeDictionaryForMethod:(NSString*) method
{
    NSMutableDictionary* dict = [JSONDICTBASIC mutableCopy];
    dict[@"method"] = method;
    return dict;
}


-(NSMutableURLRequest*) getBasicRequest:(NSString*) jsonrequest
{
    NSString* address = [self.delegate hostAddress];
    NSString* port = [self.delegate portNumber];
    
    NSString* basicUrl = [NSString stringWithFormat:@"http://%@:%@/jsonrpc?request=%@", address, port, jsonrequest];
    NSURL* url =[NSURL URLWithString:basicUrl];
    

    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:url];
    

    // Make Auth
    NSString* username = [self.delegate username];
    NSString* password = [self.delegate password];
    NSString *authStr = [NSString stringWithFormat:@"%@:%@", username, password];
    NSData *authData = [authStr dataUsingEncoding:NSUTF8StringEncoding];
    NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64EncodedStringWithOptions:kNilOptions]];
    [request setValue:authValue forHTTPHeaderField:@"Authorization"];
    
  
    return request;
}




@end

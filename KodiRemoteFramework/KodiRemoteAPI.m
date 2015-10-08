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


-(void) sendRequest:(NSString*) jsonrpc
{
    [self sendRequest:jsonrpc result:^(NSData* data){ /* no result interest */ }];
}

-(void) sendRequest:(NSString *) jsonrpc result:(void (^)(NSData* resultDataOrNil)) resulthandler
{
    NSURLRequest* request = [self getBasicRequest:jsonrpc];
    
    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:
     ^(NSURLResponse* resp, NSData* data, NSError* err)
     {
         resulthandler(data);
     }];
}


#pragma mark - Private Methods

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

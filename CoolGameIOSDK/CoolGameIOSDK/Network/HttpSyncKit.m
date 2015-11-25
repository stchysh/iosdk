//
//  HttpSyncKit.m
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/23.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import "HttpSyncKit.h"

@implementation HttpSyncKit

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tryCount = 3;
    }
    return self;
}
-(void) get:(NSString *)urlPath completionHandler:(void (^)(NSString*))handler {
    [self get:urlPath completionHandler:handler setTimeout:10 setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
}

-(void)get:(NSString*)urlPath completionHandler:(void (^)(NSString*))handler setTimeout:(NSTimeInterval)timeout {
    [self get:urlPath completionHandler:handler setTimeout:timeout setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
}
-(void)get:(NSString*)urlPath completionHandler:(void (^)(NSString*))handler setTimeout:(NSTimeInterval)timeout setCachePolicy:(NSInteger)cachePolicy {

    //第一步，创建URL
    NSURL *url = [NSURL URLWithString:urlPath];
    
    //第二步，通过URL创建网络请求
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:cachePolicy timeoutInterval:timeout];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        NSInteger statusCode = [httpResponse statusCode];
        if(error || statusCode != 200) {
            if(self.tryCount > 0) {
                self.tryCount--;
                [self get:urlPath completionHandler:handler setTimeout:timeout setCachePolicy:cachePolicy];
            }
            else {
                if(handler) {
                    handler(@"");
                }
            }
        }
        else {
            NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            if(handler) {
                handler(str);
            }
        }
    }];
    [task resume];
    
}


@end

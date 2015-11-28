//
//  HttpKit.m
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/28.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import "HttpKit.h"

@implementation HttpKit

-(void)setTryCounts:(int)tryCount {
    self.tryCount = tryCount;
}

-(void)get:(NSString*)urlPath {
    [self http:urlPath completionHandler:nil setHttpMethod:HTTPKIT_GET setParams:@{}];
}
-(void)get:(NSString*)urlPath setParams:(NSDictionary*)params {
    [self http:urlPath completionHandler:nil setHttpMethod:HTTPKIT_GET setParams:params];
}
-(void)get:(NSString*)urlPath completionHandler:(void (^)(NSString*))handler {
    [self http:urlPath completionHandler:handler setHttpMethod:HTTPKIT_GET setParams:@{}];
}
-(void)get:(NSString*)urlPath completionHandler:(void (^)(NSString*))handler setParams:(NSDictionary*)params {
    [self http:urlPath completionHandler:handler setHttpMethod:HTTPKIT_GET setParams:params];
}

-(void)post:(NSString*)urlPath {
    [self http:urlPath completionHandler:nil setHttpMethod:HTTPKIT_POST setParams:@{}];
}
-(void)post:(NSString*)urlPath setParams:(NSDictionary*)params {
    [self http:urlPath completionHandler:nil setHttpMethod:HTTPKIT_POST setParams:params];
}
-(void)post:(NSString*)urlPath completionHandler:(void (^)(NSString*))handler {
    [self http:urlPath completionHandler:handler setHttpMethod:HTTPKIT_POST setParams:@{}];
}
-(void)post:(NSString*)urlPath completionHandler:(void (^)(NSString*))handler setParams:(NSDictionary*)params {
    [self http:urlPath completionHandler:handler setHttpMethod:HTTPKIT_POST setParams:params];
}

-(void)http:(NSString*)urlPath completionHandler:(void (^)(NSString*))handler setHttpMethod:(NSString*)httpMethod setParams:(NSDictionary*)params {
    
    //第一步，创建URL
    NSURL *url = [NSURL URLWithString:urlPath];
    
    //第二步，通过URL创建网络请求
    // NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:cachePolicy timeoutInterval:timeout];
    NSInteger cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    NSString * cp_str = [params objectForKey:HTTPKIT_CACHEPOLICY];
    if(nil != cp_str) {
        cachePolicy = [cp_str integerValue];
    }
    
    NSTimeInterval timeout = 10;
    NSString * to_str = [params objectForKey:HTTPKIT_TIMEOUT];
    if(nil != to_str) {
        timeout = [to_str integerValue];
    }
    
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url cachePolicy:cachePolicy timeoutInterval:timeout];
    [request setHTTPMethod:httpMethod];
    
    if( [httpMethod isEqualToString:HTTPKIT_POST] ) {
        [request setHTTPBody:[params objectForKey:HTTPKIT_DATA]];
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    self._task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        NSInteger statusCode = [httpResponse statusCode];
        if(error || statusCode != 200) {
            if(self.tryCount > 0) {
                self.tryCount--;
                [self http:urlPath completionHandler:handler setHttpMethod:httpMethod setParams:params];
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
    [self._task resume];
}


@end

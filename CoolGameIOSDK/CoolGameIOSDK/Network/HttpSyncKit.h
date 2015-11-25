//
//  HttpSyncKit.h
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/23.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpSyncKit : NSObject

@property int tryCount;

//NSURLRequest初始化方法第一个参数：请求访问路径，第二个参数：缓存协议，第三个参数：网络请求超时时间（秒）
//    其中缓存协议是个枚举类型包含：
//    NSURLRequestUseProtocolCachePolicy（基础策略）
//    NSURLRequestReloadIgnoringLocalCacheData（忽略本地缓存）
//    NSURLRequestReturnCacheDataElseLoad（首先使用缓存，如果没有本地缓存，才从原地址下载）
//    NSURLRequestReturnCacheDataDontLoad（使用本地缓存，从不下载，如果本地没有缓存，则请求失败，此策略多用于离线操作）
//    NSURLRequestReloadIgnoringLocalAndRemoteCacheData（无视任何缓存策略，无论是本地的还是远程的，总是从原地址重新下载）
//    NSURLRequestReloadRevalidatingCacheData（如果本地缓存是有效的则不下载，其他任何情况都从原地址重新下载）
//第三步，连接服务器
//    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];

-(void)get:(NSString*)urlPath completionHandler:(void (^)(NSString*))handler;
-(void)get:(NSString*)urlPath completionHandler:(void (^)(NSString*))handler setTimeout:(NSTimeInterval)timeout;
-(void)get:(NSString*)urlPath completionHandler:(void (^)(NSString*))handler setTimeout:(NSTimeInterval)timeout setCachePolicy:(NSInteger)cachePolicy;


@end

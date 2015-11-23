//
//  CoolGame.h
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/22.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoolGameIOSDK/CoolGameDelegate.h>

@interface CoolGame : NSObject

#pragma init

+(void) init:(id<CoolGameDelegate>)delegate setAppId:(NSString*) appId setAppKey:(NSString*) appKey;
+(void) setConfig:(BOOL)debug setIsShowLog:(BOOL)isShowLog;
+(void) setViewContainer:(UIView *)container;
+(void) setViewController:(UIViewController *)viewController;

#pragma login
//start login in gamecenter
+(void) login;
//+(void) logout;
//+(void) userCenter;

@end

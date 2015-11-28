//
//  Kits.h
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/22.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#ifndef Kits_h
#define Kits_h

#import <UIKit/UIKit.h>
#import <Core/CoreKit.h>
#import <Log/LogKit.h>
#import <Login/LoginKit.h>
#import <Utils/UtilsKit.h>
#import <Network/NetworkKit.h>

@class CoolGameConfig, CoolGameAlertKit, HttpSyncKit;

@interface Kits : NSObject

+(CoolGameConfig*) config;
+(CoolGameAlertKit*) alert;


+(void)assert:(BOOL)val message:(NSString*)msg;
+(void)get:(NSString*)urlPath completionHandler:(void (^)(NSString*))handler;
+(void)post:(NSString*)urlPath sendData:(NSData*)data completionHandler:(void (^)(NSString*))handler;
+(void)setUIViewController:(UIViewController*)viewController;

+(void)showLoading:(NSString*)text;
+(void)showLoading;
+(void)hideLoading;

@end

#endif /* Kits_h */

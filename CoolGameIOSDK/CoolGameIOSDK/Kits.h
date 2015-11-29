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
#import <Utils/UtilsKit.h>
#import <Network/NetworkKit.h>
#import <Sdks/SdksKit.h>

@class CoolGameConfig, CoolGameAlertKit, HttpSyncKit, BaseSdk;

@interface Kits : NSObject

+(CoolGameConfig*) config;
+(CoolGameAlertKit*) alert;
+(UIViewController*) viewController;

//@property id<CoolGameDelegate> _delegate;
+(id<CoolGameDelegate>) delegate;
+(void)setDelegate:(id<CoolGameDelegate>)delegate;

#pragma sdk
+(BaseSdk*) sdk;
+(void) setSDK:(BaseSdk*)sdk;

+(void)assert:(BOOL)val message:(NSString*)msg;
+(void)get:(NSString*)urlPath completionHandler:(void (^)(NSString*))handler;
+(void)post:(NSString*)urlPath sendData:(NSData*)data completionHandler:(void (^)(NSString*))handler;
+(void)setUIViewController:(UIViewController*)viewController;

+(void)showLoading:(NSString*)text;
+(void)showLoading;
+(void)hideLoading;

@end

#endif /* Kits_h */

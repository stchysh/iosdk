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
+(void)getSync:(NSString*)urlPath completionHandler:(void (^)(NSString*))handler;

@end

#endif /* Kits_h */

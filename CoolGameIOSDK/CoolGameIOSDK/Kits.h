//
//  Kits.h
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/22.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#ifndef Kits_h
#define Kits_h

#import <Core/CoreKit.h>
#import <Log/LogKit.h>
#import <Login/LoginKit.h>

@class CoolGameConfig;

@interface Kits : NSObject

+(CoolGameConfig*) config;


+(void)assert:(BOOL)val message:(NSString*)msg;

@end

#endif /* Kits_h */

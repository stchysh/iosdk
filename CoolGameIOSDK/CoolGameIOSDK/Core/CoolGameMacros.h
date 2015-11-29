//
//  CoolGameMacros.h
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/22.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#ifndef CoolGameMacros_h
#define CoolGameMacros_h


#pragma sdk macros

#define SDK_NAME @"CoolGame IOS SDK"
#define SDK_AUCHOR @"yanschen"
#define SDK_VERSION @"1.0.0"

#pragma log macros
#define LOG_DEFAULT_TAG @"CoolGame"
#define LOG_INIT_TAG @"CoolGameInit"
#define LOG_CONFIG_TAG @"CoolGameConfig"
#define LOG_LOGIN_TAG @"CoolGameLogin"
#define LOG_GAMECENTER_TAG @"CoolGameCenter"

#pragma network
#define HTTPKIT_GET @"GET"
#define HTTPKIT_POST @"POST"
#define HTTPKIT_DATA @"HTTPKIT_DATA"

#define HTTPKIT_TIMEOUT @"HTTPKIT_TIMEOUT"
#define HTTPKIT_CACHEPOLICY @"HTTPKIT_CACHEPOLICY"
#define HTTPKIT_TRYCOUNT @"HTTPKIT_TRYCOUNT"


#pragma base sdk
#define GAMECENTER_REPORTSCORE 1
#define GAMECENTER_REPORTACHIEVEMENT 2
#define GAMECENTER_UNLOCKACHIEVEMENT 3

#endif /* CoolGameMacros_h */

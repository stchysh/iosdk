//
//  CoolGameLog.h
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/22.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoolGameIOSDK/Core/CoolGameMacros.h>

@interface CoolGameLog : NSObject

+(BOOL) isShowLog;


+(void) setIsShowLog:(BOOL) isShowLog;
+(void)log:(NSString*)tag message:(NSString*)msg;
+(void)log:(NSString*)msg;
+(void)logInit:(NSString*)msg;
+(void)logConfig:(NSString*)msg;


@end

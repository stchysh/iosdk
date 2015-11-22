//
//  CoolGameLog.m
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/22.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import "CoolGameLog.h"

@implementation CoolGameLog

static bool _isShowLog = false;

+(BOOL) isShowLog {
    return _isShowLog;
}

+(void) setIsShowLog:(BOOL)isShowLog {
    _isShowLog = isShowLog;
    [CoolGameLog log:[NSString stringWithFormat:@"show log:%s", _isShowLog?"YES":"NO"]];
}

+(void) log:(NSString *)msg {
    [self log:LOG_DEFAULT_TAG message:msg];
}

+(void) logInit:(NSString *)msg {
    [self log:LOG_INIT_TAG message:msg];
}

+(void)logConfig:(NSString*)msg {
    [self log:LOG_CONFIG_TAG message:msg];
}


+(void) log:(NSString *)tag message:(NSString *)msg {
    if([self isShowLog]) {
        NSLog(@"#iosdk %@ %@", tag, msg);
    }
}


@end

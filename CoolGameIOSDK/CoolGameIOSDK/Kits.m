//
//  Kits.m
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/22.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Kits.h"



@implementation Kits

static CoolGameConfig * _config;
static CoolGameAlertKit * _alert;

+(CoolGameConfig*) config {
    if(!_config) {
        _config = [CoolGameConfig new];
    }
    return _config;
}

+(CoolGameAlertKit*) alert {
    if(!_alert) {
        _alert = [CoolGameAlertKit new];
    }
    return _alert;
}


+(void)assert:(BOOL)val message:(NSString*)msg {
    if(!val) {
        @throw [NSException exceptionWithName:SDK_NAME reason:msg userInfo:nil];
    }
}

+(void)getSync:(NSString *)urlPath completionHandler:(void (^)(NSString *))handler {
    [[HttpSyncKit new] get:urlPath completionHandler:handler];
}

@end
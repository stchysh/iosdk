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

+(CoolGameConfig*) config {
    if(!_config) {
        _config = [CoolGameConfig new];
    }
    return _config;
}

+(void)assert:(BOOL)val message:(NSString*)msg {
    if(!val) {
        @throw [NSException exceptionWithName:SDK_NAME reason:msg userInfo:nil];
    }
}

@end
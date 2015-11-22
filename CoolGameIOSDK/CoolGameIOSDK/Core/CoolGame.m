//
//  CoolGame.m
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/22.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import "CoolGame.h"
#import <Kits.h>

@implementation CoolGame

static id<CoolGameDelegate> _delegate;

#pragma config -----------------------------------------

+(void) setConfig:(BOOL)debug setIsShowLog:(BOOL)isShowLog {
    
    [CoolGameLog setIsShowLog:isShowLog];
}

+(void) setViewContainer:(UIView *)container {
    
}

#pragma init -----------------------------------------
+(void) init:(id<CoolGameDelegate>)delegate setAppId:(NSString*) appId setAppKey:(NSString*) appKey {
    [CoolGameLog log:@"coolgame sdk initing"];
    _delegate = delegate;
    CoolGameInitKit *initKit = [CoolGameInitKit new];
    [initKit setup:delegate setAppId:appId setAppKey:appKey];
}

#pragma login ----------------------------------------
+(void) login {
    [[CoolGameLoginKit new] setup:_delegate];
}


@end

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
static UIViewController * _viewController;

#pragma config -----------------------------------------

+(void) setConfig:(BOOL)debug setIsShowLog:(BOOL)isShowLog {
    
    [CoolGameLog setIsShowLog:isShowLog];
}

//+(void) setViewContainer:(UIView *)container {
//
//}

+(void) setViewController:(UIViewController *)viewController {
    [Kits assert:(viewController!=nil) message:@"viewController cannot be nil."];
    [Kits setUIViewController:viewController];
    _viewController = viewController;
//    [[Kits alert] setup:_viewController];
}

#pragma init -----------------------------------------
+(void) init:(id<CoolGameDelegate>)delegate setAppId:(NSString*) appId setAppKey:(NSString*) appKey {
    [Kits assert:(delegate!=nil) message:@"delegate cannot be nil."];
    [CoolGameLog log:@"coolgame sdk initing"];
    [Kits setDelegate:delegate];
    _delegate = delegate;
    CoolGameInitKit *initKit = [CoolGameInitKit new];
    [initKit setup:appId setAppKey:appKey];
}

#pragma login ----------------------------------------
+(void) login {
//    [[CoolGameLoginKit new] setup];
    [[Kits sdk] doLogin];
}

#pragma usercenter ----------------------------------------

+(void) userCenter {
    [[Kits sdk] showUserCenter];
}

@end

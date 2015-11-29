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
static UIViewController * _viewController;
static id<CoolGameDelegate> _delegate;
static BaseSdk * _sdk;

+(void)setUIViewController:(UIViewController*)viewController {
    _viewController = viewController;
}

+(UIViewController*) viewController {
    return _viewController;
}

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

#pragma delegate

+(id<CoolGameDelegate>) delegate {
    return _delegate;
}
+(void)setDelegate:(id<CoolGameDelegate>)delegate {
    _delegate = delegate;
}

#pragma sdk
+(BaseSdk*) sdk {
    return _sdk;
}
+(void) setSDK:(BaseSdk*)sdk {
    _sdk = sdk;
}

#pragma assert
+(void)assert:(BOOL)val message:(NSString*)msg {
    if(!val) {
        @throw [NSException exceptionWithName:SDK_NAME reason:msg userInfo:nil];
    }
}



#pragma  http
+(void)get:(NSString *)urlPath completionHandler:(void (^)(NSString *))handler {
    [[HttpKit new] get:urlPath completionHandler:handler];
}
+(void)post:(NSString*)urlPath sendData:(NSData*)data completionHandler:(void (^)(NSString*))handler {
    [[HttpKit new] post:urlPath completionHandler:handler setParams:@{ HTTPKIT_DATA : data }];
}

#pragma loading view
+(void)showLoading {
    [LoadingViewKit showLoading:_viewController.view];
}
+(void)showLoading:(NSString*)text {
    [LoadingViewKit showLoading:_viewController.view withText:text];
}
+(void)hideLoading {
    [LoadingViewKit hideLoading:_viewController.view];
}


@end
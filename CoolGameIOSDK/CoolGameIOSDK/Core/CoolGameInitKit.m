//
//  CoolGameInitKit.m
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/22.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import "CoolGameInitKit.h"

@implementation CoolGameInitKit

//配置初始化
//更新检测？
-(void)setup:(NSString*)appId setAppKey:(NSString*)appKey {
    [Kits showLoading:@"initing..."];
    [CoolGameLog logInit:@"CoolGameInitKit setup."];
//    self._delegate = delegate;
    [[Kits config] setAppId:appId setAppKey:appKey completeHandler:^(void) {
        [self checkUpdate];
    }];
    
    
}

//检测更新
-(void)checkUpdate {
    [CoolGameLog logInit:@"CoolGameInitKit checkupdate."];
    [self startInit];
}

//初始化处理
-(void)startInit {
    [CoolGameLog logInit:@"CoolGameInitKit initing."];
    
    BaseSdk * sdk = [[GameCenterSdk alloc] init];
    [Kits setSDK:sdk];
    
    [self initSuccess];
}

-(void)initSuccess {
    [Kits hideLoading];
    [CoolGameLog logInit:@"CoolGameInitKit inited."];
    
    [[Kits delegate] initSuccess:YES];
    
}




@end

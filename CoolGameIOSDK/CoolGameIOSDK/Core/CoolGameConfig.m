//
//  CoolGameConfig.m
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/22.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import "CoolGameConfig.h"

@implementation CoolGameConfig

-(void)initConfig {
    
}

-(void) setAppId:(NSString *)appId setAppKey:(NSString*)appKey completeHandler:(void (^)(void))handler{
    self.appId = appId;
    [CoolGameLog logConfig:[NSString stringWithFormat:@"setAppId:%@", appId]];
    [Kits assert:(appId!=nil&&appId.length > 0) message:@"appId不能为空"];
    
    self.appKey = appKey;
    [CoolGameLog logConfig:[NSString stringWithFormat:@"setAppKey:%@", appKey]];
    [Kits assert:(appKey!=nil&&appKey.length > 0) message:@"appKey不能为空"];
    
    handler();
}

@end

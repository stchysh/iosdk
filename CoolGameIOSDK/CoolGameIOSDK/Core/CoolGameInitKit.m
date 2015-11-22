//
//  CoolGameInitKit.m
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/22.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import "CoolGameInitKit.h"

@implementation CoolGameInitKit

-(void)setup:(id<CoolGameDelegate>)delegate setAppId:(NSString*)appId setAppKey:(NSString*)appKey {
    [CoolGameLog logInit:@"CoolGameInitKit setup."];
    self._delegate = delegate;
    [[Kits config] setAppId:appId setAppKey:appKey completeHandler:^(void) {
        [self startInit];
    }];
    
    
}

-(void)startInit {
    [CoolGameLog logInit:@"CoolGameInitKit initing."];
    
    [self initSuccess];
}

-(void)initSuccess {
    [CoolGameLog logInit:@"CoolGameInitKit inited."];
    
    [self._delegate initSuccess];
}




@end

//
//  CoolGameConfig.h
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/22.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Kits.h>

@interface CoolGameConfig : NSObject

@property (nonatomic, strong) NSString * appId;
@property (nonatomic, strong) NSString * appKey;

-(void) initConfig;
-(void) setAppId:(NSString *)appId setAppKey:(NSString*)appKey completeHandler:(void (^)(void))handler;

@end

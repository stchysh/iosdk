//
//  GameCenterSdk.h
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/29.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import <Sdks/BaseSdk.h>
#import <GameKit/GameKit.h>
#import <Kits.h>

@class BaseSdk;

@interface GameCenterSdk : BaseSdk


-(void) loginSuccess:(BOOL)result alias:(NSString*)alias playerId:(NSString*)playerId displayName:(NSString*)displayName;

//是否支付GameCenter
-(BOOL) isGameCenterAvailable;
-(void) loginGameCenter;

@end

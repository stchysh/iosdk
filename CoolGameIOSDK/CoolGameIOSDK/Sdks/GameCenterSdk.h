//
//  GameCenterSdk.h
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/29.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import <Sdks/BaseSdk.h>
#import <GameKit/GameKit.h>
#import <CoolGameDelegate.h>
#import <Kits.h>

@class BaseSdk;

@interface GameCenterSdk : BaseSdk<GKAchievementViewControllerDelegate> {
    
@protected BOOL userAuthenticated;
    
}


-(void) loginSuccess:(BOOL)result alias:(NSString*)alias playerId:(NSString*)playerId displayName:(NSString*)displayName;
-(void) authenticationChanged;
-(void) onLoginSuccess;

//是否支付GameCenter
-(BOOL) isGameCenterAvailable;
-(void) loginGameCenter;

- (void) unlockAchievement:(GKAchievement *)achievement percent:(float)percent;
- (void) displayAchievement:(GKAchievement*)achievement;

@end

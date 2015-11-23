//
//  CoolGameInitKit.h
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/22.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoolGameDelegate.h>
#import <Kits.h>

@interface CoolGameInitKit : NSObject

@property id<CoolGameDelegate> _delegate;

-(void)setup:(id<CoolGameDelegate>)delegate setAppId:(NSString*)appId setAppKey:(NSString*)appKey;
-(void)startInit;
-(void)checkUpdate;
-(void)initSuccess:(BOOL)result;

@end

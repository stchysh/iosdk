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

-(void)setup:(NSString*)appId setAppKey:(NSString*)appKey;
-(void)startInit;
-(void)checkUpdate;
-(void)initSuccess;

@end

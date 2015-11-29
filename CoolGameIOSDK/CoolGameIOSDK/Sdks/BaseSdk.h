//
//  BaseSdk.h
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/29.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseSdk : NSObject

-(void)doLogin;
-(void)doLogout;
-(void)showUserCenter;

-(void)sendData:(NSArray*) params setCallback:(void (^)(NSObject*))callback;

@end

//
//  CoolGameAlertKit.h
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/23.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Kits.h>

@interface CoolGameAlertKit : NSObject

@property (nonatomic, strong) UIViewController* _viewController;

-(void)setup:(UIViewController*)viewController;

-(void)alert:(NSString*)msg;
-(void)alert:(NSString*)msg setTitle:(NSString*)title;
-(void)alert:(NSString*)msg setTitle:(NSString*)title completeHandler:(void (^)(int))handler;

@end

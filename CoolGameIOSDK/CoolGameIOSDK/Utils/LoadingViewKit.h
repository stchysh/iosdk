//
//  LoadingViewKit.h
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/28.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LoadingViewKit : NSObject

+(void)showLoading:(UIView *)view withText:(NSString *)text;
+(void)showLoading:(UIView *)view;
+(void)hideLoading:(UIView *)view;

+(void)updatetext:(NSString *)text forView:(UIView *)view;
+(void)updatetext:(NSString *)text andWidth:(CGFloat)width andLines:(int)lines forView:(UIView *)view;

@end

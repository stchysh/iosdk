//
//  ViewController.h
//  CoolGameIOSDKDemo
//
//  Created by LinKunxin on 15/11/22.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoolGameIOSDK/CoolGame.h>
#import <CoolGameIOSDK/CoolGameDelegate.h>

@interface ViewController : UIViewController<CoolGameDelegate>

@property (strong, nonatomic) IBOutlet UIView *_viewContainer;

@end


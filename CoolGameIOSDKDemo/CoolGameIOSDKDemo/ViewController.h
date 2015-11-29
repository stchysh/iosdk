//
//  ViewController.h
//  CoolGameIOSDKDemo
//
//  Created by LinKunxin on 15/11/22.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoolGameIOSDK/CoolGame.h>

@interface ViewController : UIViewController<CoolGameDelegate>

@property (strong, nonatomic) IBOutlet UIView *_viewContainer;
@property (weak, nonatomic) IBOutlet UITextField *txt_userName;

@property (weak, nonatomic) IBOutlet UITextField *txtpwd;
@property (weak, nonatomic) IBOutlet UIButton *btnUserCenter;
@property UIAlertView * myAlert;
@property UIActivityIndicatorView *activityView;
@end


//
//  ViewController.m
//  CoolGameIOSDKDemo
//
//  Created by LinKunxin on 15/11/22.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [CoolGame setViewContainer:self._viewContainer];
    [CoolGame setViewController:self];
    [CoolGame setConfig:YES setIsShowLog:YES];
    
    [CoolGame init:self setAppId:@"10001" setAppKey:@"ABCDEFGHIJKLMN"];
    
}
- (IBAction)btnUserCenterHandler:(id)sender {
    [CoolGame userCenter];
}

- (IBAction)btnLoginHandler:(id)sender {
    [CoolGame login];
//    
//    self.myAlert = [[UIAlertView alloc] initWithTitle:nil
//                                         message: @"读取中..."
//                                        delegate: self
//                               cancelButtonTitle: nil
//                               otherButtonTitles: nil];
//    
//    self.activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
//    self.activityView.frame = CGRectMake(120.f, 48.0f, 38.0f, 38.0f);
//    [self.myAlert addSubview:self.activityView];
//    [self.activityView startAnimating];
//    [self.myAlert show];

    
}

-(void) onInitSuccess:(BOOL)result {
    NSLog(@"#initSuccess, %d", result);
}

-(void) onLoginSuccess:(BOOL)result alias:(NSString*)alias playerId:(NSString*)playerId displayName:(NSString*)displayName {
    NSString * name = [NSString stringWithFormat:@"%@, %@", alias, displayName];
    self.txt_userName.text = name;
    self.txtpwd.text = playerId;
    NSLog(@"#login success:%d, alias:%@, playerId:%@, displayName:%@", result, alias, playerId, displayName);
    [self.myAlert dismissWithClickedButtonIndex:0 animated:YES];
    
    self.btnUserCenter.hidden = NO;
}

-(void) onLogout {
    
}

-(void) onUserCenterClosed {
    NSLog(@"#user Center Close in view");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

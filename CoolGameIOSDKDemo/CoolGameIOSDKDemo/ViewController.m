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
    
    [CoolGame setViewContainer:self._viewContainer];
    [CoolGame setConfig:YES setIsShowLog:YES];
    
    [CoolGame init:self setAppId:@"10001" setAppKey:@"ABCDEFGHIJKLMN"];
    
}
- (IBAction)btnLoginHandler:(id)sender {
    [CoolGame login];
}

-(void) loginSuccess {
    NSLog(@"#login success");
}

-(void) initSuccess {
    NSLog(@"#initSuccess");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

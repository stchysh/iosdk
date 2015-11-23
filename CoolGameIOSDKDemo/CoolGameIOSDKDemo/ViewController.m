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
- (IBAction)btnLoginHandler:(id)sender {
    [CoolGame login];
    
}

-(void) initSuccess:(BOOL)result {
    NSLog(@"#initSuccess, %d", result);
}

-(void) loginSuccess:(BOOL)result alias:(NSString*)alias playerId:(NSString*)playerId displayName:(NSString*)displayName {
    NSLog(@"#login success:%d, alias:%@, playerId:%@, displayName:%@", result, alias, playerId, displayName);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

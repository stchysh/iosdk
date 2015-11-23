//
//  CoolGameAlertKit.m
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/23.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import "CoolGameAlertKit.h"

@implementation CoolGameAlertKit

-(void)setup:(UIViewController*)viewController {
    self._viewController = viewController;
}

-(void)alert:(NSString*)msg {
    [self alert:msg setTitle:nil completeHandler:nil];
}

-(void)alert:(NSString*)msg setTitle:(NSString*)title {
    [self alert:msg setTitle:title completeHandler:nil];
}

-(void)alert:(NSString*)msg setTitle:(NSString*)title completeHandler:(void (^)(int))handler {
    if (!title) {
        title = @"Tips";
    }
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        if(handler) handler(0);
    }];
    [alert addAction:alertAction];
    
    [self._viewController presentViewController:alert animated:YES completion:nil];
    
    
}

@end

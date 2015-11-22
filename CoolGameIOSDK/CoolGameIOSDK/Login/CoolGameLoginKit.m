//
//  CoolGameLoginKit.m
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/22.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import "CoolGameLoginKit.h"

@implementation CoolGameLoginKit

-(void) setup:(id<CoolGameDelegate>)delegate {
    [CoolGameLog logLogin:@"CoolGameLoginKit setup"];
    self._delegate = delegate;
    
    [self loginSuccess];
}

-(void) loginSuccess {
    [CoolGameLog logLogin:@"CoolGameLoginKit loginSuccess"];
    [self._delegate loginSuccess];
}

@end

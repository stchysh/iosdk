//
//  CoolGameLoginKit.h
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/22.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Kits.h>

@interface CoolGameLoginKit : NSObject

@property id<CoolGameDelegate> _delegate;

-(void) setup:(id<CoolGameDelegate>)delegate;

-(void) loginSuccess;

@end

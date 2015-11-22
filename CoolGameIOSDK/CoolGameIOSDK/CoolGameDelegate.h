//
//  CoolGameDelegate.h
//  CoolGameIOSDK
//
//  Created by LinKunxin on 15/11/22.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef CoolGameDelegate_h
#define CoolGameDelegate_h

@protocol CoolGameDelegate<NSObject>

@required

//init callback
-(void) initSuccess;

//login callback
-(void) loginSuccess;


@end

#endif /* CoolGameDelegate_h */

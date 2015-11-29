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


#pragma init callback
@required
-(void) onInitSuccess:(BOOL)result;

#pragma login callback
@required
-(void) onLoginSuccess:(BOOL)result alias:(NSString*)alias playerId:(NSString*)playerId displayName:(NSString*)displayName;

@required
-(void) onLogout;

#pragma usercenter
@required
-(void) onUserCenterClosed;

@end

#endif /* CoolGameDelegate_h */

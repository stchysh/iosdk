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
-(void) initSuccess:(BOOL)result;

#pragma login callback
@required
-(void) loginSuccess:(BOOL)result alias:(NSString*)alias playerId:(NSString*)playerId displayName:(NSString*)displayName;

#pragma usercenter
@required
-(void) userCenterClose;

@end

#endif /* CoolGameDelegate_h */

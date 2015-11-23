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
-(void) initSuccess:(BOOL)result;

//login callback
-(void) loginSuccess:(BOOL)result alias:(NSString*)alias playerId:(NSString*)playerId displayName:(NSString*)displayName;


@end

#endif /* CoolGameDelegate_h */

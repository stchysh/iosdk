//
//  AppDelegate.m
//  CoolGameIOSDKDemo
//
//  Created by LinKunxin on 15/11/22.
//  Copyright © 2015年 kuyou. All rights reserved.
//

#import "AppDelegate.h"
#import "3rdsdk/mta/MTA.h"
#import "3rdsdk/mta/MTAConfig.h"


@interface AppDelegate ()

@end

#define MTA_APPKEY @"I4UPQ8A9P5DB"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [MTA startWithAppkey:MTA_APPKEY];
    
    return YES;
}
/**
 * @desc 获取附近的人的数据
 * @params data   获取的数据
 * @params result 获取结果的状态
 */
- (void)nearbyNeighbors:(id)data result:(BOOL)result {
    
}

/**
 * @desc 位置查询
 * @params data   获取数据的结果
 * @params result 获取结果的状态
 */
- (void)queryLocations:(id)data result:(BOOL)result {
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

//
//  JZDjAppDelegate.m
//  JZDjCommon
//
//  Created by wapushidai on 2019/10/23.
//  Copyright © 2019 WX. All rights reserved.
//

#import "JZDjAppDelegate.h"
#import <JZDjLib/JZDiLibRegister.h>

@implementation JZDjAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [JZDiLibRegister regsterJPushKey:@"" jPushLaunchingWithOptions:launchOptions];
    [JZDiLibRegister shareInteface].umenKey = @"";
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {

}


- (void)applicationWillEnterForeground:(UIApplication *)application {

}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {

}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    
}

@end

//
//  AppDelegate.m
//  JZDjMusicMainProject
//
//  Created by wapushidai on 2019/10/23.
//  Copyright © 2019 WX. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Extension.h"
#import "GKMainTabBarController.h"

#import <JZDjLib/JPushManager.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [super application:application didFinishLaunchingWithOptions:launchOptions];
    [self runSDK];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [GKMainTabBarController new];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [[JPushManager shareJPushManager] cdm_registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    NSString *version = [UIDevice currentDevice].systemVersion;
    if (version.doubleValue < 10.0)
    {
        [[JPushManager shareJPushManager] cdm_handleRemoteNotification:userInfo click:NO saveData:YES];//保存
        if([JPushManager runningInBackground])
        {
               [[JPushManager shareJPushManager] cdm_handleRemoteNotification:userInfo click:YES saveData:NO];
        }
        if([JPushManager runningInForeground])//前台处理，没有强提醒
        {
            [[JPushManager shareJPushManager] cdm_handleRemoteNotification:userInfo click:YES saveData:NO];
        }
    }
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    NSString *version = [UIDevice currentDevice].systemVersion;
    if (version.doubleValue < 10.0)
    {
         [[JPushManager shareJPushManager] cdm_handleRemoteNotification:userInfo click:NO saveData:YES];//保存
        if([JPushManager runningInBackground])
        {
            [[JPushManager shareJPushManager] cdm_handleRemoteNotification:userInfo click:YES saveData:NO];
        }
        if([JPushManager runningInForeground])//前台处理，没有强提醒
        {
            [[JPushManager shareJPushManager] cdm_handleRemoteNotification:userInfo click:YES saveData:NO];
        }
    }
}

@end

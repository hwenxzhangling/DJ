//
//  JPushManager.m
//  JPushManager
//
//  Created by Doman on 17/3/31.
//  Copyright © 2017年 doman. All rights reserved.
//

#import "JPushManager.h"
#import "JPUSHService.h"

// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif


@interface JPushManager ()<JPUSHRegisterDelegate>

@end

@implementation JPushManager
static NSInteger seq = 0;
+ (JPushManager *)shareJPushManager
{
    static JPushManager * JPushTool = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        JPushTool = [[JPushManager alloc] init];
    });
    
    return JPushTool;
}

//极光注册ID
- (NSString *)registrationID;
{
    return JPUSHService.registrationID;
}
// 在应用启动的时候调用
- (void)cdm_setupWithOption:(NSDictionary *)launchingOption
                     appKey:(NSString *)appKey
                    channel:(NSString *)channel
           apsForProduction:(BOOL)isProduction
      advertisingIdentifier:(NSString *)advertisingId
{
    
    // Override point for customization after application launch.
    // 3.0.0及以后版本注册
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    if (@available(iOS 12.0, *)) {
        entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound|UNAuthorizationOptionProvidesAppNotificationSettings;
    } else {
        entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    }
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        //    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
        //      NSSet<UNNotificationCategory *> *categories;
        //      entity.categories = categories;
        //    }
        //    else {
        //      NSSet<UIUserNotificationCategory *> *categories;
        //      entity.categories = categories;
        //    }
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    //如不需要使用IDFA，advertisingIdentifier 可为nil
    [JPUSHService setupWithOption:launchingOption appKey:appKey
                          channel:channel
                 apsForProduction:isProduction
            advertisingIdentifier:advertisingId];
  
    return;
}

// 在appdelegate注册设备处调用
- (void)cdm_registerDeviceToken:(NSData *)deviceToken
{
    [JPUSHService registerDeviceToken:deviceToken];
    return;

}

//设置角标
- (void)cdm_setBadge:(int)badge
{
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:badge];
    [JPUSHService setBadge:badge];
}

//获取注册ID
- (void)cdm_getRegisterIDCallBack:(void(^)(NSString *registerID))completionHandler
{
    [JPUSHService registrationIDCompletionHandler:^(int resCode, NSString *registrationID) {
//        if(resCode == 0){
//        NSLog(@"registrationID获取成功：%@",registrationID);

//        }
//        else{
//            NSLog(@"registrationID获取失败，code：%d",resCode);
//        }
        
        if (resCode == 0) {
 
            NSLog(@"registrationID获取成功：%@",registrationID);

            completionHandler(registrationID);
        }
    }];
    
}

//处理推送信息
- (void)cdm_handleRemoteNotification:(NSDictionary *)remoteInfo click:(BOOL)click saveData:(BOOL)saveData
{
    [JPUSHService handleRemoteNotification:remoteInfo];
    if(self.HandleRemoteNotificationBlock)
    {
        self.HandleRemoteNotificationBlock(remoteInfo,click,saveData);
    }
}
    
//统计开始页面  isStart YES 开始 isStart NO 停止
- (void)cdm_startLogPagevc:(UIViewController *)LogPagevc isStart:(BOOL)isStart;
{
    if(isStart)
    {
        [JPUSHService startLogPageView:NSStringFromClass(LogPagevc.class)];
    }else
    {
         [JPUSHService stopLogPageView:NSStringFromClass(self.class)];
    }
}

//管理tags  type=JPushManagementTagType_CleanTags tags不用传
- (void)cdm_managementTagsType:(JPushManagementTagType)tagsType tags:(NSString *)tags;
{
    
    NSArray * tagsList = [tags componentsSeparatedByString:@","];
    NSMutableSet *tagsSet = [[NSMutableSet alloc] init];
    [tagsSet addObjectsFromArray:tagsList];
    
    switch (tagsType)
    {
        case JPushManagementTagType_AddTags://新增tags
        {
            [JPUSHService addTags:tagsSet completion:^(NSInteger iResCode, NSSet *iTags, NSInteger seq) {
                [self inputResponseCode:iResCode content:[NSString stringWithFormat:@"%@", iTags.allObjects] andSeq:seq];
            } seq:[self seq]];
        }
        break;
        case JPushManagementTagType_Tags://覆盖tags
        {
            [JPUSHService setTags:tagsSet completion:^(NSInteger iResCode, NSSet *iTags, NSInteger seq) {
                [self inputResponseCode:iResCode content:[NSString stringWithFormat:@"%@", iTags.allObjects] andSeq:seq];
            } seq:[self seq]];
        }
        break;
        case JPushManagementTagType_DeleteTags:// 删除指定tags
        {
            [JPUSHService deleteTags:tagsSet completion:^(NSInteger iResCode, NSSet *iTags, NSInteger seq) {
                [self inputResponseCode:iResCode content:[NSString stringWithFormat:@"%@", iTags.allObjects] andSeq:seq];
            } seq:[self seq]];
        }
        break;
        case JPushManagementTagType_CleanTags:// 清空所有tags
        {
            [JPUSHService cleanTags:^(NSInteger iResCode, NSSet *iTags, NSInteger seq)
            {
                [self inputResponseCode:iResCode content:[NSString stringWithFormat:@"%@", iTags.allObjects] andSeq:seq];
             } seq:[self seq]];
        }
        break;
        case JPushManagementTagType_allTags:// 查看所有tags
        {
            [JPUSHService getAllTags:^(NSInteger iResCode, NSSet *iTags, NSInteger seq) {
                [self inputResponseCode:iResCode content:[NSString stringWithFormat:@"%@", iTags.allObjects] andSeq:seq];
            } seq:[self seq]];
        }
        break;
        default:
        break;
    }
}
    
- (void)inputResponseCode:(NSInteger)code content:(NSString *)content andSeq:(NSInteger)seq
{
    NSLog(@"\n\n code:%ld content:%@ seq:%ld", code, content, seq);
}
    
- (NSInteger)seq
{
    return ++ seq;
}
    
//管理Alias
- (void)cdm_managementAliasType:(JPushManagementAliasType)AliasType alias:(NSString *)alias;
{
    switch (AliasType)
    {
        case JPushManagementAliasType_setAlias:// 设置Alias
        {
            [JPUSHService setAlias:alias completion:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
                [self inputResponseCode:iResCode content:iAlias andSeq:seq];
            } seq:[self seq]];
        }
        break;
        case JPushManagementAliasType_Deletealias:// 删除指定Alias
        {
            [JPUSHService deleteAlias:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
                [self inputResponseCode:iResCode content:iAlias andSeq:seq];
            } seq:[self seq]];
        }
        break;
        case JPushManagementTagType_Alias: //查看Alias
        {
            [JPUSHService getAlias:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
                [self inputResponseCode:iResCode content:iAlias andSeq:seq];
            } seq:[self seq]];
        }
        break;
        
        default:
        break;
    }
}

//是否开启推送权限
- (BOOL)cdm_openPermissions;
{
    UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
    if (UIUserNotificationTypeNone == setting.types)
    {
        return NO;
    }else{
        return YES;
    }
}

//开启通知权限
- (void)openPermissions;
{
    //跳转到定位权限页面
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if( [[UIApplication sharedApplication] canOpenURL:url] ) {
        [[UIApplication sharedApplication] openURL:url];
    }
}

//后台
+(BOOL)runningInBackground
{
    UIApplicationState state = [UIApplication sharedApplication].applicationState;
    BOOL result = (state == UIApplicationStateBackground);
    return result;
}
//前台
+(BOOL)runningInForeground
{
    UIApplicationState state = [UIApplication sharedApplication].applicationState;
    BOOL result = (state == UIApplicationStateActive);
    return result;
}

#pragma mark JPUSHRegisterDelegate
 //OS 10 Support //获取
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger options))completionHandler
{
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [self cdm_handleRemoteNotification:userInfo click:NO saveData:YES];
    }
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以选择设置

}

// iOS 10 Support ////点击
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)())completionHandler
{
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [self cdm_handleRemoteNotification:userInfo click:YES saveData:NO];
    }
    completionHandler(UNNotificationPresentationOptionAlert);  // 系统要求执行这个方法

}



@end

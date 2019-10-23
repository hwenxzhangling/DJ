//
//  JPushManager.h
//  JPushManager
//
//  Created by Doman on 17/3/31.
//  Copyright © 2017年 doman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//管理极光tags类型
typedef NS_ENUM(NSInteger,JPushManagementTagType)
{
    JPushManagementTagType_AddTags          = 0,// 新增tags
    JPushManagementTagType_Tags             = 1,// 覆盖tags
    JPushManagementTagType_DeleteTags       = 2,// 删除指定tags
    JPushManagementTagType_CleanTags        = 3,// 清空所有tags
    JPushManagementTagType_allTags          = 4 //查看所有tags
};
//管理极光Alias类型
typedef NS_ENUM(NSInteger,JPushManagementAliasType)
{
    JPushManagementAliasType_setAlias           = 0,// 设置Alias
    JPushManagementAliasType_Deletealias        = 1,// 删除指定Alias
    JPushManagementTagType_Alias                = 2 //查看Alias
};

//推送返回消息
typedef void(^JPushManagerHandleRemoteNotificationBlock)(NSDictionary *remoteInfo,BOOL click,BOOL saveData);

@interface JPushManager : NSObject
    
@property (nonatomic,copy)JPushManagerHandleRemoteNotificationBlock HandleRemoteNotificationBlock;

+(JPushManager *)shareJPushManager;

//极光注册ID
- (NSString *)registrationID;
// 在应用启动的时候调用
- (void)cdm_setupWithOption:(NSDictionary *)launchingOption
                 appKey:(NSString *)appKey
                channel:(NSString *)channel
       apsForProduction:(BOOL)isProduction
  advertisingIdentifier:(NSString *)advertisingId;

// 在appdelegate注册设备处调用
- (void)cdm_registerDeviceToken:(NSData *)deviceToken;

//设置角标
- (void)cdm_setBadge:(int)badge;

//获取注册ID
- (void)cdm_getRegisterIDCallBack:(void(^)(NSString *registerID))completionHandler;

//处理推送信息
- (void)cdm_handleRemoteNotification:(NSDictionary *)remoteInfo click:(BOOL)click saveData:(BOOL)saveData;
    
//统计开始页面  isStart YES 开始 isStart NO 停止
- (void)cdm_startLogPagevc:(UIViewController *)LogPagevc isStart:(BOOL)isStart;
  
//管理tags(注 用顿号,隔开)  type=JPushManagementTagType_CleanTags|JPushManagementTagType_allTags tags不用传
- (void)cdm_managementTagsType:(JPushManagementTagType)tagsType tags:(NSString *)tags;

//管理Alias
- (void)cdm_managementAliasType:(JPushManagementAliasType)AliasType alias:(NSString *)alias;

//是否开启通知权限
- (BOOL)cdm_openPermissions;

//开启通知权限
- (void)openPermissions;

//后台
+(BOOL)runningInBackground;

//前台
+(BOOL)runningInForeground;
@end

//
//  JZDiLibRegister.h
//  JZDjLib
//
//  Created by wapushidai on 2019/10/23.
//  Copyright © 2019 WX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JZDjLib/JPushManager.h>

#if DEBUG
static BOOL KLib_RegisterProduction = NO;
#else
static BOOL KLib_RegisterProduction = YES;
#endif
static NSString * const  KLibChannel = @"Apple Store";

NS_ASSUME_NONNULL_BEGIN

@interface JZDiLibRegister : NSObject
///极光key
@property (nonatomic,getter=get_JpushKey)NSString *jpushKey;
///U盟key
@property (nonatomic,strong)NSString *umenKey;
/// 获取极光ID
@property (nonatomic,copy)void (^jpushRegisterIDBlock)(NSString *registerID);
/// 推送回调信息
@property (nonatomic,copy)JPushManagerHandleRemoteNotificationBlock HandleRemoteNotificationBlock;
///shareInteface
+(instancetype)shareInteface;
///配置推送
/// @param jpushKey 极光key
/// @param launchOptions 启动参数
+(void)regsterJPushKey:(NSString *)jpushKey jPushLaunchingWithOptions:(NSDictionary *)launchOptions;
@end

NS_ASSUME_NONNULL_END

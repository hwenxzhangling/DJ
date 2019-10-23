//
//  JZDiLibRegister.m
//  JZDjLib
//
//  Created by wapushidai on 2019/10/23.
//  Copyright © 2019 WX. All rights reserved.
//

#import "JZDiLibRegister.h"
#import <UMCommon/UMCommon.h>
@interface JZDiLibRegister()
@property (nonatomic,strong)NSString *pushkey;
@end
@implementation JZDiLibRegister
+(instancetype)shareInteface;
{
    static JZDiLibRegister *__Register = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __Register = [[JZDiLibRegister alloc] init];
    });
    return __Register;
}

- (NSString *)get_JpushKey
{
    return self.pushkey;
}

- (void)setUmenKey:(NSString *)umenKey
{
    _umenKey = umenKey;
    if(_umenKey != nil)
    {
        [self configUmen];
    }
}

///配置推送
/// @param jpushKey 极光key
/// @param launchOptions 启动参数
+(void)regsterJPushKey:(NSString *)jpushKey jPushLaunchingWithOptions:(NSDictionary *)launchOptions;
{
    [JZDiLibRegister shareInteface].jpushKey = jpushKey;
    [[JPushManager shareJPushManager] cdm_setupWithOption:launchOptions appKey:jpushKey channel:KLibChannel apsForProduction:KLib_RegisterProduction advertisingIdentifier:nil];
    [[JPushManager shareJPushManager] cdm_getRegisterIDCallBack:^(NSString *registerID)
    {
        if([JZDiLibRegister shareInteface].jpushRegisterIDBlock)
        {
            [JZDiLibRegister shareInteface].jpushRegisterIDBlock(registerID);
        }
    }];
    [JPushManager shareJPushManager].HandleRemoteNotificationBlock = ^(NSDictionary *remoteInfo,BOOL click,BOOL saveData)
    {
        if([JZDiLibRegister shareInteface].HandleRemoteNotificationBlock)
        {
            [JZDiLibRegister shareInteface].HandleRemoteNotificationBlock(remoteInfo, click, saveData);
        }
    };
}

#pragma mark - 友盟统计
/**
 配置U盟统计
 */
- (void)configUmen;
{
    [UMConfigure initWithAppkey:self.umenKey channel:KLibChannel];
    [UMConfigure setLogEnabled:KLib_RegisterProduction];
    [UMConfigure setEncryptEnabled:KLib_RegisterProduction];
}
@end

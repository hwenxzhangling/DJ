//
//  AppDelegate+Extension.m
//  Weather
//
//  Created by hewenxue on 2017/7/17.
//  Copyright © 2017年 瓦普时代. All rights reserved.
//

#import "AppDelegate+Extension.h"
#import <IQKeyboardManager.h>
#import <AvoidCrash.h>

@implementation AppDelegate (Extension)

#pragma mark - 监听网络状态
-(void)configNetworkMonitor{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {        
        switch (status){
            case AFNetworkReachabilityStatusUnknown:
                //NSLog(@"未识别的网络");
                //break;
            case AFNetworkReachabilityStatusNotReachable:
                //NSLog(@"不可达的网络(未连接)");
                //[SVProgressHUD showErrorWithStatus:@"网络连接出错,请稍后重试!"];
                //[WENetworkErrorView show];
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                //NSLog(@"2G,3G,4G...的网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                //NSLog(@"wifi的网络");
                break;
            default:
                break;
        }
        POST_FAST_NOTIFICATION(kNetworkChangedNotification, @(status));
    }];
    [manager startMonitoring];
}

#pragma mark - 键盘
- (void)configKeyboard{
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
}

/**
 防止崩溃
 */
- (void)setupAvoidCrash{
#ifdef DEBUG
    
#else
    //[AvoidCrash becomeEffective];
    //[AvoidCrash makeAllEffective];
    NSArray *noneSelClassStrings = @[
                                     @"NSNull",
                                     @"NSNumber",
                                     @"NSString",
                                     @"NSDictionary",
                                     @"NSArray"
                                     ];
    [AvoidCrash setupNoneSelClassStringsArr:noneSelClassStrings];
#endif
}


/**
 启动所有配置
 */
- (void)runSDK
{
    //[self configShareSDK];
    [SVProgressHUD setMinimumDismissTimeInterval:2];
    [SVProgressHUD setMaximumDismissTimeInterval:2];
    //注册web页面缓存
    //[NSURLProtocol registerClass:[RNCachingURLProtocol class]];
    
    //获取公仔语言
   
    //监听网络状态
    [self configNetworkMonitor];
    // 键盘
    [self configKeyboard];
    // AvoidCrash
    [self setupAvoidCrash];
    NSURLCache *urlCache = [[NSURLCache alloc] initWithMemoryCapacity:20 * 1024 * 1024 diskCapacity:40 * 1024 * 1024 diskPath:nil];
    [NSURLCache setSharedURLCache:urlCache];
    //数据库初始化
    //[MagicalRecord setupCoreDataStackWithStoreNamed:@"almanac.sqlite"];
}
@end

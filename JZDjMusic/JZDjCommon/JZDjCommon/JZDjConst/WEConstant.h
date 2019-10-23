//
//  WEConstant.h
//  Weather
//
//  Created by yanglin on 2017/7/7.
//  Copyright © 2017年 瓦普时代. All rights reserved.
//  全局常量
#import <Foundation/Foundation.h>
#import "WEColorConstant.h"
#import "WENotificationConstant.h"

// 高度
static float const kEnglishKeyboardHeight = 216.f;
static float const kChineseKeyboardHeight = 252.f;

//极光推送环境
#if DEBUG
static BOOL isProduction = NO;
#else
static BOOL isProduction = YES;
#endif

#warning 测试图片
static NSString * const kTestImg = @"testImg";



// 用户偏好Key
static NSString * const kLastExitIndex = @"kLastExitIndex"; // 退出时Home的索引
static NSString * const kLastCitiesUpdateDate = @"kLastCitiesUpdateDate"; // 上次更新城市数据库时间
static NSString * const kDefaultStart = @"kDefaultStart"; // 天气移动端初始化数据表

static NSString * const kTyphoonURLKey = @"TyphoonURL"; // 台风URL
static NSString * const kVersionConfigKey = @"kVersionConfigKey"; // 版本配置

// 推送开关Key
static NSString * const kJPushSwitchOnKey = @"kJPushSwitchOnKey";
// 服务端推送收到消息标记Key
static NSString * const kJPushReceivedTagKey = @"kJPushReceivedTagKey";

//提醒查看滑雪场启动次数计数key
static NSString * const kHomeSkiingNumberTagKey = @"kHomeSkiingNumberTagKey";
//记事簿事件是否添加Key
static NSString * const kNotePadEventNumberTagKey = @"kNotePadEventNumberTagKey";
//积分弹出事件是否添加Key
static NSString * const kIntegralNumberTagKey = @"kIntegralNumberTagKey";
//积分本地数据key
static NSString * const kIntegralModelTagKey = @"kIntegralModelTagKey";
//兑换积分登录key
static NSString * const kIntegralLoginTagKey = @"kIntegralLoginTagKey";
//来至首次启动通知内容key
static NSString * const kPushResultDictTagKey = @"kPushResultDictTagKey";
//Home首页左侧底部悬浮按钮显示key
static NSString * const kHomeAdShowNumerTagKey = @"kHomeAdShowNumerTagKey";
//签到成功保存日期Key
static NSString * const kSignDateStringKey = @"kSignDateStringKey";
//签到成功userID
static NSString * const kSignUserIDKey = @"kSignUserIDKey";



// 第三方Key

//百度地图key
static NSString * const  kBaiduMapKey = @"LSnaCbNWWfONIkhl9c4j7nZXWa3dmjxf";
//shareSDK KEY
static NSString * const  KShareSDKKEY = @"118c5bee66d89";
//QQ
static NSString * const  KQQID = @"1105637848";
static NSString * const  KQQKEY = @"llB7ba51PKytrSV9";
//新浪
static NSString * const  KSinaKEY = @"2426172741";
static NSString * const  KSinaSecret = @"d8cddd78380e0f0f5bc05f4dab8517f6";
//微信
static NSString * const  KWXID = @"wx784795aa7dd89558";
static NSString * const  KWXSecret = @"6d7dc403bf1b58b9b854ef6e8aaeeef0";
//App商店地址
static NSString * const  KAPPStroURL = @"https://itunes.apple.com/cn/app/%E5%A4%A9%E6%B0%94%E5%90%9B-%E7%B2%BE%E5%87%86%E7%9A%84%E6%8B%9F%E4%BA%BA%E5%8C%96%E5%A4%A9%E6%B0%94%E5%AE%9E%E6%97%B6%E8%B7%9F%E8%B8%AA%E9%A2%84%E6%8A%A5/id990500440?mt=8";
//版本信息
static NSString * const  KAPPVersionURL = @"http://itunes.apple.com/lookup?id=990500440";
//创新梦想统计key
static NSString * const  KCXMXKey = @"a3a2315a71f22402581319b3";
//友盟key
static NSString * const  KUMKey = @"574fabc767e58ed525001359";
//极光推送key
static NSString * const  KJPUSHKEY = @"02db6d6df7a6a193c98630de";
//极光推送渠道
static NSString * const  KJPUSChannel = @"Apple Store";
//万年历地址
static NSString * const  KCalendarURL = @"https://itunes.apple.com/us/app/%E6%B0%91%E9%97%B4%E4%B8%87%E5%B9%B4%E5%8E%86-%E8%AE%A9%E5%A5%BD%E6%97%A5%E5%AD%90-%E4%BC%B4%E4%BD%A0%E5%B7%A6%E5%8F%B3/id1148567951?l=zh&ls=1&mt=8";






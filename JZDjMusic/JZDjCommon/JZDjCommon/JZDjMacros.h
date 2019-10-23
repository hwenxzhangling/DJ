//
//  WEMacros.h
//
//
//  Created by yanglin on 2017/1/19.
//  Copyright © 2017年 wpsd. All rights reserved.
//

// 3.自定义Log & 调试状态宏
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>

//分组名称
#define KWEGroupName                @"group.com.cxmx.weather"
#define KWEGroupNameWeatherHome     @"group.com.cxmx.weather.home"

#define APPDELEGATE ((AppDelegate *)[UIApplication sharedApplication].delegate)
// 视图尺寸
#define MAIN_WIDTH          ([[UIScreen mainScreen] bounds].size.width)
#define MAIN_HEIGHT         ([[UIScreen mainScreen] bounds].size.height)
#define IPHONE6HEIGHT        667.f
#define STATUS_BAR_HEIGHT   [[UIApplication sharedApplication] statusBarFrame].size.height
#define NAV_BAR_HEIGHT      44.0

//#define TAB_BAR_HEIGHT      ([[UIApplication sharedApplication] statusBarFrame].size.height > 20.0 ? 83.0 : 49.0)
//#define STATUSBA_UPDATE     (STATUS_BAR_HEIGHT == 40 || STATUS_BAR_HEIGHT == 64 ? YES : NO)
//#define TOP_HEIGHT          (  STATUSBA_UPDATE ? ((STATUS_BAR_HEIGHT-20)+NAV_BAR_HEIGHT) : ((STATUS_BAR_HEIGHT==0 ? 20 : STATUS_BAR_HEIGHT)+ NAV_BAR_HEIGHT)  )

#define STATUSBA_UPDATE     [WEFrameUtil stateBarUpdate]
#define TAB_BAR_HEIGHT      [WEFrameUtil currentTabBarHeight]
#define TOP_HEIGHT          [WEFrameUtil currentNavBarHeight]
#define SAFEHEIGHT           (TAB_BAR_HEIGHT-49)
#define MIN_X(v)             CGRectGetMinX((v).frame)
#define MIN_Y(v)             CGRectGetMinY((v).frame)
#define MAX_X(v)             CGRectGetMaxX((v).frame)
#define MAX_Y(v)             CGRectGetMaxY((v).frame)

//#define Ad_1Height (66+192.f/345.f*MAIN_WIDTH)
//#define Ad_2Height (56+192.f/345.f*MAIN_WIDTH)
//#define Ad_3Height (192.f/345.f*MAIN_WIDTH)
#define Ad_1Height (66+192.f/375.f*MAIN_WIDTH)
#define Ad_2Height (56+192.f/375.f*MAIN_WIDTH)
#define Ad_3Height (192.f/375.f*MAIN_WIDTH)

// 设置颜色
#define COLOR_A(r,g,b,a)   [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define COLOR(r,g,b)       [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]
#define COLOR_RADOM        [UIColor colorWithRed:arc4random()%255/255.0f green:arc4random()%255/255.0f blue:arc4random()%255/255.0f alpha:1.0]

// 设置字体大小
#define FONT(size)         [UIFont systemFontOfSize:IPHONE_PLUS_AND_LATER?(size+1):size]
#define FONTBOLD(size)     [UIFont boldSystemFontOfSize:IPHONE_PLUS_AND_LATER?(size+1):size]
#define NEWFONT(size)      [UIFont systemFontOfSize:MAIN_WIDTH/375*size]

//视图比例
#define VIEWCOLUMN(px)  (MAIN_WIDTH/375*px)

// 设备类型
#define MODEL              [[UIDevice currentDevice] model]
#define DEVICE_NAME        [[UIDevice currentDevice] name]
#define IPHONE_SIMULATOR    [kDevice_name isEqualToString:@"iPhone Simulator"]
#define IPHONE             [kModel isEqualToString:@"iPhone"]
#define IPAD               [kModel isEqualToString:@"iPad"]

// 设备类型
#define IPHONE_5_AND_EALIER     (MAIN_HEIGHT <=568?YES:NO)
#define IPHONE_5_LATER          (MAIN_HEIGHT >568?YES:NO)
#define IPHONE_PLUS_AND_LATER   (MAIN_HEIGHT >=736.0?YES:NO)

// 系统版本
#define SYSTEM_VERSION      [[UIDevice currentDevice] systemVersion].floatValue
#define SYSTEMNAME          [UIDevice currentDevice].systemName
#define SYSTEMODEL          [UIDevice currentDevice].model
#define APP_NAME            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"]
#define BUNDLE_ID           [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]
#define VERSION             [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define BUILD               [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define UDID                [[[UIDevice currentDevice] identifierForVendor] UUIDString]
#define DELEGATE            (AppDelegate *)[UIApplication sharedApplication].delegate

// 用户本地文件
#define STANDARD_USER_DEFAULTS                 [NSUserDefaults standardUserDefaults]
#define OUT_STANDARD_USER_DEFAULTS(key)        [[NSUserDefaults standardUserDefaults] objectForKey:key]
#define SAVE_STANDARD_USER_DEFAULTS(obj,key)   [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key];\
                                                [[NSUserDefaults standardUserDefaults] synchronize]
//是否关闭福利模块
#define WELFARE_HIDDEN ([OUT_STANDARD_USER_DEFAULTS(kVersionConfigKey) boolValue])

// 通知
#define POST_NOTIFICATION(name,obj,userinfo)    [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj userInfo:userinfo]
#define POST_FAST_NOTIFICATION(NAME,obj)         [[NSNotificationCenter defaultCenter] postNotificationName:NAME object:obj]
#define ADD_NOTIFICATION(Observer,SEL,Name,obj) [[NSNotificationCenter defaultCenter]addObserver:Observer selector:SEL name:Name object:obj]
#define REMOVE_ALL_NOTIFICATION                  [[NSNotificationCenter defaultCenter]removeObserver:self]
#define REMOVE_NOTIFICATION(Observer,NAME,obj)  [[NSNotificationCenter defaultCenter]removeObserver:Observer name:NAME object:obj];

// 图片
#define IMG(name)              [UIImage imageNamed:name]
#define PNG_IMG(NAME)           [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define JPG_IMG(NAME)           [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]

//HUD
#define HIDDENHUD(View)  [MBProgressHUD hideHUDForView:View animated:YES]
#define SHOWHUD(msg,view) [MBProgressHUD showMessage:msg  toView:view]

//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0

// 执行时间
#define TICK   NSDate *startTime = [NSDate date]
#define TOCK   NSLog(@"Time = %f", -[startTime timeIntervalSinceNow])

// 弱引用、强引用
#define WEAK_SELF(type)  __weak typeof(type) weak##type = type;
#define STRONG_SELF(type)  __strong typeof(type) type = weak##type;

// 测试颜色
#define TEST_COLOR      [UIColor colorWithWhite:0 alpha:0.1]
#define CELL_BG_COLOR   [UIColor colorWithWhite:0 alpha:0.2]

//手势点击交互效果
#define GESTURES_INTERACTION_CLICK_VIEWAlpha 0.3

#define GESTURES_INTERACTION_CLICK_VIEW(view,originalColor,targetColor)\
view.backgroundColor = targetColor;\
double delayInSeconds = 1;\
dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));\
dispatch_after(popTime, dispatch_get_main_queue(), ^(void){\
    view.backgroundColor = originalColor; });\

//***********线下关闭所有广告,录视频，慎用,慎用,慎用!!!***********//
#define AllADCloseed 0//线下关闭所有广告,录视频，慎用,慎用,慎用!!!
//***********线下关闭所有广告,录视频，慎用,慎用,慎用!!!***********//

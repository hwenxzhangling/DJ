//
//  WEFrameUtil.h
//  Weather
//
//  Created by wapushidai on 2018/11/16.
//  Copyright © 2018年 瓦普时代. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WEFrameUtil : NSObject
+(CGFloat)currentStateBarHeight;
+(CGFloat)currentNavBarHeight;
+(CGFloat)currentTabBarHeight;
+(BOOL)stateBarUpdate;
@end

NS_ASSUME_NONNULL_END

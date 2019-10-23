//
//  WEFrameUtil.m
//  Weather
//
//  Created by wapushidai on 2018/11/16.
//  Copyright © 2018年 瓦普时代. All rights reserved.
//

#import "WEFrameUtil.h"

@implementation WEFrameUtil
+(CGFloat)currentStateBarHeight;
{
   CGFloat height = [[UIApplication sharedApplication] statusBarFrame].size.height;
   return height;
}

+(BOOL)stateBarUpdate
{
    CGFloat currentStateBarHeight = [WEFrameUtil currentStateBarHeight];
    if(currentStateBarHeight == 40 ||
       currentStateBarHeight == 64)
    {
        return YES;
    }
    return NO;
}

+(CGFloat)currentNavBarHeight;
{
    CGFloat currentStateBarHeight = [WEFrameUtil currentStateBarHeight];
    if([WEFrameUtil stateBarUpdate])
    {
        currentStateBarHeight -= 20;
    }
    if(currentStateBarHeight == 0 || currentStateBarHeight == 24)
    {
         currentStateBarHeight+= 20;
    }
    return (currentStateBarHeight+44);
}

+(CGFloat)currentTabBarHeight;
{
    CGFloat currentStateBarHeight = [WEFrameUtil currentStateBarHeight];
    if([WEFrameUtil stateBarUpdate])
    {
        if(currentStateBarHeight == 40)
        {
            return 49.0f+20;
        }else
        {
            return 83.f+20;
        }
    }else
    {
        return  ([WEFrameUtil currentStateBarHeight] > 20.0 ? 83.0 : 49.0);
    }
}
@end

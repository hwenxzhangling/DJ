//
//  NSTimer+BlockTimer.m
//  Weather
//
//  Created by wapushidai on 2019/4/9.
//  Copyright © 2019年 瓦普时代. All rights reserved.
//

#import "NSTimer+BlockTimer.h"

@implementation NSTimer (BlockTimer)
+ (NSTimer*)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats blockTimer:(void (^)(NSTimer *))block{
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(timered:) userInfo:[block copy] repeats:repeats];
    return timer;
}

+ (void)timered:(NSTimer*)timer {
    void (^block)(NSTimer *timer)  = timer.userInfo;
    block(timer);
}
@end

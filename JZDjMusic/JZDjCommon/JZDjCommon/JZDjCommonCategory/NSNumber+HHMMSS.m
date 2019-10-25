//
//  NSNumber+HHMMSS.m
//  NewDays
//
//  Created by yanglin on 2018/2/27.
//  Copyright © 2018年 ccc. All rights reserved.
//

#import "NSNumber+HHMMSS.h"

@implementation NSNumber (HHMMSS)

/**
 根据秒数生成时分秒（xx:xx:xx）
 */
- (NSString *)hhmmss {
    NSInteger h, m, s;
    NSString *str;
    NSInteger totalTime = [self floatValue];
    if (totalTime < 60) {
        s = totalTime;
        str = [NSString stringWithFormat:@"%02ld", s];
    } else if (totalTime < 60 * 60) {
        m = totalTime / (60);
        s = totalTime - m * (60);
        str = [NSString stringWithFormat:@"%02ld:%02ld", m, s];
    } else {
        h = totalTime / (60 * 60);
        m = (totalTime - h * (60 * 60)) / (60);
        s = totalTime - h * (60 * 60) - m * (60);
        str = [NSString stringWithFormat:@"%02ld:%02ld:%02ld", h, m, s];
    }
    return str;
}

@end

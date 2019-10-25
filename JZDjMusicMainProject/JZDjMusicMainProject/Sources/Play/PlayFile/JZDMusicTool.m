//
//  JZDMusicTool.m
//  JZDjMusicMainProject
//
//  Created by kiwi on 2019/10/25.
//  Copyright © 2019 WX. All rights reserved.
//

#import "JZDMusicTool.h"
#define kDataPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"audio.json"]
@implementation JZDMusicTool
+ (instancetype)tool{
    static JZDMusicTool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[JZDMusicTool alloc]init];
    });
    return tool;
}

+ (void)saveMusicList:(NSArray *)musicList {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:musicList];
    [NSKeyedArchiver archiveRootObject:data toFile:kDataPath];
}

+ (NSString *)timeStrWithMsTime:(NSTimeInterval)msTime {
    return [self timeStrWithSecTime:msTime / 1000];
}

+ (NSString *)timeStrWithSecTime:(NSTimeInterval)secTime {
    NSInteger time = (NSInteger)secTime;
    
    if (time / 3600 > 0) { // 时分秒
        NSInteger hour   = time / 3600;
        NSInteger minute = (time % 3600) / 60;
        NSInteger second = (time % 3600) % 60;
        
        return [NSString stringWithFormat:@"%02zd:%02zd:%02zd", hour, minute, second];
    }else { // 分秒
        NSInteger minute = time / 60;
        NSInteger second = time % 60;
        
        return [NSString stringWithFormat:@"%02zd:%02zd", minute, second];
    }
}
@end

//
//  JZDMusicTool.h
//  JZDjMusicMainProject
//
//  Created by kiwi on 2019/10/25.
//  Copyright © 2019 WX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JZDMusicTool : NSObject
+ (instancetype)tool;

/**
 此方法用于保存当前正在播放的音乐列表

 @param musicList 当前正在播放的音乐列表
 */
+ (void)saveMusicList:(NSArray *)musicList;

/**
 此方法用于获取本地保存的播放器正在播放的音乐列表

 @return 音乐列表
 */
+ (NSArray *)musicList;

+ (NSString *)timeStrWithMsTime:(NSTimeInterval)msTime ;

+ (NSString *)timeStrWithSecTime:(NSTimeInterval)secTim ;
@end

NS_ASSUME_NONNULL_END

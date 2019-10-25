//
//  JZDjPlayController.h
//  JZDjMusicMainProject
//
//  Created by wapushidai on 2019/10/24.
//  Copyright © 2019 WX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
<<<<<<< HEAD
#import "JZDMusic.h"
#import "JZDMusicTool.h"
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,JZDLoopState){
    JZDSingleLoop = 0,//单曲循环
    JZDForeverLoop,   //重复循环
    JZDRandomLoop,    //随机播放
    JZDOnceLoop       //列表一次顺序播放
};
=======

NS_ASSUME_NONNULL_BEGIN
>>>>>>> e5ee1feca3be056b9d95d092b05bc1e86ab03cde

/// 播放器
@interface JZDjPlayController : WEBaseViewController

<<<<<<< HEAD
@property (nonatomic,assign)BOOL isPlaying;
/** 当前播放的音频的id */
@property (nonatomic, copy) NSString *currentPlayId;

+ (instancetype)share;

/// 音乐播放
/// @param music 模型
/// @param musicArr 音乐组
- (void)playMusicWithmodel:(JZDMusic *)music musicArr:(NSArray *)musicArr;

/// 音乐播放
/// @param index 第几首
/// @param musicArr 音乐组
- (void)playMusicWithIndex:(NSInteger)index musicArr:(NSArray *)musicArr;

//播放
-(void)playMusic;
//暂停
- (void)pauseMusic;
//停止
- (void)stopMusic;

=======
>>>>>>> e5ee1feca3be056b9d95d092b05bc1e86ab03cde
@end

NS_ASSUME_NONNULL_END

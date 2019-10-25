//
//  JZDjPlayController.m
//  JZDjMusicMainProject
//
//  Created by wapushidai on 2019/10/24.
//  Copyright © 2019 WX. All rights reserved.
//

#import "JZDjPlayController.h"
<<<<<<< HEAD
#import "GKAudioPlayer.h"
#import "GKWYMusicControlView.h"


@interface JZDjPlayController ()<GKAudioPlayerDelegate,GKWYMusicControlViewDelegate>
{
    NSMutableArray *_musicArr;
    JZDMusic       *_currentMusic;
    
}
@property (nonatomic, assign) float                 toSeekProgress; // seek进度
@property (nonatomic, assign) BOOL                  isInterrupt;    // 是否被打断
@property (nonatomic, assign) BOOL                  isAutoPlay;     // 是否自动播放，用于切换歌曲
@property (nonatomic, assign) BOOL                  isDraging;      // 是否正在拖拽进度条
@property (nonatomic, assign) BOOL                  isChanged;      // 是否正在切换歌曲，点击上一曲下一曲按钮
@property (nonatomic, assign) BOOL                  isCoverScroll;  // 是否转盘在滑动
@property (nonatomic, strong) CADisplayLink         *displayLink;   /** 定时器 */
@property (nonatomic, strong) NSTimer               *seekTimer;     // 快进、快退定时器

@property (nonatomic, assign) NSTimeInterval        duration;       // 总时间
@property (nonatomic, assign) NSTimeInterval        currentTime;    // 当前时间
@property (nonatomic, strong) GKWYMusicControlView  *controlView;
@property (strong, nonatomic) UIImageView *centerImageV;
=======

@interface JZDjPlayController ()
>>>>>>> e5ee1feca3be056b9d95d092b05bc1e86ab03cde

@end

@implementation JZDjPlayController

<<<<<<< HEAD
+ (instancetype)share{
    static dispatch_once_t onceToken;
    static JZDjPlayController *player = nil;
    dispatch_once(&onceToken, ^{
        player = [[JZDjPlayController alloc]init];
    });
    return player;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
     self.navView.title = @"播放器";
    [self.view addSubview:self.controlView];
    [self.view addSubview:self.centerImageV];

    [kNotificationCenter addObserver:self selector:@selector(statusChanged:) name:GKWYMUSIC_PLAYSTATECHANGENOTIFICATION object:nil];
    self.currentPlayId = _currentMusic.id;
    kPlayer.delegate = self;
}

- (void)playMusicWithIndex:(NSInteger)index musicArr:(NSArray *)musicArr{
    _currentMusic = musicArr[index];
    _musicArr = musicArr.mutableCopy;
    self.currentPlayId = _currentMusic.id;

    [self playMusic];
}

- (void)playMusicWithmodel:(JZDMusic *)music musicArr:(NSArray *)musicArr{
    _currentMusic = music;
    _musicArr = musicArr.mutableCopy;
    self.currentPlayId = _currentMusic.id;

    [self playMusic];
}

- (void)diskAnimation:(BOOL)animation {
    if (animation) {
        if (!self.displayLink) {
            // 创建定时器
            self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(diskAnimationBegin)];
            // 加入到主循环中
            [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        }
    }else{
        if (self.displayLink){
            [self.displayLink invalidate];
            self.displayLink = nil;
        }
    }
}
- (void)diskAnimationBegin{
    self.centerImageV.transform = CGAffineTransformRotate(self.centerImageV.transform, M_PI_4 / 100.0f);
}

#pragma mark -- audio play ----
- (void)playMusic {
    // 首先检查网络状态
//    Reachability *reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
//    int net = [reach currentReachabilityStatus];
//    if (net ==  NotReachable) {
//        [self.view makeNetToast:@"网络连接失败"];
//        // 设置播放状态为暂停
//        [self.controlView setupPauseBtn];
//        return;
//    }else {
        if (_currentMusic.mp4_url.length == 0) {
            [self.view makeToast:@"没有播放地址" andPostion:1];
            [self.controlView setupPauseBtn];
            return;
        }
        if (!kPlayer.playUrlStr) { // 没有播放地址
            // 需要重新请求
            [self getMusicInfo];
        }else {
            if (kPlayer.playerState == GKAudioPlayerStateStopped) {
                [kPlayer play];
            }else if (kPlayer.playerState == GKAudioPlayerStatePaused) {
                [kPlayer resume];
            }else {
                [kPlayer play];
            }
        }
//    }
}

/*
 获取歌曲详细信息
 */
- (void)getMusicInfo {
    self.toSeekProgress = 0;
    self.isPlaying = NO;
    [self stopMusic];

    [self.controlView initialData];
    [self.controlView showLoadingAnim];
    
//    Reachability *reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
//    int net = [reach currentReachabilityStatus];
//    if (net ==  NotReachable) {
//        [self.view makeNetToast:@"网络连接失败"];
//        return;
//    }
    // 总时间
    NSInteger duration = 0;
    self.controlView.totalTime = [JZDMusicTool timeStrWithSecTime:duration];

    if (self.toSeekProgress) {
        self.controlView.currentTime = [JZDMusicTool timeStrWithSecTime:duration * self.toSeekProgress];

        self.controlView.progress = self.toSeekProgress;
    }
    if (_currentMusic.mp4_url.length == 0) {
        [self.view makeToast:NSLocalizedString(@"没有播放地址", nil) andPostion:1];
        [self.controlView setupPauseBtn];
        return;
    }
    // 设置播放地址
    kPlayer.playUrlStr = _currentMusic.mp4_url;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [kPlayer play];
    });
}


//播放状态改变
- (void)statusChanged:(NSNotification *)notify {
    NSString *string = [notify object];
    NSLog(@"播放状态改变 = %@",string);
//    _playBtn.selected = string.boolValue;
}

- (void)playMusicList{
    if (_musicArr.count == 0) {
        [self.view makeToast:@"列表为空" andPostion:PositionCenter];
        return;
    }
//    XCReadPlayingListView *listView = [[XCReadPlayingListView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeigh-KSafeAreaHeight)];
//    listView.delegate = self;
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    [window addSubview:listView];
}

- (void)pauseMusic {
    [kPlayer pause];
}

- (void)stopMusic {
    [kPlayer stop];
}

- (void)playPrevMusic {
    // 播放
    __block NSUInteger currentIndex = 0;
    [_musicArr enumerateObjectsUsingBlock:^(JZDMusic *obj, NSUInteger idx, BOOL * _Nonnull stop) {
       if ([obj.id isEqualToString:_currentMusic.id]) {
           self.currentPlayId = obj.id;
            currentIndex = idx;
            *stop = YES;
        }
    }];
    [self playPrevMusicWithIndex:currentIndex];
}

- (void)playNextMusic {
    // 播放
    __block NSUInteger currentIndex = 0;
    [_musicArr enumerateObjectsUsingBlock:^(JZDMusic *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.id isEqualToString:_currentMusic.id]) {
            currentIndex = idx;
            self.currentPlayId = obj.id;
            *stop = YES;
        }
    }];

    [self playNextMusicWithIndex:currentIndex];
}

- (void)playPrevMusicWithIndex:(NSInteger)index {
    if (index > 0) {
        index --;
    }else if (index == 0) {
        index = _musicArr.count - 1;
    }
    // 重置封面
//    [self configUIWithModel:[GKWYMusicTool musicList][index]];
    // 切换到下一首
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playMusicWithIndex:index];
    });
}

- (void)playNextMusicWithIndex:(NSInteger)index {
    if (index < _musicArr.count - 1) {
        index ++;
    }else {
        index = 0;
    }
    // 重置封面
//    [self configUIWithModel:[GKWYMusicTool musicList][index]];
    // 切换到下一首
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playMusicWithIndex:index];
    });
}

- (void)playMusicWithIndex:(NSInteger)index {

    JZDMusic *model = _musicArr[index];
//    self.toSeekProgress = 0;
//    [self stopMusic];
    if (![model.id isEqualToString:self.currentPlayId]) {
        [kNotificationCenter postNotificationName:GKWYMUSIC_PLAYMUSICCHANGENOTIFICATION object:nil];

        self.currentPlayId = model.id;
        _currentMusic = model;
        
        [self getMusicInfo];
    }else {
        if (self.isPlaying) return;
        
        if (model) {
            _currentMusic = model;
            // 播放
            [self playMusic];
        }
    }
}

#pragma mark -- GKWYMusicControlViewDelegate ---

- (void)controlView:(GKWYMusicControlView *)controlView didClickList:(UIButton *)listBtn{
    [self playMusicList];
}

//上一曲
- (void)controlView:(GKWYMusicControlView *)controlView didClickPrev:(UIButton *)prevBtn{
    if (self.isCoverScroll) return;
    self.isChanged = YES;

    if (self.isPlaying) {
        [self stopMusic];
    }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self playPrevMusic];
        self.centerImageV.transform = CGAffineTransformIdentity;
    });
}

//播放
- (void)controlView:(GKWYMusicControlView *)controlView didClickPlay:(UIButton *)playBtn{
    if (self.isPlaying) {
        [self pauseMusic];
    }else {
        [self playMusic];
    }
}

//下一曲
- (void)controlView:(GKWYMusicControlView *)controlView didClickNext:(UIButton *)nextBtn{
    if (self.isCoverScroll) return;
    if (self.isPlaying) {
        [self stopMusic];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.isChanged  = YES;
        [self playNextMusic];
        self.centerImageV.transform = CGAffineTransformIdentity;
    });
}

// 滑杆滑动及点击
- (void)controlView:(GKWYMusicControlView *)controlView didSliderTouchBegan:(float)value{
    self.isDraging = YES;
}

- (void)controlView:(GKWYMusicControlView *)controlView didSliderTouchEnded:(float)value{
    self.isDraging = NO;
    
    if (self.isPlaying) {
        [kPlayer setPlayerProgress:value];
    }else {
        self.toSeekProgress = value;
    }
}

- (void)controlView:(GKWYMusicControlView *)controlView didSliderValueChange:(float)value{
    self.isDraging = YES;
    self.controlView.currentTime = [JZDMusicTool timeStrWithMsTime:(self.duration * value)];
}

- (void)controlView:(GKWYMusicControlView *)controlView didSliderTapped:(float)value{
    self.controlView.currentTime = [JZDMusicTool timeStrWithMsTime:(self.duration * value)];

    if (self.isPlaying) {
        [kPlayer setPlayerProgress:value];
    }else {
        self.toSeekProgress = value;
    }
}

#pragma mark --- 🐶🐶🐶 GKPlayerDelegate 🐶🐶🐶🐶 ---

// 播放状态改变
- (void)gkPlayer:(GKAudioPlayer *)player statusChanged:(GKAudioPlayerState)status {
    switch (status) {
        case GKAudioPlayerStateLoading:{    // 加载中
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.controlView showLoadingAnim];
                [self.controlView setupPauseBtn];
                [self diskAnimation:YES];
            });
            self.isPlaying = NO;
        }
            break;
        case GKAudioPlayerStateBuffering: { // 缓冲中
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.controlView hideLoadingAnim];
                [self.controlView setupPlayBtn];
                [self diskAnimation:YES];
            });
            
            self.isPlaying = YES;
        }
            break;
        case GKAudioPlayerStatePlaying: {   // 播放中
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.controlView hideLoadingAnim];
                [self.controlView setupPlayBtn];
                [self diskAnimation:YES];
            });
            
            if (self.toSeekProgress > 0) {
                [kPlayer setPlayerProgress:self.toSeekProgress];
                
                self.toSeekProgress = 0;
            }
            
            self.isPlaying = YES;
        }
            break;
        case GKAudioPlayerStatePaused:{     // 暂停
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.controlView hideLoadingAnim];
                [self.controlView setupPauseBtn];
                if (self.isChanged) {
                    self.isChanged = NO;
                }else {
                    [self diskAnimation:NO];
                }
            });
            self.isPlaying = NO;
        }
            break;
        case GKAudioPlayerStateStoppedBy:{  // 主动停止
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.controlView hideLoadingAnim];
                [self.controlView setupPauseBtn];
                
                if (self.isChanged) {
                    self.isChanged = NO;
                }else {
                    NSLog(@"播放停止后暂停动画");
                    [self diskAnimation:NO];
                }
            });
            self.isPlaying = NO;
        }
            break;
        case GKAudioPlayerStateStopped:{    // 打断停止
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.controlView hideLoadingAnim];
                [self.controlView setupPauseBtn];
                [self diskAnimation:NO];

                [self pauseMusic];
            });
            self.isPlaying = NO;
        }
            break;
        case GKAudioPlayerStateEnded: {     // 播放结束
            NSLog(@"播放结束了");
            if (self.isPlaying) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.controlView hideLoadingAnim];
                    [self.controlView setupPauseBtn];
                    [self diskAnimation:NO];
                    self.controlView.currentTime = self.controlView.totalTime;
                });
                
                self.isPlaying = NO;
                
                // 播放结束，自动播放下一首
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    self.isAutoPlay = YES;
                    [self playNextMusic];
                });
            }else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.controlView hideLoadingAnim];
                    [self.controlView setupPauseBtn];
                    [self diskAnimation:NO];
                });
                
                self.isPlaying = NO;
            }
        }
            break;
        case GKAudioPlayerStateError: {     // 播放出错
            NSLog(@"播放出错了");
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.controlView hideLoadingAnim];
                [self.controlView setupPauseBtn];
                [self diskAnimation:NO];
            });
            self.isPlaying = NO;
        }
            break;
        default:
            break;
    }
    
//    [kNotificationCenter postNotificationName:GKWYMUSIC_PLAYSTATECHANGENOTIFICATION object:nil];
}

// 播放进度改变
- (void)gkPlayer:(GKAudioPlayer *)player currentTime:(NSTimeInterval)currentTime totalTime:(NSTimeInterval)totalTime progress:(float)progress {
    
    // 记录播放id和进度
    NSDictionary *dic = @{@"play_id": self.currentPlayId, @"play_progress": @(progress)};
    [kUserDefaults setObject:dic forKey:GKWYMUSIC_USERDEFAULTSKEY_PLAYINFO];
    
    if (self.isDraging) return;
//    if (self.isSeeking) return;

    if (self.toSeekProgress > 0) {
        progress = self.toSeekProgress;
    }
    self.controlView.currentTime = [JZDMusicTool timeStrWithMsTime:currentTime];
    self.controlView.progress    = progress;
}

// 播放总时间
- (void)gkPlayer:(GKAudioPlayer *)player totalTime:(NSTimeInterval)totalTime {
    self.controlView.totalTime = [JZDMusicTool timeStrWithMsTime:totalTime];
    
    self.duration               = totalTime;
}

// 缓冲进度改变
- (void)gkPlayer:(GKAudioPlayer *)player bufferProgress:(float)bufferProgress {
    self.controlView.bufferProgress = bufferProgress;
}




#pragma mark -- setter & getter ---

- (GKWYMusicControlView *)controlView{
    if (!_controlView) {
        _controlView = [[GKWYMusicControlView alloc]init];
        _controlView.frame = CGRectMake(0, MAIN_HEIGHT-TAB_BAR_HEIGHT-90-40, 375, 90);
//        [_controlView initialData];
        _controlView.delegate = self;
    }
    return _controlView;
}

- (UIImageView *)centerImageV{
    if (!_centerImageV) {
        _centerImageV = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.centerX-125, self.view.centerY-150, 250, 250)];
        _centerImageV.contentMode = UIViewContentModeScaleAspectFill;
        _centerImageV.image = IMG(@"dzq");
        _centerImageV.layer.cornerRadius = 125.0;
        _centerImageV.clipsToBounds = YES;
        
    }
    return _centerImageV;
}
=======
- (void)viewDidLoad {
    [super viewDidLoad];
     self.navView.title = @"播放器";
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
>>>>>>> e5ee1feca3be056b9d95d092b05bc1e86ab03cde

@end

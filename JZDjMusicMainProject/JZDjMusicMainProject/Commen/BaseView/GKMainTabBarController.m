//
//  ViewController.m
//  GKTabBar
//
//  Created by QuintGao on 2017/12/26.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKMainTabBarController.h"
#import "GKTestViewController.h"
#import "GKTabBar.h"
#import "GKPlayerButton.h"
#import "WEBaseNavController.h"
#import "JZDjDanceViewController.h"
#import "JZDjSelectViewController.h"
#import "JZDjFrendsViewController.h"
#import "JZDjAccountController.h"
#import "JZDjPlayController.h"

@interface GKMainTabBarController ()

@property (nonatomic, assign) BOOL isRotation;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) CGFloat progress;

@end

@implementation GKMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [kNotificationCenter addObserver:self selector:@selector(statusChanged:) name:GKWYMUSIC_PLAYSTATECHANGENOTIFICATION object:nil];
    // 添加子控制器
    [self addChildVCs];
    
     //替换系统tabbar为自定义tabbar
    [self setValue:[GKTabBar new] forKey:@"tabBar"];
    
    [[GKPlayerButton sharedInstance] setNoHistoryData];
    [[GKPlayerButton sharedInstance] setImageUrl:nil];

    [GKPlayerButton sharedInstance].btnClickBlock = ^{
        if (self.isRotation) {
            [self pause];
            self.isRotation = NO;
        }else {
            [self play];
            self.isRotation = YES;
        }
    };
}

//播放状态改变
- (void)statusChanged:(NSNotification *)notify {
    NSString *string = [notify object];
    self.isRotation = string.boolValue;
}

- (void)play {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    
    JZDjPlayController *playVC = [[JZDjPlayController alloc] init];
    //playVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:playVC animated:YES completion:^{
        
    }];
}

- (void)pause {
    [self.timer invalidate];
    self.timer = nil;
    
    [[GKPlayerButton sharedInstance] setProgress:self.progress animated:NO];
}

- (void)timerAction {
    self.progress += 0.01;
    
    if (self.progress >= 1.0) {
        [self.timer invalidate];
        self.timer = nil;
        [[GKPlayerButton sharedInstance] setProgress:self.progress animated:NO];;
    }else {
        [[GKPlayerButton sharedInstance] setProgress:self.progress animated:YES];
    }
}

/**
 添加子控制器
 */
- (void)addChildVCs {
    // 首页
    [self addChildVC:[JZDjSelectViewController new] title:@"精选" imageName:@"tabbar_rootvc"];
    
    // 相对论
    [self addChildVC:[JZDjDanceViewController new] title:@"舞曲" imageName:@"tabbar_relativity"];
    
    // 订阅听
<<<<<<< HEAD
    [self addChildVC:[JZDjFrendsViewController new] title:@"嗨圈" imageName:@"tabbar_rss"];
=======
    [self addChildVC:[JZDjFrendsViewController new] title:@"朋友圈" imageName:@"tabbar_rss"];
>>>>>>> e5ee1feca3be056b9d95d092b05bc1e86ab03cde
    
    // 我的
    [self addChildVC:[JZDjAccountController new] title:@"我的" imageName:@"tabbar_membercenter"];
}

/**
 添加一个子控制器
 
 @param childVC 子控制器
 @param title tabbar标题
 @param imageName tabbar图片名称
 */
- (void)addChildVC:(UIViewController *)childVC title:(NSString *)title imageName:(NSString *)imageName {
    
    NSString *normalImage = [imageName stringByAppendingString:@"_normal"];
    NSString *selectedImage = [imageName stringByAppendingString:@"_selected"];
    
    childVC.title = title;
    childVC.tabBarItem.image = [UIImage imageNamed:normalImage];
    childVC.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor grayColor]} forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateSelected];
    
    WEBaseNavController *navVC = [[WEBaseNavController alloc] initWithRootViewController:childVC];
    
    [self addChildViewController:navVC];
}


@end

//
//  WFBaseViewController.m
//  FreeWiFi
//
//  Created by yanglin on 2016/11/25.
//  Copyright © 2016年 com.chuangxin. All rights reserved.
//

#import "WEBaseViewController.h"

@interface WEBaseViewController ()
@end

@implementation WEBaseViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self base_setupViews];
}

- (void)base_setupViews{
    __weak __typeof(self) ws = self;
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navView = [[WEBaseNavView alloc] initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, TOP_HEIGHT)];
    self.navView.title = self.title;
    self.navView.clickLeftBlock = ^{
        [ws clickLeft];
    };
    self.navView.clickRightBlock = ^{
        [ws clickRight];
    };
    [self.view addSubview:self.navView];
}

#pragma mark - Subclass Override
- (void)clickLeft{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickRight{
    
}

- (void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)dealloc
{
    
}

@end

//
//  WFBaseNavController.m
//  FreeWiFi
//
//  Created by yanglin on 2016/11/23.
//  Copyright © 2016年 com.chuangxin. All rights reserved.
//

#import "WEBaseNavController.h"

@interface WEBaseNavController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation WEBaseNavController

// 让子控制器负责状态栏风格
- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.hidden = YES;
    
//    [[UINavigationBar appearance] setShadowImage:[UIImage new]];//隐藏阴影
//    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];//字体颜色
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:FONTBOLD(18)}];//标题文字属性
//    [[UINavigationBar appearance] setTranslucent:NO];
//    
//    [UINavigationBar appearance].barTintColor = [UIColor blueColor];
//    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
}


#pragma mark - UINavigationControllerDelegate
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:nil style:UIBarButtonItemStylePlain target:self action:@selector(popViewControllerAnimated:)];
        //leftItem.imageInsets = UIEdgeInsetsMake(0, -15, 0, 0);
        viewController.navigationItem.leftBarButtonItem = leftItem;
    }
    [super pushViewController:viewController animated:animated];
}



@end

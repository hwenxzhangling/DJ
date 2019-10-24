//
//  WFBaseViewController.h
//  FreeWiFi
//
//  Created by yanglin on 2016/11/25.
//  Copyright © 2016年 com.chuangxin. All rights reserved.
//  父类控制器，带导航栏

#import <UIKit/UIKit.h>
#import "WEBaseNavView.h"

@interface WEBaseViewController : UIViewController
@property (nonatomic, strong) WEBaseNavView *navView;
- (void)clickLeft;
- (void)clickRight;
@end

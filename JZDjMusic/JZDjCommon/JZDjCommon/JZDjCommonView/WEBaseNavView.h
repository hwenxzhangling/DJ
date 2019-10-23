//
//  WEBaseNavView.h
//  Weather
//
//  Created by yanglin on 2017/7/10.
//  Copyright © 2017年 瓦普时代. All rights reserved.
//

#import "WEBaseView.h"

@interface WEBaseNavView : WEBaseView
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *leftImg;
@property (nonatomic, copy) NSString *rightImg;
@property (nonatomic, copy) NSString *rightTitle;
@property (nonatomic, strong) UIColor *textColor;   // 文字颜色
@property (nonatomic, strong) UIColor *lineColor;   // 底线颜色
@property (nonatomic, strong) UIColor *styleColor;  // 文字和图片颜色
@property (nonatomic, assign) BOOL titleHidden;
@property (nonatomic, assign) BOOL leftHidden;
@property (nonatomic, assign) BOOL rightHidden;

@property (nonatomic, copy) void (^clickLeftBlock)();
@property (nonatomic, copy) void (^clickRightBlock)();


@end

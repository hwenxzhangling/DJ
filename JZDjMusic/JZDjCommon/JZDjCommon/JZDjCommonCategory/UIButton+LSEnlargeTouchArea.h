//
//  UIButton+LSEnlargeTouchArea.h
//  UIButton-EnlargeTouchArea
//
//  Created by 李帅 on 16/3/4.
//  Copyright © 2016年 company. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, MKButtonEdgeInsetsStyle) {
    MKButtonEdgeInsetsStyleTop, // image在上，label在下
    MKButtonEdgeInsetsStyleLeft, // image在左，label在右
    MKButtonEdgeInsetsStyleBottom, // image在下，label在上
    MKButtonEdgeInsetsStyleRight // image在右，label在左
};
@interface UIButton (LSEnlargeTouchArea)
/**
 *  扩充按钮的可点击区域
 *
 *  @param top    在button的frame的基础上往上扩充的距离
 *  @param right  在button的frame的基础上往右扩充的距离
 *  @param bottom 在button的frame的基础上往下扩充的距离
 *  @param left   在button的frame的基础上往左扩充的距离
 */
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;

//图片和字的位置
- (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;
@end

//
//  UIView+Animate.m
//  Weather
//
//  Created by yanglin on 2017/7/25.
//  Copyright © 2017年 瓦普时代. All rights reserved.
//

#import "UIView+Animate.h"

@implementation UIView (Animate)

- (void)fade{
    CATransition *transition = [CATransition animation];
    transition.duration = 1.5f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.layer addAnimation:transition forKey:nil];
}

@end

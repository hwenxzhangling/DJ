//
//  WEBaseCell.h
//  Weather
//
//  Created by yanglin on 2017/7/10.
//  Copyright © 2017年 瓦普时代. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WEBaseCell : UITableViewCell

@property (nonatomic, strong) id model;

+ (CGFloat)cellHeightWithModel:(id)model;

@end

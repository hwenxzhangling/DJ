//
//  WEBaseCell.m
//  Weather
//
//  Created by yanglin on 2017/7/10.
//  Copyright © 2017年 瓦普时代. All rights reserved.
//

#import "WEBaseCell.h"

@implementation WEBaseCell


#pragma mark - LifeCycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self base_setupViews];
    }
    return self;
}


#pragma mark - Public

+ (CGFloat)cellHeightWithModel:(id)model{
    return 0.001;
}


#pragma mark - Private

- (void)base_setupViews{
    self.selectionStyle = UITableViewCellSelectionStyleNone;

}


@end

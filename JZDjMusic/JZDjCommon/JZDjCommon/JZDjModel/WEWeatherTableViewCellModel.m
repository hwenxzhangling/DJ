//
//  WEWeatherTableViewCellModel.m
//  Weather
//
//  Created by yanglin on 2017/7/10.
//  Copyright © 2017年 瓦普时代. All rights reserved.
//

#import "WEWeatherTableViewCellModel.h"

@implementation WEWeatherTableViewCellModel

- (NSString *)reuseIdentifier{
    _reuseIdentifier = NSStringFromClass(_cellClass);
    return _reuseIdentifier;
}

@end

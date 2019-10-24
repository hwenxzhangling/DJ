//
//  WEWeatherTableViewCellModel.h
//  Weather
//
//  Created by yanglin on 2017/7/10.
//  Copyright © 2017年 瓦普时代. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WEWeatherTableViewCellModel : NSObject<NSCoding>
@property (nonatomic, strong) id model;
@property (nonatomic, strong) Class cellClass;
@property (nonatomic, copy) NSString *reuseIdentifier;
@property (nonatomic, assign) NSIndexPath *indexPath;
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, strong) NSString *cellIdentifier;

@end

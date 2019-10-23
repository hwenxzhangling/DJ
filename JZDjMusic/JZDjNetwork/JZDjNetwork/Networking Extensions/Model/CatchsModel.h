//
//  CatchsModel.h
//  AFLib
//
//  Created by hewenxue on 2017/7/3.
//  Copyright © 2017年 ccc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JFBaseModel.h"

@interface CatchsModel : JFBaseModel

@property (nonatomic,copy)NSString *ret;	//字符串	200成功/400失败s
@property (nonatomic,copy)NSString *msg;	//字符串	原因

@end

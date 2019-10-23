//
//  AFNetworkMessageModel.m
//  AFLib
//
//  Created by hewenxue on 2017/7/3.
//  Copyright © 2017年 ccc. All rights reserved.
//

#import "AFNetworkMessageModel.h"

@implementation AFNetworkMessageModel

- (instancetype)initWithAFNetworkMessageModelCode:(NSInteger)code
                                          message:(NSString *)message;
{
    self = [super init];
    if(self)
    {
        self.code = code;
        self.message = message;
    }
    return self;
}

@end

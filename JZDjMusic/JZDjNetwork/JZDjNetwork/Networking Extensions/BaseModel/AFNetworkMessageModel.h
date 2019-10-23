//
//  AFNetworkMessageModel.h
//  AFLib
//
//  Created by hewenxue on 2017/7/3.
//  Copyright © 2017年 ccc. All rights reserved.
//

#import <Foundation/Foundation.h>


#define KCodeSuccess 200 //200成功  400失败

@interface AFNetworkMessageModel : NSObject

@property (nonatomic,assign)NSInteger   code;       //网络返回请求编码
@property (nonatomic,assign)NSString   *message;    //网络返回请求的消息


/**
 请求返回消息类
 
 @param code 网络返回请求编码
 @param message 网络返回请求的消息
 @return AFNetworkMessageModel
 */
- (instancetype)initWithAFNetworkMessageModelCode:(NSInteger)code
                                          message:(NSString *)message;

@end

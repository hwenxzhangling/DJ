//
//  AFModelEntityManger.h
//  5yDJ
//
//  Created by hewenxue on 2017/6/30.
//  Copyright © 2017年 wapushidai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFAppDotnetApiManager.h"
#import "AFModel_h.h"

#define DATASTRUCTUREMUTATION @"数据结构突变"
/**
 网络请求后返回实体模型管理器
 */
@interface AFModelEntityManger : NSObject

/**

 @return AFModelEntityManger
 */
+(AFModelEntityManger *)ShareEntityManger;

/**
 处理成功消息
 
 @param responseObject responseObject
 @return AFNetworkMessageModel
 */
+(AFNetworkMessageModel *)getAFSuccessResponseObject:(id)responseObject;


/**
 处理失败消息
 
 @param error 失败消息元数据
 @param failure 失败详细消息
 */
+ (void)getAFfailureError:(NSError *)error
                  failure:(void(^)(AFNetworkMessageModel *model))failure;
@end

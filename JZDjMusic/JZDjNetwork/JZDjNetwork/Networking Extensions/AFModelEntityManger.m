//
//  AFModelEntityManger.m
//  5yDJ
//
//  Created by hewenxue on 2017/6/30.
//  Copyright © 2017年 wapushidai. All rights reserved.
//

#import "AFModelEntityManger.h"

@implementation AFModelEntityManger
    
/**
 
 @return AFModelEntityManger
 */
+(AFModelEntityManger *)ShareEntityManger;
{
    static AFModelEntityManger *_manger;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manger = [AFModelEntityManger allocWithZone:NULL];
    });
    return _manger;
}


/**
 处理成功消息

 @param responseObject responseObject
 @return AFNetworkMessageModel
 */
+(AFNetworkMessageModel *)getAFSuccessResponseObject:(id)responseObject
{
    if([responseObject isKindOfClass:[NSDictionary class]])
    {
        NSInteger  code = 303;
        NSString  *msg = DATASTRUCTUREMUTATION;
        if([[responseObject allKeys] containsObject:KRequestSuccessRetKey])
        {
             code = [responseObject[KRequestSuccessRetKey] integerValue];
        }
        if([[responseObject allKeys] containsObject:KRequestSuccessMsgKey])
        {
            msg = responseObject[KRequestSuccessMsgKey];
        }
        AFNetworkMessageModel *msgModel = [[AFNetworkMessageModel alloc] initWithAFNetworkMessageModelCode:code message:msg];
        return msgModel;
    }else
    {
        NSInteger  code = 303;
        NSString  *msg = DATASTRUCTUREMUTATION;
        AFNetworkMessageModel *msgModel = [[AFNetworkMessageModel alloc] initWithAFNetworkMessageModelCode:code message:msg];
        return msgModel;
    }
}

/**
 处理失败消息
 
 @param error 失败消息元数据
 @param failure 失败详细消息
 */
+ (void)getAFfailureError:(NSError *)error
                  failure:(void(^)(AFNetworkMessageModel *model))failure;
{
    NSInteger  code = error.code;
    NSString  *msg = [error description];
    AFNetworkMessageModel *errorModel = [[AFNetworkMessageModel alloc] initWithAFNetworkMessageModelCode:code message:msg];
    if(failure)
    {
        failure(errorModel);
    }
}
    
@end

//
//  AFModelEntityManger+User.m
//  AFLib
//
//  Created by hewenxue on 2017/7/3.
//  Copyright © 2017年 ccc. All rights reserved.
//

#import "AFModelEntityManger+User.h"

@implementation AFModelEntityManger (User)
/**
 发送验证码
 
 @param phone 手机号码
 @param success success
 @param failure failure
 */
+(void)CaseGetSendMarkPhone:(NSString *)phone  success:(void(^)(id result /*按自己需求返回自己目标类型*/,AFNetworkMessageModel *model))success
                failure:(void(^)(AFNetworkMessageModel *model))failure;
{
    NSMutableDictionary *parameter = [NSMutableDictionary new];
    [parameter setValue:phone forKey:@"phone"];
    [parameter setValue:@"User.SendMark" forKey:@"service"];
    [[AFAppDotnetApiManager shareAFAppDotnetApiManager] GETEncryptionParameters:parameter progress:^(NSProgress * _Nullable downloadProgress)
     {
         
     } success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject)
     {
         if(success)
         {
             success(responseObject,[self getAFSuccessResponseObject:responseObject]);
         }
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         [self getAFfailureError:error failure:failure];
     }];
}

/**
 POST发送验证码
 
 @param phone 手机号码
 @param success success
 @param failure failure
 */
+(void)CasePOSTSendMarkPhone:(NSString *)phone  success:(void(^)(id result /*按自己需求返回自己目标类型*/,AFNetworkMessageModel *model))success
                 failure:(void(^)(AFNetworkMessageModel *model))failure;
{
    NSMutableDictionary *parameter = [NSMutableDictionary new];
    [parameter setValue:phone forKey:@"phone"];
    [parameter setValue:@"User.SendMark" forKey:@"service"];
    [[AFAppDotnetApiManager shareAFAppDotnetApiManager] POSTEncryptionParameters:parameter progress:^(NSProgress * _Nullable uploadProgress)
    {
        
    } success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject)
    {
        if(success)
        {
            success(responseObject,[self getAFSuccessResponseObject:responseObject]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error)
    {
        [self getAFfailureError:error failure:failure];
    }];
}
@end

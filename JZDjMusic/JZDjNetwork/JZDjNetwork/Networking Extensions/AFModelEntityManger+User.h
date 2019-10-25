//
//  AFModelEntityManger+User.h
//  AFLib
//
//  Created by hewenxue on 2017/7/3.
//  Copyright © 2017年 ccc. All rights reserved.
//

#import "AFModelEntityManger.h"

@interface AFModelEntityManger (User)

/**
 GET发送验证码
 
 @param phone 手机号码
 @param success success
 @param failure failure
 */
+(void)CaseGetSendMarkPhone:(NSString *)phone  success:(void(^)(id result /*按自己需求返回自己目标类型*/,AFNetworkMessageModel *model))success
                failure:(void(^)(AFNetworkMessageModel *model))failure;

/**
 POST发送验证码
 
 @param phone 手机号码
 @param success success
 @param failure failure
 */
+(void)CasePOSTSendMarkPhone:(NSString *)phone  success:(void(^)(id result /*按自己需求返回自己目标类型*/,AFNetworkMessageModel *model))success
                failure:(void(^)(AFNetworkMessageModel *model))failure;

@end

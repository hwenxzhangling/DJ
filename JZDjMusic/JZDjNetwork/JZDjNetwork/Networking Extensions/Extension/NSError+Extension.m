//
//  NSError+Extension.m
//  AFLib
//
//  Created by hewenxue on 2017/7/3.
//  Copyright © 2017年 ccc. All rights reserved.
//

#import "NSError+Extension.h"

@implementation NSError (Extension)

/**
 NSError
 
 @param code 编码
 @param additionalcode 额外返回的消息
 @param msg 消息
 @return NSError
 */
+(NSError *)initWithErrorCoustomCode:(AFERRORCoustomCode)code
                      additionalcode:(NSInteger)additionalcode
                   additionalmessage:(NSString *)msg;
{
    NSError *error ;
    if(code == AFERRORCoustomCode_1000007)
    {
        NSDictionary *userInfo;
        if(msg)
        {
            userInfo = @{msg:NSLocalizedDescriptionKey};
        }
        error = [[NSError alloc] initWithDomain:CustomErrorDomain code:additionalcode userInfo:userInfo];
    }else
    {
        NSDictionary *userInfo = @{@"不确定错误类型":NSLocalizedDescriptionKey};
        switch (code) {
            case AFERRORCoustomCode_1000000:
                userInfo = @{@"参数不是NSDictionary类型":NSLocalizedDescriptionKey};
                break;
            case AFERRORCoustomCode_1000001:
                userInfo = @{@"请求返回不是NSDictionary类型":NSLocalizedDescriptionKey};
                break;
            case AFERRORCoustomCode_1000002:
                userInfo = @{@"请求返回NSDictionary是为空":NSLocalizedDescriptionKey};
                break;
            case AFERRORCoustomCode_1000003:
                userInfo = @{@"请求返回NSDictionary不包含resut和T参数":NSLocalizedDescriptionKey};
                break;
            case AFERRORCoustomCode_1000004:
                userInfo = @{@"请求返回参数解密失败":NSLocalizedDescriptionKey};
                break;
            case AFERRORCoustomCode_1000005:
                userInfo = @{@"请求返回参数解密后解析失败":NSLocalizedDescriptionKey};
                break;
            case AFERRORCoustomCode_1000006:
                userInfo = @{@"不确定错误类型":NSLocalizedDescriptionKey};
                break;
                
            default:
                break;
        }
        error = [[NSError alloc] initWithDomain:CustomErrorDomain code:code userInfo:userInfo];
    }
    return error;
}
@end

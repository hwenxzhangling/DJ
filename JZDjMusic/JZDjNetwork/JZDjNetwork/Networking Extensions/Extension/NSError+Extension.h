//
//  NSError+Extension.h
//  AFLib
//
//  Created by hewenxue on 2017/7/3.
//  Copyright © 2017年 ccc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CustomErrorDomain @"AFNetworkCustomError"

typedef NS_ENUM(NSInteger,AFERRORCoustomCode)
{
    AFERRORCoustomCode_1000000 = 1000000, //参数不是NSDictionary类型
    AFERRORCoustomCode_1000001 = 1000001, //请求返回不是NSDictionary类型
    AFERRORCoustomCode_1000002 = 1000002, //请求返回NSDictionary是为空
    AFERRORCoustomCode_1000003 = 1000003, //请求返回NSDictionary不包含resut和T参数
    AFERRORCoustomCode_1000004 = 1000004, //请求返回参数解密失败
    AFERRORCoustomCode_1000005 = 1000005, //请求返回参数解密后解析失败
    AFERRORCoustomCode_1000006 = 1000006, //不确定
    AFERRORCoustomCode_1000007 = 1000007, //请求成功返回的code
    AFERRORCoustomCode_1000008 = 1000008, //请求成功后结构问题出错
};

@interface NSError (Extension)


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

@end

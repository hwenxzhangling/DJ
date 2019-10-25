//
//  AFCXMXEncrypteTool.h
//  CXMXUserService
//
//  Created by wpsd on 2017/3/10.
//  Copyright © 2017年 Yao Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFCXMXEncrypteTool : NSObject

/**
 参数MD5加密，加密后的存入字段的s字段中
 
 @param parameter 需要加密的字典
 @param saltStr 签名的内置Key，如：cxmxanzhuo, cxmxxiaohua
 @param secretStr 加密标识，如：anzhuo, 672tg
 @return 加密后的字典
 */
+ (NSMutableDictionary *)parameterEncrypteWithParam:(NSMutableDictionary *)parameter saltStr:(NSString *)saltStr secretStr:(NSString *)secretStr;


/**
 AES128加密（ECB 128位 PKCS7Padding补码 结果16进制输出）
 
 @param dict 原始数据
 @param timeStamp 时间戳
 @param saltStr 签名字符串 为nil 默认 @"@#-*￥cxmx^&+#@*"
 @return 加密后的16位字符串
 */
+ (NSString *)aes128_encryptH16WithDict:(NSDictionary *)dict timeStamp:(NSString *)timeStamp saltStr:(NSString *)saltStr;

/**
 *  解密（ECB 128位 PKCS7Padding补码 16进制编码输出）
 *  @param timeStamp 时间戳
 *  @param saltStr 签名字符串 为nil 默认 @"@#-*￥cxmx^&+#@*"
 *  @return 解密后的字符串
 */
+ (NSString *)aes128_decryptH16WithEnStr:(NSString *)enStr timeStamp:(NSString *)timeStamp saltStr:(NSString *)saltStr;

/**
 MD5加密
 
 @param str 原始字符串
 @return 加密后的字符串
 */
+ (NSString *)MD5ENCodeFOR32WithString:(NSString *)str;

@end

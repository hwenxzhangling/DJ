//
//  AFCXMXEncrypteTool.m
//  CXMXUserService
//
//  Created by wpsd on 2017/3/10.
//  Copyright © 2017年 Yao Yang. All rights reserved.
//

#import "AFCXMXEncrypteTool.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation AFCXMXEncrypteTool

#pragma mark - MD5加密

/**
 参数MD5加密
 
 @param parameter 需要加密的字典
 @param saltStr 签名的内置Key，如：cxmxanzhuo, cxmxxiaohua
 @param secretStr 加密标识，如：anzhuo, 672tg
 @return 加密后的字典
 */
+ (NSMutableDictionary *)parameterEncrypteWithParam:(NSMutableDictionary *)parameter saltStr:(NSString *)saltStr secretStr:(NSString *)secretStr {
    if ([parameter isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:parameter];
        dict =  [self signatureParameters:dict secretStr:saltStr];
        [dict setValue:secretStr forKey:@"secret"];
        return dict;
    }else if ([parameter isKindOfClass:[NSMutableDictionary class]]) {
        parameter =  [self signatureParameters:parameter secretStr:saltStr];
        [parameter setValue:secretStr forKey:@"secret"];
        return parameter;
    }else {
        return [NSMutableDictionary dictionary];
    }
}


/*!
 *   @brief 参数MD5加密
 *
 *   @param dict 原参数
 *
 *   @return 加密后参数
 */
+ (NSMutableDictionary *)signatureParameters:(NSDictionary *)dict secretStr:(NSString *)str {
    NSMutableDictionary *parameterDict =[NSMutableDictionary dictionaryWithDictionary:dict];
    
    NSString *parameterString = [self parameterString:dict];
    
    NSString *result = [self MD5ENCodeFOR32WithString:[NSString stringWithFormat:@"%@%@",parameterString,str]];
    [parameterDict setObject:result forKey:@"s"];
    
    return parameterDict;
}


/**
 参数排序
 
 @param dict 原始字典
 @return 排序后的所有值
 */
+ (NSString *) parameterString:(NSDictionary *)dict {
    NSMutableDictionary* params = [NSMutableDictionary dictionaryWithDictionary:dict];
    // Convert keys to lowercase strings
    
    NSMutableDictionary* lowerCaseParams = [NSMutableDictionary dictionaryWithCapacity:[params count]];
    [params enumerateKeysAndObjectsUsingBlock:^(NSString* key, NSString* obj, BOOL *stop)
     {
         [lowerCaseParams setObject:obj forKey:[key lowercaseString]];
     }];
    
    NSArray* sortedKeys = [[lowerCaseParams allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    NSMutableArray* encodedParamerers = [NSMutableArray array];
    
    NSMutableArray *valueArray = [NSMutableArray array];
    [sortedKeys enumerateObjectsUsingBlock:^(NSString* key, NSUInteger idx, BOOL *stop)
     {
         [encodedParamerers addObject:[self encodeParamWithoutEscapingUsingKey:key
                                                                      andValue:[lowerCaseParams objectForKey:key]]];
         [valueArray addObject:[lowerCaseParams objectForKey:key]];
     }];
    
    return [valueArray componentsJoinedByString:@""];
}

+ (NSString *) encodeParamWithoutEscapingUsingKey:(NSString*)key andValue:(id<NSObject>)value {
    if ([value isKindOfClass:[NSArray class]])
    {
        NSArray* array = (NSArray*) value;
        NSMutableArray* encodedArray = [NSMutableArray array];
        [array enumerateObjectsUsingBlock:^(id<NSObject> obj, NSUInteger idx, BOOL *stop)
         {
             [encodedArray addObject:[NSString stringWithFormat:@"%@[]=%@", key, obj]];
         }];
        return [encodedArray componentsJoinedByString:@"&"];
    } else
    {
        return [NSString stringWithFormat:@"%@=%@", key, value];
    }
}

#pragma mark - AES128加密

/**
 AES128加密需要上传的数据
 
 @param dict 原始数据
 @param timeStamp 时间戳
 @param saltStr 签名字符串
 @return 加密后的字符串(全部为大写)
 */
+ (NSString *)aes128_encryptH16WithDict:(NSDictionary *)dict timeStamp:(NSString *)timeStamp saltStr:(NSString *)saltStr {
    
    NSString *md5Str = [self MD5ENCodeFOR32WithString:[NSString stringWithFormat:@"%@%@", timeStamp, saltStr?saltStr:@"@#-*￥cxmx^&+#@*"]];
    
    if ([NSJSONSerialization isValidJSONObject:dict]) {
        NSError *error = nil;
        NSData *matData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
        if (error) {
            NSLog(@"%@", error);
            return @"";
        }
        NSString *encryptionStr = [[self aes128_encryptWithData:matData key:md5Str] uppercaseString];
        return encryptionStr;
    }
    
    return nil;
}

/**
 MD5加密
 
 @param str 原始字符串
 @return 加密后的字符串
 */
+ (NSString *)MD5ENCodeFOR32WithString:(NSString *)str {
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (int)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

/**
 *  加密（ECB 128位 PKCS7Padding补码 结果16进制输出）
 *  @param key    秘钥
 *  @return 加密后的字符串
 */
+ (NSString *)aes128_encryptWithData:(NSData *)data key:(NSString *)key { //加密
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          [data bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *result = [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        // 输出格式根据服务端要求（16进制编码）
        
        // 16进制输出
        if (result && result.length > 0) {
            Byte *datas = (Byte*)[result bytes];
            NSMutableString *output = [NSMutableString stringWithCapacity:result.length * 2];
            for(int i = 0; i < result.length; i++){
                [output appendFormat:@"%02x", datas[i]];
            }
            return output;
        }
        return nil;
    }
    free(buffer);
    return nil;
}

#pragma mark - AES28解密

/**
 *  解密（ECB 128位 PKCS7Padding补码 16进制编码输出）
 *  @param timeStamp 时间戳
 *  @param saltStr 签名字符串
 *  @return 解密后的字符串
 */
+ (NSString *)aes128_decryptH16WithEnStr:(NSString *)enStr timeStamp:(NSString *)timeStamp saltStr:(NSString *)saltStr {
    
    NSString *md5Str = [self MD5ENCodeFOR32WithString:[NSString stringWithFormat:@"%@%@", timeStamp, saltStr?saltStr:@"@#-*￥cxmx^&+#@*"]];
    
    // 根据加密的编码方式
    // 16进制
    NSMutableData *data = [NSMutableData dataWithCapacity:enStr.length/2];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i;
    for (i=0; i < [enStr length] / 2; i++) {
        byte_chars[0] = [enStr characterAtIndex:i*2];
        byte_chars[1] = [enStr characterAtIndex:i*2+1];
        whole_byte = strtol(byte_chars, NULL, 16);
        [data appendBytes:&whole_byte length:1];
    }
    
    NSData *decodeData = data;
    
    //对数据进行解密
    NSData *result = nil;
    
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    [md5Str getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [decodeData length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          [decodeData bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        result = [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    
    if (result && result.length > 0) {
        return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    }
    free(buffer);
    return nil;
}

@end

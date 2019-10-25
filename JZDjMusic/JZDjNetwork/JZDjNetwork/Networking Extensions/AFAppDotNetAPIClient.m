// AFAppDotNetAPIClient.h
//
// Copyright (c) 2011–2016 Alamofire Software Foundation ( http://alamofire.org/ )
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "AFAppDotNetAPIClient.h"
//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)

@implementation AFAppDotNetAPIClient
+ (instancetype)sharedClient
{
    static AFAppDotNetAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFAppDotNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:@""]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        //_sharedClient.responseSerializer = [AFHTTPResponseSerializer serializer]; //(返回数据流，在解析)
        _sharedClient.requestSerializer.timeoutInterval = 20;
        
        //        //设置Https 证书源文件
        //        NSString    *cerPath  = [[NSBundle mainBundle] pathForResource:@"" ofType:@"cer"];
        //        NSData      *certData = [NSData dataWithContentsOfFile:cerPath];
        //        NSSet       *certSet  = [[NSSet alloc] initWithObjects:certData, nil];
        //        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
        //        [securityPolicy setAllowInvalidCertificates:YES];
        //        [securityPolicy setPinnedCertificates:certSet];
    });
    return _sharedClient;
}
/**
 
 urlObjectIndex
 @param urlObjectIndex initWithUrlObjectIndex default 0
 @return AFAppDotNetAPIClient
 */
+ (AFAppDotNetAPIClient *)initWithUrlObjectIndex:(NSInteger)urlObjectIndex;
{
    AFAppDotNetAPIClient *manager= [[AFAppDotNetAPIClient alloc] init];
    if(manager)
    {
        manager.urlObjectIndex = urlObjectIndex;
    }
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.urlObjectIndex = 0;
    }
    return self;
}

- (void)GETParameters:(id)parameters
             progress:(nullable void (^)(NSProgress * _Nullable downloadProgress))customdownloadProgress
              success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))customsuccess
              failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))customfailure;
{
    //#Mark:    打印原始请求的参数
    if(KNSLogParametersAndURL)
    {
        NSLog(@" request GET parameters:%@",parameters);
    }
    [[AFAppDotNetAPIClient sharedClient] GET:[KAPIs objectAtIndex:self.urlObjectIndex] parameters:parameters
                                    progress:^(NSProgress * _Nonnull downloadProgress)
     {
         if(customdownloadProgress)
         {
             customdownloadProgress(downloadProgress);
         }
         
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         //#Mark:    打印原始数据，以及url
         if(KNSLogParametersAndURL)
         {
             NSLog(@"success request GET URL:%@  request response Message:%@",task.currentRequest,responseObject);
         }
         
         if(customsuccess)
         {
             customsuccess(task,responseObject);
         }
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         //#Mark:    打印原始数据，以及url
         if(KNSLogParametersAndURL)
         {
             NSLog(@"failure request GET URL:%@  request response Message:%@",task.currentRequest,error);
         }
         
         if(customfailure)
         {
             customfailure(task,error);
         }
     }];
}

- (void)POSTParameters:(id)parameters
constructingBodyWithBlock:(nullable void (^)(id <AFMultipartFormData> formData))block
              progress:(nullable void (^)(NSProgress * _Nullable uploadProgress))customuploadProgress
               success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))customsuccess
               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))customfailure;
{
    //#Mark:    打印原始请求的参数
    if(KNSLogParametersAndURL)
    {
        NSLog(@" request POST parameters:%@",parameters);
    }
    
    [[AFAppDotNetAPIClient sharedClient] POST:[KAPIs objectAtIndex:self.urlObjectIndex] parameters:parameters constructingBodyWithBlock:block progress:^(NSProgress * _Nonnull uploadProgress)
     {
         if(customuploadProgress)
         {
             customuploadProgress(uploadProgress);
         }
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         //#Mark:    打印原始数据，以及url
         if(KNSLogParametersAndURL)
         {
             NSLog(@"success request POST URL:%@  request response Message:%@",task.currentRequest,responseObject);
         }
         
         if(customsuccess)
         {
             customsuccess(task,responseObject);
         }
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         //#Mark:    打印原始数据，以及url
         if(KNSLogParametersAndURL)
         {
             NSLog(@"failure request POST URL:%@  request response Message:%@",task.currentRequest,error);
         }
         
         if(customfailure)
         {
             customfailure(task,error);
         }
     }];
}

- (void)POSTParameters:(id)parameters
              progress:(nullable void (^)(NSProgress * _Nullable uploadProgress))customuploadProgress
               success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))customsuccess
               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))customfailure;
{
    //#Mark:    打印原始请求的参数
    if(KNSLogParametersAndURL)
    {
        NSLog(@" request POST parameters:%@",parameters);
    }
    
    [[AFAppDotNetAPIClient sharedClient] POST:[KAPIs objectAtIndex:self.urlObjectIndex] parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress)
     {
         if(customuploadProgress)
         {
             customuploadProgress(uploadProgress);
         }
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         //#Mark:    打印原始数据，以及url
         if(KNSLogParametersAndURL)
         {
             NSLog(@"success request POST URL:%@  request response Message:%@",task.currentRequest,responseObject);
         }
         
         if(customsuccess)
         {
             customsuccess(task,responseObject);
         }
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         //#Mark:    打印原始数据，以及url
         if(KNSLogParametersAndURL)
         {
             NSLog(@"failure request POST URL:%@  request response Message:%@",task.currentRequest,error);
         }
         
         if(customfailure)
         {
             customfailure(task,error);
         }
     }];
}

/**
 #Mark:   GET签名网络请求
 
 @param signature bool 是否需要签名网络请求
 @param parameters 参数
 @param downloadProgress downloadProgress
 @param success success
 @param failure failure
 */
- (void)GETSignatureBool:(BOOL)signature
              parameters:(nullable id)parameters
                progress:(nullable void (^)(NSProgress * _Nullable downloadProgress))downloadProgress
                 success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                 failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;
{
    if([parameters isKindOfClass:[NSDictionary class]] ||
       [parameters isKindOfClass:[NSMutableDictionary class]])
    {
        parameters = [self addAdditionalParameters:parameters];
        if(signature)
        {
            NSString *t = [self getCurrentTimeStamp];
            [parameters setValue:t forKey:@"t"];
            [parameters setValue:K_Pid forKey:@"pid"];
            parameters = [AFCXMXEncrypteTool parameterEncrypteWithParam:parameters saltStr:K_s_SaltStr secretStr:K_s_SecretStr];
        }
        [self GETParameters:parameters progress:downloadProgress success:success failure:failure];
    }else
    {
        
        if(failure)
        {
            failure(nil,[NSError initWithErrorCoustomCode:AFERRORCoustomCode_1000000 additionalcode:0 additionalmessage:nil]);
        }
    }
}

/**
 #Mark: GET data+T加密网络请求
 
 @param encryption bool 是否需要data+T加密网络请求
 @param parameters 参数
 @param downloadProgress  downloadProgress
 @param success success
 @param failure failure
 */
- (void)GETEncryptionBool:(BOOL)encryption
               parameters:(nullable id)parameters
                 progress:(nullable void (^)(NSProgress * _Nullable downloadProgress))downloadProgress
                  success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                  failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;
{
    
    if([parameters isKindOfClass:[NSDictionary class]] ||
       [parameters isKindOfClass:[NSMutableDictionary class]])
    {
        parameters = [self addAdditionalParameters:parameters];
        if(encryption)
        {
            //#Mark: 得到加密后数据
            NSString *t = [self getCurrentTimeStamp];
            [parameters setValue:t forKey:@"t"];
            [parameters setValue:K_Pid forKey:@"pid"];
            parameters = [self getEncryptionParameters:parameters];
        }
        
        [self GETParameters:parameters progress:^(NSProgress * _Nonnull customdownloadProgress)
         {
             if(downloadProgress)
             {
                 downloadProgress(customdownloadProgress);
             }
         } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject)
         {
             if(!encryption || !K_is_decryption)
             {
                 if(success)
                 {
                     success(task,responseObject);
                 }
             }else
             {
                 [self getDecryption:responseObject task:task success:success failure:failure];
             }
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
         {
             if(failure)
             {
                 failure(task,error);
             }
         }];
    }else
    {
        failure(nil,[NSError initWithErrorCoustomCode:AFERRORCoustomCode_1000000 additionalcode:0 additionalmessage:nil]);
    }
    
}

/**
 #Mark: POST签名网络请求
 
 @param signature bool 是否需要签名网络请求
 @param parameters 参数
 @param uploadProgress downloadProgress
 @param success success
 @param failure failure
 */
- (void)POSTSignatureBool:(BOOL)signature
               parameters:(nullable id)parameters
                 progress:(nullable void (^)(NSProgress * _Nullable uploadProgress))uploadProgress
                  success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                  failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;
{
    if([parameters isKindOfClass:[NSDictionary class]] ||
       [parameters isKindOfClass:[NSMutableDictionary class]])
    {
        parameters = [self addAdditionalParameters:parameters];
        if(signature)
        {
            NSString *t = [self getCurrentTimeStamp];
            [parameters setValue:t forKey:@"t"];
            [parameters setValue:K_Pid forKey:@"pid"];
            parameters = [AFCXMXEncrypteTool parameterEncrypteWithParam:parameters saltStr:K_s_SaltStr secretStr:K_s_SecretStr];
        }
        [self POSTParameters:parameters progress:uploadProgress success:success failure:failure];
    }else
    {
        if(failure)
        {
            failure(nil,[NSError initWithErrorCoustomCode:AFERRORCoustomCode_1000000 additionalcode:0 additionalmessage:nil]);
        }
    }
}
/**
 #Mark: POST签名网络请求
 
 @param signature bool 是否需要签名网络请求
 @param parameters 参数
 @param uploadProgress downloadProgress
 @param success success
 @param failure failure
 */
- (void)POSTSignatureBool:(BOOL)signature
               parameters:(nullable id)parameters
 constructingBodyWithBlock:(nullable void (^)(id <AFMultipartFormData> formData))block
                 progress:(nullable void (^)(NSProgress * _Nullable uploadProgress))uploadProgress
                  success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                  failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;
{
    if([parameters isKindOfClass:[NSDictionary class]] ||
       [parameters isKindOfClass:[NSMutableDictionary class]])
    {
        parameters = [self addAdditionalParameters:parameters];
        if(signature)
        {
            NSString *t = [self getCurrentTimeStamp];
            [parameters setValue:t forKey:@"t"];
            [parameters setValue:K_Pid forKey:@"pid"];
            parameters = [AFCXMXEncrypteTool parameterEncrypteWithParam:parameters saltStr:K_s_SaltStr secretStr:K_s_SecretStr];
        }
        [self POSTParameters:parameters constructingBodyWithBlock:block progress:uploadProgress success:success failure:failure];
    }else
    {
        if(failure)
        {
            failure(nil,[NSError initWithErrorCoustomCode:AFERRORCoustomCode_1000000 additionalcode:0 additionalmessage:nil]);
        }
    }
}
/**
 #Mark:  POST data+T加密网络请求
 
 @param encryption bool 是否需要data+T加密网络请求
 @param parameters 参数
 @param uploadProgress downloadProgress
 @param success success
 @param failure failure
 */
- (void)POSTEncryptionBool:(BOOL)encryption
                parameters:(nullable id)parameters
                  progress:(nullable void (^)(NSProgress * _Nullable uploadProgress))uploadProgress
                   success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                   failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;
{
    
    if([parameters isKindOfClass:[NSDictionary class]] ||
       [parameters isKindOfClass:[NSMutableDictionary class]])
    {
        parameters = [self addAdditionalParameters:parameters];
        if(encryption)
        {
            //#Mark: 得到加密后数据
            NSString *t = [self getCurrentTimeStamp];
            [parameters setValue:t forKey:@"t"];
            [parameters setValue:K_Pid forKey:@"pid"];
            parameters = [self getEncryptionParameters:parameters];
        }
        
        [self POSTParameters:parameters progress:^(NSProgress * _Nonnull customdownloadProgress)
         {
             uploadProgress(customdownloadProgress);
         } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject)
         {
             
             if(!encryption || !K_is_decryption)
             {
                 if(success)
                 {
                     success(task,responseObject);
                 }
             }else
             {
                 [self getDecryption:responseObject task:task success:success failure:failure];
             }
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
         {
             if(failure)
             {
                 failure(task,error);
             }
             
         }];
    }else
    {
        if(failure)
        {
            failure(nil,[NSError initWithErrorCoustomCode:AFERRORCoustomCode_1000000 additionalcode:0 additionalmessage:nil]);
        }
    }
    
}

/**
 #Mark: POST data+T加密网络请求
 
 
 @param encryption bool 是否需要data+T加密网络请求
 @param parameters parameters
 @param block 参数
 @param uploadProgress uploadProgress
 @param success success
 @param failure failure
 */
- (void)POSTEncryptionBool:(BOOL)encryption
                parameters:(nullable id)parameters
 constructingBodyWithBlock:(nullable void (^)(id <AFMultipartFormData> formData))block
                  progress:(nullable void (^)(NSProgress * _Nullable uploadProgress))uploadProgress
                   success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                   failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;
{
    
    
    if(parameters != nil)
    {
        if([parameters isKindOfClass:[NSDictionary class]] ||
           [parameters isKindOfClass:[NSMutableDictionary class]])
        {
            parameters = [self addAdditionalParameters:parameters];
            if(encryption)
            {
                //#Mark: 得到加密后数据
                parameters = [self getEncryptionParameters:parameters];
            }
            
            //#Mark:    打印原始请求的参数
            if(KNSLogParametersAndURL)
            {
                NSLog(@" request POST parameters:%@",parameters);
            }
        }else
        {
            if(failure)
            {
                failure(nil,[NSError initWithErrorCoustomCode:AFERRORCoustomCode_1000000 additionalcode:0 additionalmessage:nil]);
            }
        }
    }
    [[AFAppDotNetAPIClient sharedClient] POST:[KAPIs objectAtIndex:self.urlObjectIndex] parameters:parameters constructingBodyWithBlock:block progress:uploadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         if(!encryption || !K_is_decryption)
         {
             if(success)
             {
                 success(task,responseObject);
             }
         }else
         {
             [self getDecryption:responseObject task:task success:success failure:failure];
         }
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         if(failure)
         {
             failure(task,error);
         }
         
     }];
}

/**
 参数进行解密
 
 @param responseObject 原始参数
 @param task 原始task
 @param success 返回成功信息
 @param failure 返回失败信息
 */
-(void)getDecryption:(id)responseObject
                task:(NSURLSessionDataTask *)task
             success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
             failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;
{
    
    if([responseObject isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *dict = (NSDictionary *)responseObject;
        if (!kDictIsEmpty(dict))
        {
            if ([dict.allKeys containsObject:@"result"] && [dict.allKeys containsObject:@"T"]) {
                NSString *deStr = [AFCXMXEncrypteTool aes128_decryptH16WithEnStr:dict[@"result"] timeStamp:dict[@"T"] saltStr:K_d_SaltStr];
                if (!deStr)
                {
                    NSLog(@"解密失败!");
                    failure(task,[NSError initWithErrorCoustomCode:AFERRORCoustomCode_1000004 additionalcode:0 additionalmessage:nil]);
                }
                else
                {
                    NSError *deSerialError = nil;
                    NSDictionary *deDict = [NSJSONSerialization JSONObjectWithData:[deStr dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments error:&deSerialError];
                    
                    if (deSerialError)
                    {
                        NSLog(@"deSerialError: %@", deSerialError);
                        failure(task,[NSError initWithErrorCoustomCode:AFERRORCoustomCode_1000007 additionalcode:0 additionalmessage:nil]);
                        
                    }else
                    {
                        if (success)
                        {
                            //#Mark:    打印原始请求的参数
                            if(KNSLogParametersAndURL)
                            {
                                NSLog(@"解密后元数据 deDict:%@",deDict);
                            }
                            success(task,deDict);
                        }
                    }
                }
            }else
            {
                if(failure)
                {
                    failure(task,[NSError initWithErrorCoustomCode:AFERRORCoustomCode_1000007 additionalcode: [responseObject[KRequestSuccessRetKey] integerValue] additionalmessage:responseObject[KRequestSuccessMsgKey]]);
                }
            }
        }else
        {
            if(failure)
            {
                failure(task,[NSError initWithErrorCoustomCode:AFERRORCoustomCode_1000007 additionalcode: [responseObject[KRequestSuccessRetKey] integerValue] additionalmessage:responseObject[KRequestSuccessMsgKey]]);
            }
        }
        
    }else if([responseObject isKindOfClass:[NSData class]])
    {
        NSDictionary *deDict = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:NULL];
        
        if ([deDict.allKeys containsObject:@"result"] && [deDict.allKeys containsObject:@"T"]) {
            NSString *deStr = [AFCXMXEncrypteTool aes128_decryptH16WithEnStr:deDict[@"result"] timeStamp:deDict[@"T"] saltStr:K_d_SaltStr];
            if (!deStr)
            {
                NSLog(@"解密失败!");
                failure(task,[NSError initWithErrorCoustomCode:AFERRORCoustomCode_1000004 additionalcode:0 additionalmessage:nil]);
            }
            else
            {
                NSError *deSerialError = nil;
                NSDictionary *deDict = [NSJSONSerialization JSONObjectWithData:[deStr dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments error:&deSerialError];
                
                if (deSerialError)
                {
                    NSLog(@"deSerialError: %@", deSerialError);
                    failure(task,[NSError initWithErrorCoustomCode:AFERRORCoustomCode_1000007 additionalcode:0 additionalmessage:nil]);
                    
                }else
                {
                    if (success)
                    {
                        //#Mark:    打印原始请求的参数
                        if(KNSLogParametersAndURL)
                        {
                            NSLog(@"解密后元数据deDict:%@",deDict);
                        }
                        success(task,deDict);
                    }
                }
            }
        }else
        {
            if(failure)
            {
                failure(task,[NSError initWithErrorCoustomCode:AFERRORCoustomCode_1000007 additionalcode:0 additionalmessage:@"请求出错"]);
            }
        }
    }
    else
    {
        if(failure)
        {
            failure(task,[NSError initWithErrorCoustomCode:AFERRORCoustomCode_1000001 additionalcode: [responseObject[KRequestSuccessRetKey] integerValue]additionalmessage:responseObject[KRequestSuccessMsgKey]]);
        }
    }
}

/**
 参数进行加密
 
 @param parameters 原参数
 @return NSMutableDictionary 加密后的参数
 */
-(NSMutableDictionary *)getEncryptionParameters:(NSMutableDictionary *)parameters
{
    //先签名
    parameters = [AFCXMXEncrypteTool parameterEncrypteWithParam:parameters saltStr:K_s_SaltStr secretStr:K_s_SecretStr];
    
    //后加密
    NSString *timeStamp = [self getCurrentTimeStamp];
    NSString *data = [AFCXMXEncrypteTool aes128_encryptH16WithDict:parameters timeStamp:timeStamp saltStr:K_d_SaltStr];
    
    //重构参数
    NSMutableDictionary *encryptDict = [NSMutableDictionary new];
    [encryptDict setValue:data forKey:@"data"];
    [encryptDict setValue:timeStamp forKey:@"T"];
    [encryptDict setValue:parameters[@"service"] forKey:@"service"];
    
    
    return encryptDict;
}


/**
 添加额外参数
 
 @param parameters 添加额外参数
 */
- (NSMutableDictionary *)addAdditionalParameters:(id)parameters
{
    if([parameters isKindOfClass:[NSMutableDictionary class]])
    {
        parameters = [NSMutableDictionary dictionaryWithDictionary:parameters];
    }
    [parameters setValue:K_Api_version forKey:K_Api_versionKey];
    [parameters setValue:K_App_version forKey:K_App_versionKey];
    [parameters setValue:K_Model_Type forKey:K_Model_Key];
    
    return parameters;
}

/**
 获取当前时间戳
 
 @return NSString
 */
-(NSString *)getCurrentTimeStamp
{
    NSString *timeStamp = [NSString stringWithFormat:@"%ld",(long)[[NSDate date] timeIntervalSince1970]];
    return timeStamp;
}

@end


//
//  AFAppDotnetApiManager.m
//  AFLib
//
//  Created by hewenxue on K_HUDShowTime017/7/3.
//  Copyright © K_HUDShowTime017年 ccc. All rights reserved.
//

#import "AFAppDotnetApiManager.h"
//活动指示器显示
#if DEBUG
#define K_HUDShowTime 0.3
#else
#define K_HUDShowTime 1
#endif

#define NoERRORMessage @"似乎已断开与互联网的连接"
#define NoERRORMessageSpecification @"网络连接出错,请稍后重试"

@implementation AFAppDotnetApiManager
/**
 
 urlObjectIndex
 @param urlObjectIndex initWithUrlObjectIndex default 0
 @return AFAppDotnetApiManager
 */
+ (AFAppDotnetApiManager *)initWithUrlObjectIndex:(NSInteger)urlObjectIndex;
{
    AFAppDotnetApiManager *manager= [[AFAppDotnetApiManager alloc] init];
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

/**
 @return AFAppDotnetApiManager
 */
+(AFAppDotnetApiManager *)shareAFAppDotnetApiManager;
{
    static AFAppDotnetApiManager *_manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [AFAppDotnetApiManager allocWithZone:NULL];
    });
    _manager.urlObjectIndex = 0;//默认为0
    return _manager;
}
/**
 #Mark: 签名
 @param parameters 参数
 @param downloadProgress downloadProgress
 @param success success
 @param cfailure failure
 */
- (void)GETSignatureParameters:(nullable id)parameters
             progress:(nullable void (^)(NSProgress * _Nullable downloadProgress))downloadProgress
              success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
              failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))cfailure;
{
    AFAppDotNetAPIClient *client = [AFAppDotNetAPIClient initWithUrlObjectIndex:self.urlObjectIndex];
    [client GETSignatureBool:K_is_signature parameters:parameters progress:downloadProgress success:success failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error)
     {
         cfailure(task,error);
#if TAGGET_WEATHER
        #if DEBUG
                 [SVProgressHUD showErrorWithStatus:[error description]];
        #else
         //[SVProgressHUD showErrorWithStatus:[error localizedDescription]];
         [SVProgressHUD showErrorWithStatus:NoERRORMessageSpecification];
        #endif
                 [SVProgressHUD dismissWithDelay:K_HUDShowTime];
#else
         NSLog(@"widget networking");
#endif
     }];
}
/**
 #Mark: 签名
 @param parameters 参数
 @param uploadProgress downloadProgress
 @param success success
 @param cfailure failure
 */
- (void)POSTSignatureParameters:(nullable id)parameters
              progress:(nullable void (^)(NSProgress * _Nullable uploadProgress))uploadProgress
               success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))cfailure;
{
    AFAppDotNetAPIClient *client = [AFAppDotNetAPIClient initWithUrlObjectIndex:self.urlObjectIndex];
    [client POSTSignatureBool:K_is_signature parameters:parameters progress:uploadProgress success:success failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error)
     {
         cfailure(task,error);
         
#if TAGGET_WEATHER
        #if DEBUG
                 [SVProgressHUD showErrorWithStatus:[error description]];
        #else
         //[SVProgressHUD showErrorWithStatus:[error localizedDescription]];
         [SVProgressHUD showErrorWithStatus:NoERRORMessageSpecification];
        #endif
                 [SVProgressHUD dismissWithDelay:K_HUDShowTime];
#else
         NSLog(@"widget networking");
#endif
     }];
}
/**
 #Mark: 签名
 @param parameters 参数
 @param uploadProgress downloadProgress
 @param success success
 @param cfailure failure
 */
- (void)POSTSignatureParameters:(nullable id)parameters
      constructingBodyWithBlock:(nullable void (^)(id <AFMultipartFormData> formData))block
                       progress:(nullable void (^)(NSProgress * _Nullable uploadProgress))uploadProgress
                        success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                        failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))cfailure;
{
    AFAppDotNetAPIClient *client = [AFAppDotNetAPIClient initWithUrlObjectIndex:self.urlObjectIndex];
    [client POSTSignatureBool:K_is_signature parameters:parameters constructingBodyWithBlock:block progress:uploadProgress success:success failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error)
     {
         cfailure(task,error);
         
#if TAGGET_WEATHER
#if DEBUG
         [SVProgressHUD showErrorWithStatus:[error description]];
#else
         //[SVProgressHUD showErrorWithStatus:[error localizedDescription]];
         [SVProgressHUD showErrorWithStatus:NoERRORMessageSpecification];
#endif
         [SVProgressHUD dismissWithDelay:K_HUDShowTime];
#else
         NSLog(@"widget networking");
#endif
     }];
}
/**
 #Mark: 加密
 @param parameters 参数
 @param cdownloadProgress downloadProgress
 @param csuccess success
 @param cfailure failure
 */
- (void)GETEncryptionParameters:(nullable id)parameters
             progress:(nullable void (^)(NSProgress * _Nullable downloadProgress))cdownloadProgress
              success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))csuccess
              failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))cfailure;
{
    AFAppDotNetAPIClient *client = [AFAppDotNetAPIClient initWithUrlObjectIndex:self.urlObjectIndex];
    [client GETEncryptionBool:K_is_encryption parameters:parameters progress:cdownloadProgress success:csuccess failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error)
     {
         cfailure(task,error);
#if TAGGET_WEATHER
        #if DEBUG
                 [SVProgressHUD showErrorWithStatus:[error description]];
        #else
         //[SVProgressHUD showErrorWithStatus:[error localizedDescription]];
         [SVProgressHUD showErrorWithStatus:NoERRORMessageSpecification];
        #endif
                 [SVProgressHUD dismissWithDelay:K_HUDShowTime];
#else
         NSLog(@"widget networking");
#endif
     }];
}

/**
 #Mark: 加密
 @param parameters 参数
 @param cuploadProgress downloadProgress
 @param csuccess success
 @param cfailure failure
 */
- (void)POSTEncryptionParameters:(nullable id)parameters
              progress:(nullable void (^)(NSProgress * _Nullable uploadProgress))cuploadProgress
               success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))csuccess
               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))cfailure;
{
    AFAppDotNetAPIClient *client = [AFAppDotNetAPIClient initWithUrlObjectIndex:self.urlObjectIndex];
    [client POSTEncryptionBool:K_is_encryption parameters:parameters progress:cuploadProgress success:csuccess failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error)
     {
         cfailure(task,error);
#if TAGGET_WEATHER
        #if DEBUG
                 [SVProgressHUD showErrorWithStatus:[error description]];
        #else
         //[SVProgressHUD showErrorWithStatus:[error localizedDescription]];
         [SVProgressHUD showErrorWithStatus:NoERRORMessageSpecification];
        #endif
                 [SVProgressHUD dismissWithDelay:K_HUDShowTime];
#else
         NSLog(@"widget networking");
#endif
     }];
}

/**
 #Mark: 加密
 @param parameters parameters
 @param block 参数
 @param uploadProgress uploadProgress
 @param success success
 @param cfailure failure
 */
- (void)POSTEncryptionParameters:(nullable id)parameters
       constructingBodyWithBlock:(nullable void (^)(id <AFMultipartFormData> formData))block
                        progress:(nullable void (^)(NSProgress * _Nullable uploadProgress))uploadProgress
                         success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                         failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))cfailure;
{
    AFAppDotNetAPIClient *client = [AFAppDotNetAPIClient initWithUrlObjectIndex:self.urlObjectIndex];
    [client POSTEncryptionBool:K_is_encryption parameters:parameters constructingBodyWithBlock:block progress:uploadProgress success:success failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error)
    {
        cfailure(task,error);
#if TAGGET_WEATHER
        #if DEBUG
                [SVProgressHUD showErrorWithStatus:[error description]];
        #else
                //[SVProgressHUD showErrorWithStatus:[error localizedDescription]];
                [SVProgressHUD showErrorWithStatus:NoERRORMessageSpecification];
        #endif
                [SVProgressHUD dismissWithDelay:K_HUDShowTime];
#else
        NSLog(@"widget networking");
#endif
    }];
}

@end

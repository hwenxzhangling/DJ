//
//  AFAppDotnetApiManager.h
//  AFLib
//
//  Created by hewenxue on 2017/7/3.
//  Copyright © 2017年 ccc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFAppDotNetAPIClient.h"

#if TAGGET_WEATHER
        #if __has_include(<SVProgressHUD/SVProgressHUD.h>)
        #import <SVProgressHUD/SVProgressHUD.h>
        #else
        #import "SVProgressHUD.h"
        #endif
#else

#endif

@interface AFAppDotnetApiManager : NSObject
/**
 请求的url 索引 默认0
 */
@property (nonatomic,assign)NSInteger urlObjectIndex;
    
/**
 @return AFAppDotnetApiManager
 */
+(AFAppDotnetApiManager *_Nullable)shareAFAppDotnetApiManager;
/**
 
 urlObjectIndex
 @param urlObjectIndex initWithUrlObjectIndex
 @return AFAppDotnetApiManager
 */
+ (AFAppDotnetApiManager *)initWithUrlObjectIndex:(NSInteger)urlObjectIndex;
/**
 #Mark: 签名
 @param parameters 参数
 @param downloadProgress downloadProgress
 @param success success
 @param failure failure
 */
- (void)GETSignatureParameters:(nullable id)parameters
                progress:(nullable void (^)(NSProgress * _Nullable downloadProgress))downloadProgress
                 success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                 failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;

/**
 #Mark: 签名
 @param parameters 参数
 @param uploadProgress downloadProgress
 @param success success
 @param failure failure
 */
- (void)POSTSignatureParameters:(nullable id)parameters
                 progress:(nullable void (^)(NSProgress * _Nullable uploadProgress))uploadProgress
                  success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                  failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;
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

/**
  #Mark: 加密
 @param parameters 参数
 @param downloadProgress downloadProgress
 @param success success
 @param failure failure
 */
- (void)GETEncryptionParameters:(nullable id)parameters
                progress:(nullable void (^)(NSProgress * _Nullable downloadProgress))downloadProgress
                 success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                 failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;

/**
  #Mark: 加密
 @param parameters 参数
 @param uploadProgress downloadProgress
 @param success success
 @param failure failure
 */
- (void)POSTEncryptionParameters:(nullable id)parameters
                  progress:(nullable void (^)(NSProgress * _Nullable uploadProgress))uploadProgress
                   success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                   failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;

/**
  #Mark: 加密
 @param parameters parameters
 @param block 参数
 @param uploadProgress uploadProgress
 @param success success
 @param failure failure
 */
- (void)POSTEncryptionParameters:(nullable id)parameters
 constructingBodyWithBlock:(nullable void (^)(id <AFMultipartFormData> formData))block
                  progress:(nullable void (^)(NSProgress * _Nullable uploadProgress))uploadProgress
                   success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                   failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;
@end

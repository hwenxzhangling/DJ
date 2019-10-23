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

#import <Foundation/Foundation.h>
#import "AFConfiguration.h"

@interface AFAppDotNetAPIClient : AFHTTPSessionManager
    
/**
 请求的url 索引 默认0
 */
@property (nonatomic,assign)NSInteger urlObjectIndex;
    
/**
 实例化单列类

 @return AFAppDotNetAPIClient
 */
+ (AFAppDotNetAPIClient *_Nonnull)sharedClient;
    
/**
 
 urlObjectIndex
 @param urlObjectIndex initWithUrlObjectIndex
 @return AFAppDotnetApiManager
 */
+ (AFAppDotNetAPIClient *)initWithUrlObjectIndex:(NSInteger)urlObjectIndex;
/**
 #Mark: GET签名网络请求

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

/**
 #Mark: POST data+T加密网络请求

 @param encryption bool 是否需要data+T加密网络请求
 @param parameters 参数
 @param uploadProgress uploadProgress
 @param success success
 @param failure failure
 */
- (void)POSTEncryptionBool:(BOOL)encryption
                parameters:(nullable id)parameters
                  progress:(nullable void (^)(NSProgress * _Nullable uploadProgress))uploadProgress
                   success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                   failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;


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

@end

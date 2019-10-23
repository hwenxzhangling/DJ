//
//  AFHTTPSessionManager+ItunesStore.h
//  JZDjUserNetwork
//
//  Created by wapushidai on 2019/10/23.
//  Copyright © 2019 WX. All rights reserved.
//



#import <AFNetworking/AFNetworking.h>

//版本信息
static NSString * const  KItunesStoreAPPVersionURL = @"http://itunes.apple.com/lookup?id=990500440";
NS_ASSUME_NONNULL_BEGIN

@interface AFHTTPSessionManager (ItunesStore)
/**
 获取AppStore的版本

 @param success 成功
 @param failure 失败
 */
+(void)getVersionInfoWithUrlSuccess:(void(^)(NSString *version))success
                            failure:(void(^)(NSError *error))failure;
@end

NS_ASSUME_NONNULL_END

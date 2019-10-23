//
//  AFHTTPSessionManager+ItunesStore.m
//  JZDjUserNetwork
//
//  Created by wapushidai on 2019/10/23.
//  Copyright © 2019 WX. All rights reserved.
//

#import "AFHTTPSessionManager+ItunesStore.h"


@implementation AFHTTPSessionManager (ItunesStore)
/**
 获取AppStore的版本

 @param success 成功
 @param failure 失败
 */
+(void)getVersionInfoWithUrlSuccess:(void(^)(NSString *version))success
                            failure:(void(^)(NSError *error))failure
{
    [[AFHTTPSessionManager manager] GET:KItunesStoreAPPVersionURL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress)
     {
     } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
         if ([[responseObject valueForKey:@"results"] isKindOfClass:[NSArray class]])
         {
             NSArray *arr = [responseObject valueForKey:@"results"];
             NSDictionary *dic = [arr firstObject];
             if([dic valueForKey:@"version"])
             {
                 if(success)
                 {
                      success([dic valueForKey:@"version"]);
                 }
             }else
             {
                 if(failure)
                 {
                     failure(nil);
                 }
             }
         }
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         if(failure)
         {
             failure(error);
         }
     }];
    
}
@end

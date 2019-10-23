//
//  AFModelEntityManger+Home.m
//  AFLib
//
//  Created by hewenxue on 2017/7/4.
//  Copyright © 2017年 ccc. All rights reserved.
//

#import "AFModelEntityManger+Home.h"
#import <AFNetworkMessageModel.h>

@implementation AFModelEntityManger (Home)
    /**
     潮汐表
     
     @param portid 港口ID(可选项①)
     @param pinyin 地区拼音(可选项②)
     @param success a
     @param failure b
     */
+(void)GETChaoxiTablePortid:(NSString *)portid
                     pinyin:(NSString *)pinyin
                    success:(void(^)(id result /*按自己需求返回自己目标类型*/,AFNetworkMessageModel *model))success
                    failure:(void(^)(AFNetworkMessageModel *model))failure;
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setValue:portid forKey:@"portid"];
    [parameters setValue:pinyin forKey:@"pinyin"];
    [parameters setValue:@"Chaoxi.Index" forKey:@"service"];
    AFAppDotnetApiManager *manager = [AFAppDotnetApiManager shareAFAppDotnetApiManager];
    //manager.urlObjectIndex = 0;
    [manager GETSignatureParameters:parameters progress:^(NSProgress * _Nullable downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        success(responseObject,[self getAFSuccessResponseObject:responseObject]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         [self getAFfailureError:error failure:failure];
    }];
}
    
    /**
     潮汐表
     
     @param portid 港口ID(可选项①)
     @param pinyin 地区拼音(可选项②)
     @param success a
     @param failure b
     */
+(void)POSTChaoxiTablePortid:(NSString *)portid
                      pinyin:(NSString *)pinyin
                     success:(void(^)(id result /*按自己需求返回自己目标类型*/,AFNetworkMessageModel *model))success
                     failure:(void(^)(AFNetworkMessageModel *model))failure;
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [parameters setValue:portid forKey:@"portid"];
    [parameters setValue:pinyin forKey:@"pinyin"];
    [parameters setValue:@"Chaoxi.Index" forKey:@"service"];
    [[AFAppDotnetApiManager shareAFAppDotnetApiManager] POSTSignatureParameters:parameters progress:^(NSProgress * _Nullable downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        success(responseObject,[self getAFSuccessResponseObject:responseObject]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         [self getAFfailureError:error failure:failure];
    }];
}
    
//+ (void)fetchWeatherWithType:(NSString *)type pinyin:(NSString *)pinyin cityid:(NSString *)cityid lng:(NSString *)lng lat:(NSString *)lat success:(void(^)(id weather, AFNetworkMessageModel *model))success failure:(void(^)(AFNetworkMessageModel *model))failure{
//    
//    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    [parameters setValue:@"Tianqi.GetAllByGps" forKey:@"service"];
//    [parameters setValue:type forKey:@"type"];
//    [parameters setValue:pinyin forKey:@"pinyin"];
//    [parameters setValue:cityid forKey:@"cityid"];
//    [parameters setValue:lng forKey:@"lng"];
//    [parameters setValue:lat forKey:@"lat"];
//    
//    AFAppDotnetApiManager *manager = [AFAppDotnetApiManager shareAFAppDotnetApiManager];
//    manager.urlObjectIndex = 1;
//    [manager GETSignatureParameters:parameters progress:^(NSProgress * _Nullable downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
//        
//        if ([[responseObject valueForKey:@"data"] isKindOfClass:[NSDictionary class]]) {
//            NSDictionary *dict=[responseObject valueForKey:@"data"];
//           
//            success(dict, [self getAFSuccessResponseObject:responseObject]);
//        }else{
//            NSError *error = [NSError initWithErrorCoustomCode:AFERRORCoustomCode_1000007 additionalcode:[responseObject[KRequestSuccessRetKey] integerValue] additionalmessage:responseObject[KRequestSuccessMsgKey]];
//            [self getAFfailureError:error failure:failure];
//        }
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
//     {
//         [self getAFfailureError:error failure:failure];
//     }];
//    
//}
@end

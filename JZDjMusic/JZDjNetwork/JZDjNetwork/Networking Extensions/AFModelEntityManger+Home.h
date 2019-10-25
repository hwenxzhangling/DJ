//
//  AFModelEntityManger+Home.h
//  AFLib
//
//  Created by hewenxue on 2017/7/4.
//  Copyright © 2017年 ccc. All rights reserved.
//

#import "AFModelEntityManger.h"

@interface AFModelEntityManger (Home)


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
    
    
    
///**
// 获取天气数据
//
// @param type <#type description#>
// @param pinyin <#pinyin description#>
// @param cityid <#cityid description#>
// @param lng <#lng description#>
// @param lat <#lat description#>
// @param success <#success description#>
// @param failure <#failure description#>
// */
//+ (void)fetchWeatherWithType:(NSString *)type pinyin:(NSString *)pinyin cityid:(NSString *)cityid lng:(NSString *)lng lat:(NSString *)lat success:(void(^)(id weather, AFNetworkMessageModel *model))success failure:(void(^)(AFNetworkMessageModel *model))failure;
@end

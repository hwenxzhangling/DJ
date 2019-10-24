
//
//  JZDMusic.m
//  JZDjMusicMainProject
//
//  Created by kiwi on 2019/10/24.
//  Copyright © 2019 WX. All rights reserved.
//

#import "JZDMusic.h"
#import <MJExtension.h>
@implementation JZDMusic
MJCodingImplementation
+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
        @"id":@"dance_id"
    };
}
@end

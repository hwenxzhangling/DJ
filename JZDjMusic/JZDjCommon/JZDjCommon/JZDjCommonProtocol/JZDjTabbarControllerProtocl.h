//
//  JZDjTabbarControllerProtocl.h
//  JZDjCommon
//
//  Created by wapushidai on 2019/10/23.
//  Copyright © 2019 WX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol JZDjTabbarControllerProtocl <NSObject>

@optional
/// 新增控制器
/// @param vcClass vcClass
/// @param title title
/// @param imageName 图片名称
- (void)insertvClass:(Class)vcClass title:(NSString *)title imageName:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END

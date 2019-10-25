//
//  ArrayToDataTransformer.m
//  Weather
//
//  Created by wapushidai on 2019/9/26.
//  Copyright © 2019 瓦普时代. All rights reserved.
//

#import "ArrayToDataTransformer.h"

@implementation ArrayToDataTransformer
+ (Class)transformedValueClass
{
    return [NSArray class];
}

+ (BOOL)allowsReverseTransformation
{
    return YES;
}

- (id)transformedValue:(id)value
{
    return [NSKeyedArchiver archivedDataWithRootObject:value];
}

- (id)reverseTransformedValue:(id)value
{
    return [NSKeyedUnarchiver unarchiveObjectWithData:value];
}
@end

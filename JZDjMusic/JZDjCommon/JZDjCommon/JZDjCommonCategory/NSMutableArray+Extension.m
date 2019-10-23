//
//  NSMutableArray+Extension.m
//  Weather
//
//  Created by yanglin on 2017/8/29.
//  Copyright © 2017年 瓦普时代. All rights reserved.
//

#import "NSMutableArray+Extension.h"

@implementation NSMutableArray (Extension)

- (void)my_addObject:(id)anObject{
    if (anObject) {
        [self addObject:anObject];
    }
}

- (void)my_addObjectsFromArray:(NSArray *)otherArray{
    if (otherArray.count) {
        [self addObjectsFromArray:otherArray];
    }
}


@end

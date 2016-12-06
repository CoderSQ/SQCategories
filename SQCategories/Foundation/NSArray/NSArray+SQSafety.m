//
//  NSArray+SQSafety.m
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/5.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "NSArray+SQSafety.h"

@implementation NSArray (SQSafety)

- (id)sq_safeObjecktAtIndex:(NSInteger)index {
    if (index >= self.count) {
        return nil;
    }
    
    return [self objectAtIndex:index];
}

@end

@implementation NSMutableArray (SQSafety)

- (void)sq_safeAddObject:(id)obj {
    if (obj) {
        [self addObject:obj];
    }
}

@end

//
//  NSDictionary+SQSafety.m
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/5.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "NSDictionary+SQSafety.h"

@implementation NSDictionary (SQSafety)

@end


@implementation  NSMutableDictionary (SQSafety)
- (void)sq_safeSetObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (anObject && aKey) {
        [self setObject:anObject forKey:aKey];
    }
}
@end

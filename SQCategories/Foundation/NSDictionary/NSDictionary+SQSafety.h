//
//  NSDictionary+SQSafety.h
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/5.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SQSafety)

@end


@interface NSMutableDictionary (SQSafety)

- (void)sq_safeSetObject:(id)anObject forKey:(id<NSCopying>)aKey;

@end

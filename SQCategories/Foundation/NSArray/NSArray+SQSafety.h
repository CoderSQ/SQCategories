//
//  NSArray+SQSafety.h
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/5.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SQSafety)

- (id)sq_safeObjecktAtIndex:(NSInteger)index;


@end

@interface NSMutableArray (SQSafety)

- (void)sq_safeAddObject:(id)obj;

@end

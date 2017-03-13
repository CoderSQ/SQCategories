//
//  NSString+SQMemorySize.h
//  SQCategoriesDemo
//
//  Created by apple on 2017/3/13.
//  Copyright © 2017年 zsq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SQMemorySize)

// 传入byte  返回 B K M G
+ (NSString *)formatMemorySizeWithSize:(NSInteger)size;
@end

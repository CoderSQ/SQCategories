//
//  NSString+SQMemorySize.m
//  SQCategoriesDemo
//
//  Created by apple on 2017/3/13.
//  Copyright © 2017年 zsq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+SQMemorySize.h"

@implementation NSString (SQMemorySize)

+ (NSString *)formatMemorySizeWithSize:(NSInteger)size{
    // 1k = 1024, 1m = 1024k
    if (size < 1024) {// 小于1k
        return [NSString stringWithFormat:@"%ldB",(long)size];
    }else if (size < 1024 * 1024){// 小于1m
        CGFloat aFloat = size/1024;
        return [NSString stringWithFormat:@"%.0fK",aFloat];
    }else if (size < 1024 * 1024 * 1024){// 小于1G
        CGFloat aFloat = size/(1024 * 1024);
        return [NSString stringWithFormat:@"%.1fM",aFloat];
    }else{
        CGFloat aFloat = size/(1024*1024*1024);
        return [NSString stringWithFormat:@"%.1fG",aFloat];
    }
}
@end

//
//  NSString+StringSize.h
//  GoldStock
//
//  Created by apple on 15/7/23.
//  Copyright (c) 2015年 easybank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (StringSize)

/**
 *  计算字符串的大小，制定字体以及约束范围
 *
 *  @param font 字体
 *  @param size 约束范围
 */
- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;


@end

//
//  UITextField+SQSelected.h
//  SQCategoriesDemo
//
//  Created by apple on 2017/2/28.
//  Copyright © 2017年 zsq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (SQSelected)

/**
 *  @brief  当前选中的字符串范围
 *
 *  @return NSRange
 */
- (NSRange)sq_selectedRange;
/**
 *  @brief  选中所有文字
 */
- (void)sq_selectAllText;
/**
 *  @brief  选中指定范围的文字
 *
 *  @param range NSRange范围
 */
- (void)sq_setSelectedRange:(NSRange)range;

@end

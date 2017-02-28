//
//  UITextField+UITextField_SQCardNumberFormatter.h
//  SQCategoriesDemo
//
//  Created by apple on 2017/2/28.
//  Copyright © 2017年 zsq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (UITextField_SQCardNumberFormatter)

/**
 *  银行卡格式化
 *  参数 textField UITextField控件
 *  参数 range 文本范围
 *  参数 string 字符串
 */
+ (BOOL)sq_bankNumberFormatTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

@end

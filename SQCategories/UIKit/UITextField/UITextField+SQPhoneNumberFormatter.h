//
//  UITextField+UITextField_SQPhoneNumberFormatter.h
//  SQCategoriesDemo
//
//  Created by apple on 2017/2/28.
//  Copyright © 2017年 zsq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (SQPhoneNumberFormatter)

/**
 *  手机号码格式化
 *  参数 textField UITextField控件
 *  参数 range 文本范围
 *  参数 string 字符串
 */
- (BOOL)sq_phoneNumberFormatShouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;


@end

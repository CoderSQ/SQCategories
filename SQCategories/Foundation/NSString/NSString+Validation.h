//
//  NSString+Validation.h
//  EasyCloudPay
//
//  Created by apple on 16/3/7.
//  Copyright © 2016年 zsq. All rights reserved.
//  通过正则表达式进行数据验证

#import <Foundation/Foundation.h>

@interface NSString (Validation)

/**
 * 是否是手机号
 */
+ (BOOL) validationPhoneNumber:(NSString *)str;

/**
 * 是否是密码
 */
+ (BOOL) validationPassword:(NSString *)str;

/**
 * 是否是支付密码
 */
+ (BOOL) validationPayPassword:(NSString *)str;


/**
 * 是否是登陆名
 */
+ (BOOL) validationLoginName:(NSString *)str;

/**
 * 是否是身份证号
 */
+ (BOOL) validationIDNo:(NSString *)str;

/**
 * 是否是银行卡号
 */
+ (BOOL) validationBankCardNo:(NSString *)str;

/**
 * 金额 ,必须是100的整数倍
 */
+ (BOOL) validationMoney:(NSString *)str;

/**
 * 金额 ,必须是100的整数倍
 */
+ (BOOL) validationMoney_T:(NSString *)str;


/**
 * 验证码
 */
+ (BOOL) validationSecurityCode:(NSString *)str;

/**
 * 邮箱
 */
+ (BOOL) validationEmailAddress:(NSString *)str;

@end

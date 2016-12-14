//
//  NSString+Validation.m
//  EasyCloudPay
//
//  Created by apple on 16/3/7.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "NSString+Validation.h"

@implementation NSString (Validation)

/**
 * 是否是手机号
 */
+ (BOOL) validationPhoneNumber:(NSString *)str {
    NSString *format = @"^1[34578]\\d{9}$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",format];
    return  [predicate evaluateWithObject:str];
}

/**
 * 是否是密码
 */
+ (BOOL) validationPassword:(NSString *)str {
    NSString *format = @"^\\w{6,16}$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",format];
    return  [predicate evaluateWithObject:str];
}

/**
 * 是否是支付密码
 */
+ (BOOL) validationPayPassword:(NSString *)str {
    NSString *format = @"^[0-9]{6}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF  MATCHES %@", format];
    return [predicate evaluateWithObject:str];
}

/**
 * 是否是登陆名
 */
+ (BOOL) validationLoginName:(NSString *)str {
    NSString *format = @"^\\w{2,}$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",format];
    return  [predicate evaluateWithObject:str];
}


/**
 * 是否是身份证号
 */
+ (BOOL) validationIDNo:(NSString *)str {
    NSString *format = @"^(\\d{17}|\\d{14})[\\dxX]$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",format];
    return  [predicate evaluateWithObject:str];
}


/**
 * 是否是银行卡号
 */
+ (BOOL) validationBankCardNo:(NSString *)str {
    NSString *format = @"^(\\d{16}|\\d{19})$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",format];
    return  [predicate evaluateWithObject:str];
}


/**
 * 金额 ,必须是100的整数倍
 */
+ (BOOL) validationMoney:(NSString *)str {
    NSString *format = @"^[1-9]\\d*(.\\d{1,2})?$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",format];
    return  [predicate evaluateWithObject:str];
}

/**
 * 金额 ,必须是100的整数倍
 */
+ (BOOL) validationMoney_T:(NSString *)str {
    
    if ([self validationMoney:str]) {
        return YES;
    }
    return NO;
}

/**
 * 验证码
 */
+ (BOOL) validationSecurityCode:(NSString *)str {
    NSString *format = @"^\\d+$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",format];
    return  [predicate evaluateWithObject:str];
}


/**
 * 邮箱
 */
+ (BOOL) validationEmailAddress:(NSString *)str {
    NSString *format = @"\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",format];
    return  [predicate evaluateWithObject:str];
}



@end

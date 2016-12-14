//
//  NSString+MoneyString.m
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/14.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "NSString+MoneyString.h"

@implementation NSString (MoneyString)

+ (NSString *)yuanToFen:(NSString *)yuan {
    if (yuan == nil) {
        return @"0.0";
    } else {
        return  [NSString stringWithFormat:@"%.0f", [yuan floatValue] * 100];
    }
}

+ (NSString *)fenToYuan:(NSString *)fen {
    if (fen == nil) {
        return @"0.0";
    } else {
        return [NSString stringWithFormat:@"%.2f", [fen longLongValue] * 0.01];
        //        return  [money stringByReplacingOccurrencesOfString:@".00" withString:@""];
    }
}

/**
 * 将钱转化成12位的钱， 比如500元   返回   000000050000
 */
+ (NSString *)format12Money:(NSString *)money {
    return [NSString stringWithFormat:@"%012zd", [money integerValue]];
}

/**
 *  将字符串类型的数值转换成收益率
 */
+ (NSString *)rateWithString:(NSString *)rate {
    return [NSString stringWithFormat:@"%.2f%%", [rate floatValue] * 100];
}

/**
 *  @param string 需要格式化的钱数
 *
 *  @return 格式化后的字符串
 */
+ (NSString *)formatMoneyWithString:(NSString *)string {
    string = [NSString fenToYuan:string];
    NSNumber *number =  [NSNumber numberWithFloat:[string floatValue]];
    NSNumberFormatter *formattor = [[NSNumberFormatter alloc] init];
    //    formattor.numberStyle = NSNumberFormatterCurrencyStyle;
    [formattor setPositiveFormat:@"###,##0.00;"];
    return [NSString stringWithFormat:@"%@", [formattor stringFromNumber:number]];
}

/**
 *  @param string 需要格式化的钱数
 *
 *  @return 格式化后的字符串  返回格式 ￥ 100，000.00
 */
+ (NSString *)formatMoneyWithYuanString:(NSString *)string {
    string = [NSString fenToYuan:string];
    NSNumber *number =  [NSNumber numberWithFloat:[string floatValue]];
    NSNumberFormatter *formattor = [[NSNumberFormatter alloc] init];
    //    formattor.numberStyle = NSNumberFormatterCurrencyStyle;
    [formattor setPositiveFormat:@"###,##0.00;"];
    return [NSString stringWithFormat:@"￥%@", [formattor stringFromNumber:number]];
}

@end

//
//  NSString+MoneyString.h
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/14.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MoneyString)

/**
 * 将元转成分
 */
+ (NSString *)yuanToFen:(NSString *)yuan;

/**
 *  将分转成元
 */
+ (NSString *)fenToYuan:(NSString *)fen;

/**
 * 将钱转化成12位的钱， 比如500元   返回   000000050000
 */
+ (NSString *)format12Money:(NSString *)money;

/**
 *  将字符串类型的数值转换成收益率
 */
+ (NSString *)rateWithString:(NSString *)rate;

/**
 *  @param string 需要格式化的钱数
 *
 *  @return 格式化后的字符串  返回格式 100，000.00
 */
+ (NSString *)formatMoneyWithString:(NSString *)string;

/**
 *  @param string 需要格式化的钱数
 *
 *  @return 格式化后的字符串  返回格式 ￥ 100，000.00
 */
+ (NSString *)formatMoneyWithYuanString:(NSString *)string;

@end

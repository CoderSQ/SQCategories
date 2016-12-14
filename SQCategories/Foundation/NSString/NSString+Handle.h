//
//  NSString+Handle.h
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/14.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Handle)

// 移除字符串中的特殊字符
- (NSString *) removeUnescapedCharacter  :(NSString *)inputStr;

//从字符串中取字节数组
+ (NSData*)stringToByte:(NSString*)string;

//普通字符串转换为十六进制的。
+ (NSString *)hexStringFromString:(NSString *)string;

// 十六进制转换为普通字符串的。
+ (NSString *)stringFromHexString:(NSString *)hexString;

/**
 *  找出字符串中所有子字符串的range
 *
 *  @param str 要查找的字串
 *
 *  @return 返回包含range的数组
 */
- (NSArray *)rangesOfString:(NSString *)str;

// 适配iOS 7
- (BOOL) containsString:(NSString *)str;

@end

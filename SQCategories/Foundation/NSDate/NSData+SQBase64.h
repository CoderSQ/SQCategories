//
//  NSData+SQBase64.h
//  SQCategoriesDemo
//
//  Created by apple on 2017/2/9.
//  Copyright © 2017年 zsq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (SQBase64)




/**
 *  @brief  字符串base64后转data
 *
 *  @param string 传入字符串
 *
 *  @return 传入字符串 base64后的data
 */
+ (NSData *)sq_dataWithBase64EncodedString:(NSString *)string;

/**
 *  @brief  NSData转string
 *  @return base64后的字符串
 */
- (NSString *)sq_base64EncodedString;

@end

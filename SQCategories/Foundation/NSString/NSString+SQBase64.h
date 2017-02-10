//
//  NSString+SQBase64.h
//  SQCategoriesDemo
//
//  Created by apple on 2017/2/9.
//  Copyright © 2017年 zsq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSData+SQBase64.h"

@interface NSString (SQBase64)

+ (NSString *)sq_stringWithBase64EncodedString:(NSString *)string;

- (NSString *)sq_base64EncodedString;
- (NSString *)sq_base64DecodedString;

- (NSData *)sq_base64DecodedData;

@end

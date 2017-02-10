//
//  NSString+SQBase64.m
//  SQCategoriesDemo
//
//  Created by apple on 2017/2/9.
//  Copyright © 2017年 zsq. All rights reserved.
//

#import "NSString+SQBase64.h"

@implementation NSString (SQBase64)

+ (NSString *)sq_stringWithBase64EncodedString:(NSString *)string
{
    NSData *data = [NSData sq_dataWithBase64EncodedString:string];
    if (data)
    {
        return [[self alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}

- (NSString *)sq_base64EncodedString
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data sq_base64EncodedString];
}

- (NSString *)sq_base64DecodedString
{
    return [NSString sq_stringWithBase64EncodedString:self];
}

- (NSData *)sq_base64DecodedData
{
    return [NSData sq_dataWithBase64EncodedString:self];
}

@end

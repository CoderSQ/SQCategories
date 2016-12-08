//
//  UIColor+SQHex.m
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/3.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "UIColor+SQHex.h"
#define kHexStringColorLength 7

CGFloat sq_colorComponentValue(NSString *str, NSUInteger start, NSUInteger length) {
    NSString *subStr = [str substringWithRange:NSMakeRange(start, length)];
    
    unsigned hexComponenet;
    [[NSScanner scannerWithString:subStr] scanHexInt:&hexComponenet];
    return hexComponenet/255.0f;
}

@implementation UIColor (SQHex)

+ (UIColor *)sq_colorWithHexString:(NSString *)hexString {
    
    CGFloat red, green, blue , alpha;
    NSString *colorString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    
    switch (colorString.length) {
        //RRGGBB
        case 6:
            alpha = 1.0f;
            red = sq_colorComponentValue(colorString, 0, 2);
            green = sq_colorComponentValue(colorString, 2, 2);
            blue = sq_colorComponentValue(colorString, 4, 2);
            break;
        //AARRGGBB
        case 8:
            alpha = sq_colorComponentValue(colorString, 0, 2);
            red = sq_colorComponentValue(colorString, 2, 2);
            green  = sq_colorComponentValue(colorString, 4, 2);
            blue = sq_colorComponentValue(colorString, 6, 2);
            break;
        default:
            return [UIColor clearColor];
            break;
    }
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end

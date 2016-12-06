//
//  UIColor+SQRandom.m
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/3.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "UIColor+SQRandom.h"

@implementation UIColor (SQRandom)
+ (UIColor *)sq_randomColor {
    NSUInteger red = arc4random() % 255;
    NSUInteger green = arc4random() % 255;
    NSUInteger blue = arc4random() %255;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}
@end

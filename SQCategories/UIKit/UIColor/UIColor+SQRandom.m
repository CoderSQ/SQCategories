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
    
    return [UIColor colorWithRed:red / 255.0f green:green / 255.0f blue:blue / 255.0f alpha:1.0f];
}
@end

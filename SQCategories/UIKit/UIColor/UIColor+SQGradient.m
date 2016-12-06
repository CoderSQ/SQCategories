//
//  UIColor+SQGradient.m
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/3.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "UIColor+SQGradient.h"

@implementation UIColor (SQGradient)

/**
 * fColor 开始颜色
 * tColor 结束颜色
 * size  大小
 * orientation 方向
 */
+ (UIColor *)sq_gradientColorFormColor:(UIColor *)fColor toColor:(UIColor *)tColor withSize:(CGSize)size orientation:(ColorGradient)orientation {
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    NSArray *colors = [NSArray arrayWithObjects:(id)fColor.CGColor, (id)tColor.CGColor, nil];

    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, NULL);
    
    switch (orientation) {
        case ColorGradientLeftToRigth:
            CGContextDrawLinearGradient(ctx, gradient, CGPointMake(0, 0), CGPointMake(size.width, 0), 0);
            
            break;
        case ColorGradientTopToDown:
            CGContextDrawLinearGradient(ctx, gradient, CGPointMake(0, 0), CGPointMake(0, size.height), 0);
            break;
        default:
            break;
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIColor *color;
    if (image) {
        color = [UIColor colorWithPatternImage:image];
    }
    
    
    return color ? color : [UIColor clearColor];
}

@end

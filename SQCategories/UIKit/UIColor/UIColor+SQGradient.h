//
//  UIColor+SQGradient.h
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/3.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ColorGradient) {
    ColorGradientLeftToRigth,
    ColorGradientTopToDown,
};

@interface UIColor (SQGradient)

/**
 * fColor 开始颜色
 * tColor 结束颜色
 * size  大小
 * orientation 方向
 */
+ (UIColor *)sq_gradientColorFormColor:(UIColor *)fColor toColor:(UIColor *)tColor withSize:(CGSize)size orientation:(ColorGradient)orientation;

@end

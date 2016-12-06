//
//  UIImage+Capture.m
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/3.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "UIImage+Capture.h"

@implementation UIImage (Capture)

- (UIImage *)sq_captureWithView:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, [UIScreen mainScreen].scale);
    
    if ([view respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)] && [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:NO]) {
        ;
    } else {
        [view.layer drawInContext:UIGraphicsGetCurrentContext()];
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

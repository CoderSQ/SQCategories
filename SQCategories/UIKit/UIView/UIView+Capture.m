//
//  UIView+Capture.m
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/2.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "UIView+Capture.h"

@implementation UIView (Capture)

- (UIImage *)sq_screenshot {
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, [UIScreen mainScreen].scale);
    
    if ([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)] && [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO]) {
        ;
    } else {
        [self.layer drawInContext:UIGraphicsGetCurrentContext()];
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end

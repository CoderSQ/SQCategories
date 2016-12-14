//
//  UINavigationBar+SQExtension.m
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/14.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "UINavigationBar+SQExtension.h"

@implementation UINavigationBar (SQExtension)

+ (UIImageView *)findBootomLineWithNavigationBar:(UINavigationBar *)navBar {
    
    return [self findBootomLineWithView:navBar];
}

+ (UIImageView *)findBootomLineWithView:(UIView *) view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findBootomLineWithView:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}
@end

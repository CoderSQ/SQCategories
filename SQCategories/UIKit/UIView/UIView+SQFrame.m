//
//  UIView+SQFrame.m
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/2.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "UIView+SQFrame.h"

@implementation UIView (SQFrame)

#pragma mark - getter
- (CGFloat)sq_x {
    return self.frame.origin.x;
}

- (CGFloat)sq_y {
    return self.frame.origin.y;
}

- (CGFloat)sq_width {
    return self.frame.size.width;
}
- (CGFloat)sq_height {
    return self.frame.size.height;
}

- (CGFloat)sq_centerX {
    return self.center.x;
}

- (CGFloat)sq_centerY {
    return self.center.y;
}

- (CGPoint)sq_origin {
    return self.frame.origin;
}

- (CGSize)sq_size {
    return self.frame.size;
}

- (CGFloat)sq_maxX {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)sq_maxY {
    return self.frame.origin.y + self.frame.size.height;
}


#pragma mark - setter
- (void)sq_setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)sq_setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (void)sq_setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (void)sq_setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)sq_setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)sq_setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}


- (void)sq_setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (void)sq_setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

@end

//
//  UIView+SQFrame.h
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/2.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SQFrame)

//@property (nonatomic, assign) CGFloat sq_x;
//@property (nonatomic, assign) CGFloat sq_y;
//@property (nonatomic, assign) CGFloat sq_width;
//@property (nonatomic, assign) CGFloat sq_height;
//@property (nonatomic, assign) CGPoint sq_origin;
//@property (nonatomic, assign) CGSize sq_size;



- (CGFloat)sq_x;
- (CGFloat)sq_y;
- (CGFloat)sq_width;
- (CGFloat)sq_height;
- (CGFloat)sq_centerX;
- (CGFloat)sq_centerY;

- (CGPoint)sq_origin;
- (CGSize)sq_size;

- (CGFloat)sq_maxX;
- (CGFloat)sq_maxY;

- (void)sq_setX:(CGFloat)x;
- (void)sq_setY:(CGFloat)y;
- (void)sq_setWidth:(CGFloat)width;
- (void)sq_setHeight:(CGFloat)height;
- (void)sq_setCenterX:(CGFloat)centerX;
- (void)sq_setCenterY:(CGFloat)centerY;

- (void)sq_setOrigin:(CGPoint)origin;
- (void)sq_setSize:(CGSize)size;

@end

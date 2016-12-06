//
//  UIImage+SQResize.h
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/3.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SQResize)

// 等比缩放
- (UIImage *)sq_unifoimScaleToSize:(CGSize)size;

// 放回中间拉伸的图片
- (UIImage *)sq_strechableImage;
@end

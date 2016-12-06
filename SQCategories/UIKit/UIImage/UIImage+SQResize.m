//
//  UIImage+SQResize.m
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/3.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "UIImage+SQResize.h"

@implementation UIImage (SQResize)

- (UIImage *)sq_unifoimScaleToSize:(CGSize)size {
    
    CGSize imageSize = self.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = size.width;
    CGFloat targetHeight = size.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth ;
    CGFloat scaledHeight ;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    if (CGSizeEqualToSize(imageSize, size)) {
        return self;
    }

    CGFloat widthFactor = targetWidth / width;
    CGFloat heightFactor = targetHeight / height;
    
    scaleFactor = widthFactor > heightFactor ? widthFactor : heightFactor;
    
    scaledWidth= width * scaleFactor;
    scaledHeight = height * scaleFactor;
    // center the image
    if (widthFactor > heightFactor) {
        thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
    }
    else if (widthFactor < heightFactor) {
        thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
    }
    
    UIGraphicsBeginImageContext(size); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width= scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [self drawInRect:thumbnailRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    if(newImage == nil)
        NSLog(@"could not scale image");
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)sq_strechableImage {
    NSInteger top = floor(self.size.height * 0.5) - 1;
    NSInteger left = floor(self.size.width * 0.5) - 1;
    
    if (top < 0 || left < 0) {
        top = labs(top);
        left = labs(left);
    }
    
    return [self resizableImageWithCapInsets:UIEdgeInsetsMake(top, left, top, left) resizingMode:UIImageResizingModeStretch];
}

@end

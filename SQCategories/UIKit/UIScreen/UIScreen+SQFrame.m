//
//  UIScreen+Frame.m
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/3.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "UIScreen+SQFrame.h"

@implementation UIScreen (SQFrame)
+ (CGFloat)sq_screenWidth {
    return [self sq_screenSize].width;
}

+ (CGFloat)sq_screenHeight {
    return [self sq_screenSize].height;
}

+ (CGSize)sq_screenSize {
    return [self sq_screenBounds].size;
}

+ (CGRect)sq_screenBounds {
    return [self mainScreen].bounds;
}


+ (CGFloat)sq_screenScale {
    return [self mainScreen].scale;
}

@end

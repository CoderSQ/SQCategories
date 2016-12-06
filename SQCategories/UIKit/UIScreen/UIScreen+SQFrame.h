//
//  UIScreen+Frame.h
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/3.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (SQFrame)

+ (CGFloat)sq_screenWidth;
+ (CGFloat)sq_screenHeight;
+ (CGSize)sq_screenSize;
+ (CGRect)sq_screenBounds;
+ (CGFloat)sq_screenScale;
@end

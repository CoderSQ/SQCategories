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

// 导航栏高度
+ (CGFloat) sq_navBarHeight {
    return 64.0f;
}

// tabbar高度
+ (CGFloat) sq_tabBarHeight {
    return 49.0f;
}

// 状态栏高度
+ (CGFloat) sq_statusBarHeight {
    return 20.0f;
}

@end

//
//  UIWindow+SQHierarchy.h
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/3.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (SQHierarchy)

// 获取窗口最上级的视图控制器
- (UIViewController *)sq_topMostViewController;

// 获取窗口上正在显示的视图控制器
- (UIViewController *)sq_currentViewController;

@end

//
//  UIWindow+SQHierarchy.m
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/3.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "UIWindow+SQHierarchy.h"

@implementation UIWindow (SQHierarchy)

- (UIViewController *)sq_topMostViewController {
    UIViewController *topVC = self.rootViewController;
    
    while ([topVC presentedViewController]) {
        topVC = [topVC presentedViewController];
    }
    
    return topVC;
}


- (UIViewController *)sq_currentViewController {
    UIViewController *currentVC = [self sq_topMostViewController];
    
    while ([currentVC isKindOfClass:[UINavigationController class]] && [(UINavigationController *)currentVC topViewController]) {
        currentVC = [(UINavigationController *)currentVC topViewController];
    }
    
    return currentVC;
}

@end

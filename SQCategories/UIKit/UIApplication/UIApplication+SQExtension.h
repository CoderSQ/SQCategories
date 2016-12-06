//
//  UIApplication+SQExtension.h
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/6.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (SQExtension)

+ (NSString *)sq_applicationSize;
+ (NSString *)sq_cachePath;
+ (NSString *)sq_libraryPath;
+ (NSString *)sq_documentPath;

@end

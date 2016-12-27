//
//  UIControl+SQExtension.m
//  SQCategoriesDemo
//
//  Created by apple on 2016/12/27.
//  Copyright © 2016年 zsq. All rights reserved.
//

#import "UIControl+SQExtension.h"

@implementation UIControl (SQExtension)

- (void)removeAllTarget {
    
    for (id obj in self.allTargets) {
        [self removeTarget:obj action:NULL forControlEvents:UIControlEventAllEvents];
    }
}
@end

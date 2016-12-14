//
//  NSString+StringSize.m
//  GoldStock
//
//  Created by apple on 15/7/23.
//  Copyright (c) 2015年 easybank. All rights reserved.
//

#import "NSString+StringSize.h"

@implementation NSString (StringSize)

- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size {
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_7_0
        NSDictionary *dict = @{NSFontAttributeName : font};
        return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
#else
    return  [self sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
#endif
}


@end

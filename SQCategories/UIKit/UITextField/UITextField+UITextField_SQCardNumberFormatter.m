//
//  UITextField+UITextField_SQCardNumberFormatter.m
//  SQCategoriesDemo
//
//  Created by apple on 2017/2/28.
//  Copyright © 2017年 zsq. All rights reserved.
//

#import "UITextField+UITextField_SQCardNumberFormatter.h"

@implementation UITextField (UITextField_SQCardNumberFormatter)

+ (BOOL)sq_bankNumberFormatTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *cardNum = [textField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    // 手机号码长度为11位,且当前为添加内容时,不添加
    if (cardNum.length >= 19 && string.length) {
        return NO;
    }
    
    NSMutableString *matchStr = [NSMutableString stringWithString:textField.text];
    if (!string.length) {
        [matchStr deleteCharactersInRange:range];
    }else{
        [matchStr insertString:string atIndex:range.location];
    }
    NSMutableString *bankNum = [NSMutableString stringWithString:[matchStr stringByReplacingOccurrencesOfString:@" " withString:@""]];
    
    //这是获取改变后的textfiled的内容
    //获取当前光标的位置
    NSUInteger targetCursorPosition = [textField offsetFromPosition:textField.beginningOfDocument
                                                         toPosition:textField.selectedTextRange.start];
    
    NSMutableString *str =  [NSMutableString stringWithString:bankNum];
    //这个是判断是删除还是添加内容，假如是删除那就将光标向前移一个单位（特殊情况是当删除空格时要将光标向前再移一个单位），假如添加就要将光标向后移动一个单位（特殊情况是当添加空格时要将光标向后再移一个单位），这边其实比较绕，可以仔细想一下
    
    NSInteger marginCount = 4; // 间距为4
    NSInteger strLength = str.length;
    if (string.length) {
        targetCursorPosition++;
        if (strLength != 1 && (strLength % marginCount) == 1) {
            targetCursorPosition++;
        }
    }else{
        
        targetCursorPosition--;
        if (!(strLength % marginCount) || !(targetCursorPosition % (marginCount + 1))) {
            targetCursorPosition--;
        }
    }
    //此处是在特殊位置添加对应空格
    NSInteger size = str.length / marginCount;
    NSInteger mod = str.length % marginCount;
    __block NSString *resStr = @"";
    if (size || mod) {
        NSMutableArray *arrStrs = @[].mutableCopy;
        for (NSInteger i = 0; i < size; i++) {
            [arrStrs addObject:[str substringWithRange:NSMakeRange(0 + i * marginCount, marginCount)]];
        }
        
        // 添加最后不满marginCount个的内容
        if (mod) {
            [arrStrs addObject:[str substringWithRange:NSMakeRange(size * marginCount, mod)]];
        }
        
        [arrStrs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            resStr = [resStr stringByAppendingFormat:@"%@ ", obj];
        }];
        
        resStr = [arrStrs componentsJoinedByString:@" "];
    }
    
    //将最终显示的内容复制给textfield
    textField.text = resStr;
    //该处其实就是选择内容 只不过这个内容长度为0
    UITextPosition *targetPosition = [textField positionFromPosition:[textField beginningOfDocument] offset:targetCursorPosition];
    [textField setSelectedTextRange:[textField textRangeFromPosition:targetPosition toPosition:targetPosition]];
    return NO;
}

@end

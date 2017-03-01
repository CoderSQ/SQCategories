//
//  UITextField+UITextField_SQPhoneNumberFormatter.m
//  SQCategoriesDemo
//
//  Created by apple on 2017/2/28.
//  Copyright © 2017年 zsq. All rights reserved.
//

#import "UITextField+SQPhoneNumberFormatter.h"

@implementation UITextField (SQPhoneNumberFormatter)

+ (BOOL)sq_phoneNumberFormatTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
{
    NSString *phoneNum = [textField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    // 手机号码长度为11位,且当前为添加内容时,不添加
    if (phoneNum.length >= 11 && string.length) {
        return NO;
    }
    
    NSMutableString *matchStr = [NSMutableString stringWithString:textField.text];
    if (!string.length) {
        [matchStr deleteCharactersInRange:range];
    }else{
        [matchStr insertString:string atIndex:range.location];
    }
    NSMutableString *mobileNum = [NSMutableString stringWithString:[matchStr stringByReplacingOccurrencesOfString:@" " withString:@""]];
    
    //这是获取改变后的textfiled的内容
    //获取当前光标的位置
    NSUInteger targetCursorPosition = [textField offsetFromPosition:textField.beginningOfDocument
                                                         toPosition:textField.selectedTextRange.start];
    
    NSMutableString *str =  [NSMutableString stringWithString:mobileNum];
    //这个是判断是删除还是添加内容，假如是删除那就将光标向前移一个单位（特殊情况是当删除空格时要将光标向前再移一个单位），假如添加就要将光标向后移动一个单位（特殊情况是当添加空格时要将光标向后再移一个单位），这边其实比较绕，可以仔细想一下
    if (string.length) {
        targetCursorPosition++;
        if ([str length] == 4||[str length] == 8) {
            targetCursorPosition++;
        }
    }else{
        
        targetCursorPosition--;
        if ([str length] == 3||[str length] == 7) {
            targetCursorPosition--;
        }
    }
    //此处是在特殊位置添加对应空格
    if ([str length]>3&&[str length]<8){
        
        [str insertString:@" " atIndex:3];
    }else if ([str length]>=8) {
        
        [str insertString:@" " atIndex:7];
        [str insertString:@" " atIndex:3];
    }
    //将最终显示的内容复制给textfield
    textField.text = str;
    //该处其实就是选择内容 只不过这个内容长度为0
    UITextPosition *targetPosition = [textField positionFromPosition:[textField beginningOfDocument] offset:targetCursorPosition];
    [textField setSelectedTextRange:[textField textRangeFromPosition:targetPosition toPosition:targetPosition]];
    return NO;
}

@end

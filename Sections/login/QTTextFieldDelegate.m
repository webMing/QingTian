//
//  TextFieldDelegate.m
//  TextFieldHelper
//
//  Created by Apple on 16/4/9.
//  Copyright © 2016年 Stephanie. All rights reserved.
//

#import "QTTextFieldDelegate.h"
#import "NSString+common.h"
#import "NSString+Helper.h"

@interface QTTextFieldDelegate()

@property (nonatomic,  copy) DidBeginEditingBlock  beginEditingBlock;
@property (nonatomic,  copy) TextDidChangeBlock    textDidChangeBlock;
@property (nonatomic,  copy) DidEndEditingBlock    endEditingBlock;

@property (nonatomic,  strong) UITextField*  tempTextField;
@property (nonatomic,  copy) NSString*  currentInputSting;

@end

@implementation QTTextFieldDelegate

#pragma mark --Init......

- (instancetype)initWithBeginEditingBlock:(DidBeginEditingBlock) beginEditingBlock
                       textDidChangeBlock:(TextDidChangeBlock)   textDidChangeBlock
                          endEditingBlock:(DidEndEditingBlock)   endEdtingBlock;
{
    self = [super init];
    if (self) {
        self.beginEditingBlock    = beginEditingBlock;
        self.textDidChangeBlock    = textDidChangeBlock;
        self.endEditingBlock      = endEdtingBlock;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChangeResponseMethod:) name:UITextFieldTextDidChangeNotification object:nil];
    }
    return self;
}

#pragma mark --NotificationResponseMethod
- (void)textFieldDidChangeResponseMethod:(NSNotification*) notification{
    UITextField* textField = notification.object;
    /*防止通知多发*/
    if (self.tempTextField != textField) {
        return;
    }
    /*防止删除的时候的情况*/
    if ([textField.text isEqualToString:@""]) {
        return;
    }
    if (self.checkMode == CheckVerificationCodeMode)
    {
        /*检测验证码*/
        if (![textField.text isPureInteger])
        {
            self.textDidChangeBlock(textField,@"验证码只能是数字");
            NSUInteger length = textField.text.length - self.currentInputSting.length;
            textField.text = [textField.text substringWithRange:NSMakeRange(0, length)];
            return;
        }
        /*超过了验证码的长度*/
        if (textField.text.length > self.verityCodeLentch)
        {
            textField.text = [textField.text substringWithRange:NSMakeRange(0,self.verityCodeLentch)];
            self.textDidChangeBlock(textField,[NSString stringWithFormat:@"验证码为%lu位数字",(unsigned long)self.verityCodeLentch]);
            return;
        }
        self.textDidChangeBlock(textField,nil);
    }

    if(self.checkMode == CheckPhoneNumberCodeMode)
    {
        /*检测手机号*/
        if (![textField.text isPureInteger] )
        {
            NSUInteger length = textField.text.length - self.currentInputSting.length;
            textField.text = [textField.text substringWithRange:NSMakeRange(0, length)];
            self.textDidChangeBlock(textField,@"手机号只能是数字");
            return;
        }
       if(textField.text.length > 11){
             textField.text = [textField.text substringWithRange:NSMakeRange(0,11)];
             self.textDidChangeBlock(textField,@"手机号为11位数字");/*截取了字符串*/
            return;
        }
        self.textDidChangeBlock(textField,nil);
    }
    
    if(self.checkMode == CheckIdentifyCardMode)
    {
        /*身份证号*/
        NSString *regex = @"^[0-9][A-Za-z0-9]*";
        NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        if (![identityCardPredicate evaluateWithObject:textField.text]) {
            self.textDidChangeBlock(textField,@"身份证号输入有误");
        }
        self.textDidChangeBlock(textField,nil);
    }
    
    if (self.checkMode == CheckPasswordMode)
    {
        /*检测密码*/
        /*比如说是 数字 字母 标点符号的组合 */
    }
    
    if (self.checkMode == CheckAccountMode)
    {
        /*检测账号*/
        /*不如说是 数字 字母  组合*/
    }
    
    if (self.checkMode == CheckCommand)
    {
         /*检测口令*/
        if (![textField.text isPureInteger])
        {
            self.textDidChangeBlock(textField,@"口令只能是数字");
            NSUInteger length = textField.text.length - self.currentInputSting.length;
            textField.text = [textField.text substringWithRange:NSMakeRange(0, length)];
            return;
        }
        /*超过口令长度*/
        if (textField.text.length > self.verityCodeLentch)
        {
            textField.text = [textField.text substringWithRange:NSMakeRange(0,self.verityCodeLentch)];
            self.textDidChangeBlock(textField,[NSString stringWithFormat:@"口令为%lu位数字",(unsigned long)self.verityCodeLentch]);
            return;
        }
        self.textDidChangeBlock(textField,nil);

    }
}

#pragma mark --UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    self.tempTextField = textField;
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (self.beginEditingBlock) {
        self.beginEditingBlock(textField);
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    if (self.checkMode == CheckVerificationCodeMode)
    {
        /*检测验证码*/
        if (textField.text.length  < self.verityCodeLentch)
        {
            self.endEditingBlock(textField,@"验证码位数不对",NO);
        }else
        {
            self.endEditingBlock(textField,@"验证码输入正确",YES);
        }
    }
    if(self.checkMode == CheckPhoneNumberCodeMode)
    {
        /*检测手机号*/
        if (textField.text.length != 11) {
            self.endEditingBlock(textField,@"手机号位数不对",NO);
        }else
        {
            self.endEditingBlock(textField,@"手机号如如正确",YES);
        }
    }
    
    /*身份证号*/
    if (self.checkMode == CheckIdentifyCardMode) {
        if (![textField.text validateIdentityCard]) {
            self.endEditingBlock(textField,@"身份证号输入有误", NO);
        }
    }
    if (self.checkMode == CheckPasswordMode)
    {
        /*检测密码 --是否需要移除其中的空格*/
        /*比如说是 数字 字母 标点符号的组合*/
        if (textField.text.length < 6 || textField.text.length > 16) {
            self.endEditingBlock(textField,@"请输入6~16位密码",NO);
        }else{
             self.endEditingBlock(textField,nil,YES);
        }
    }
        
    if (self.checkMode == CheckAccountMode)
    {
        /*检测账号*/
        /*不如说是 数字 字母  组合*/
    }
    if (self.checkMode == OtherMode) {
        /*other mode */
        self.endEditingBlock(textField,nil,YES);
    }
    
    if (self.checkMode == CheckCommand) {
        /*检测口令 */
        if (textField.text.length != self.verityCodeLentch) {
            self.endEditingBlock(textField,@"口令不对",YES);
        }else{
            self.endEditingBlock(textField,nil,NO);
        }
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    self.currentInputSting = string;
    return YES;
}

- (NSString *)checkTF:(UITextField *)tf {
    if (self.checkMode == CheckVerificationCodeMode)
    {
        /*检测验证码*/
        if (tf.text.length  < self.verityCodeLentch)
        {
            return @"验证码长度不够";
        }
        return nil;
    }
    
    if(self.checkMode == CheckPhoneNumberCodeMode)
    {
        /*检测手机号*/
        if (tf.text.length != 11) {
            return @"手机位数不对";
        }
        return nil;
    }
    
    if (self.checkMode == CheckIdentifyCardMode) {
        if (![tf.text validateIdentityCard]) {
            return @"身份证号输入有误";
        }
        return nil;
    }
    
    if (self.checkMode == CheckPasswordMode)
    {
        /*检测密码 --是否需要移除其中的空格*/
        /*比如说是 数字 字母 标点符号的组合*/
        if (tf.text.length < 6 || tf.text.length > 16) {
            return @"请输入6~16位密码";
        }
        return nil;
    }
    
    if (self.checkMode == CheckAccountMode)
    {
        /*检测账号*/
        /*不如说是 数字 字母  组合*/
    }
    if (self.checkMode == OtherMode) {
        /*other mode */
    }
    if (self.checkMode == CheckCommand) {
        /*检测口令 */
        if (tf.text.length != self.verityCodeLentch) {
            return @"口令不对";
        }
        return nil;
    }
    
    return nil;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end

//
//  TextFieldDelegate.h
//  TextFieldHelper
//
//  Created by Apple on 16/4/9.
//  Copyright © 2016年 Stephanie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^DidBeginEditingBlock)(UITextField* textFiled);
typedef void(^DidEndEditingBlock)(UITextField* textFiled, NSString*  message,BOOL isVerytifySuccess);
typedef void(^TextDidChangeBlock)(UITextField* textFiled, NSString*  message);

typedef NS_ENUM(NSUInteger, CheckMode) {
    
    CheckVerificationCodeMode = 1,
    CheckPhoneNumberCodeMode  = 2,
    CheckIdentifyCardMode     = 3,
    CheckPasswordMode         = 4,
    CheckAccountMode          = 5,
    CheckCommand              = 6,
    OtherMode                 = 7,
    
};

/*
 *   😊 This is a unique way to enjoy 😊
 */

@interface QTTextFieldDelegate : NSObject <UITextFieldDelegate>

@property (nonatomic, assign ,readwrite) CheckMode  checkMode;
@property (nonatomic, assign ,readwrite) NSUInteger  verityCodeLentch;

- (instancetype)initWithBeginEditingBlock:(DidBeginEditingBlock) beginEditingBlock
                        textDidChangeBlock:(TextDidChangeBlock)   textDidChangeBlock
                            endEditingBlock:(DidEndEditingBlock)   endEdtingBlock;

@end

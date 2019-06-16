//
//  NSString+Helper.h
//  BoBoCall
//
//  Created by jjyo.kwan on 13-6-14.
//  Copyright (c) 2013年 jjyo.kwan. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (Helper)

//进度状态 返回
-(NSString *)tateOne ;
//进度状态 报名状态返回
-(NSString *)learnStateZero;

//加密
- (NSString *)urlEncodedString;
//URL 解码
-(NSString*)urlDecodedString;

- (NSString *)MD5;

//-(NSString*)HloveyRC4:(NSString*)aInput key:(NSString*)aKey;

- (BOOL)isPureInteger;
//验证码
- (BOOL)isVcode;

-(BOOL)isPureFloat;
//密码规则
-(BOOL)isPwd;
//是否是手机号码
- (BOOL)isMobileNumber;
//是否是固定电话
//- (BOOL)isTelephoneNumber;

- (NSString *)mobileNumber;
//身份证
+ (BOOL)validateIdentityCard: (NSString *)identityCard;

//- (NSString *)areaNumber;

- (NSString*)toHexRC4WithKey:(NSString*)key;


//- (NSString *)toPhoneFormat;

+(BOOL)isEmpty:(NSString *) str;

//判断是否包含表情符号...
+(BOOL)isContainsEmoji:(NSString *)string ;

/// 是否是手机号码
+ (BOOL)isMobileNumber:(NSString *)mobileNum;
@end

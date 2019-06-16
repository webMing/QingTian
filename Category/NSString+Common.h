//
//  NSString+common.h
//  GXQApp
//
//  Created by jinfuzi on 14-2-26.
//  Copyright (c) 2014年 jinfuzi. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSString (Common)

+(NSString*)stringWithFileSize:(unsigned long long)size;

+(BOOL)isEmptyString:(NSString *)str;

+(NSString*)stringFrom:(NSString*)src withRegex:(NSString*)regex;

+(int)intValueFromHexString:(NSString*)str;

+(NSString*)stringFromArray:(NSArray*)array withDelimiter:(NSString*)delimiter;

+(NSString*)urlEncodedWtihDictionary:(NSDictionary*)dictionary;

+(NSString*)return32BitsRandomString;

-(NSString*)urlEncodedString;

-(NSString*)urlDecodedString;

-(NSString *)md5HexDigest;

-(BOOL)isValidateEmail;

-(BOOL) isValidateMobile;


/////////////////////////////////
#pragma mark - by xp start -
/////////////////////////////////////
//getNSDocumentDirectoryFilePath
+(NSString *)getNSDocumentDirectoryFilePath:(NSString *)fileName;

+(NSMutableString *)replaceAllString:(NSString *)str1 WithString:(NSString *)str2 forString:(NSMutableString *)str;

-(NSMutableString *)replaceAllString:(NSString *)str1 WithString:(NSString *)str2;

-(BOOL)isValidateStr;

/**
 * 身份证号码验证
 */
-(BOOL)validateIdentityCard;




/**
 * 台胞证
 */
- (BOOL)validateTaiWanCard;



/**
 * 港澳通行证
 */
- (BOOL)validateHKPassCard;



/**
 * 护照验证
 */
- (BOOL)validatePassportCard;



/**
 * 计算指定时间与当前的时间差
 * @param compareDate   某一指定时间
 * @return 多少(秒or分or天or月or年)+前 (比如，3天前、10分钟前)
 */
+ (NSString *)compareCurrentTime:(NSDate*)compareDate;

/// 是否为双引号
-(BOOL)isQuote;

/// 是否为NSNull 或者  nil
+(BOOL)isNSNullOrNil:(NSObject *)object;

@end

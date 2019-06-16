//
//  NSString+Helper.m
//  BoBoCall
//
//  Created by jjyo.kwan on 13-6-14.
//  Copyright (c) 2013年 jjyo.kwan. All rights reserved.
//


//引入IOS自带密码库
#import <CommonCrypto/CommonCryptor.h>

#import "NSString+Helper.h"
//#import "RegexKitLite.h"
#import <commoncrypto/CommonDigest.h>
//匹配手机的正则CommonDigest
#define REGEX_MOBILE @"^1[34578]\\d{9}$"
//电话区号正则
#define REGEX_TELEPHONE @"^0\\d{2,3}"




@implementation NSString (Helper)

+(BOOL)isContainsEmoji:(NSString *)string {
    __block BOOL isEomji = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         const unichar hs = [substring characterAtIndex:0];
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     isEomji = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 isEomji = YES;
             }
         } else {
             if (0x2100 <= hs && hs <= 0x27ff && hs != 0x263b) {
                 isEomji = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 isEomji = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 isEomji = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 isEomji = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50|| hs == 0x231a ) {
                 isEomji = YES;
             }
         }
     }];
    return isEomji;
}


// schedule_type;'进度状态(0未报名、1报名中、2待支付、3已支付、4已报名、5未开始、6学习中、7待报考、8待考试、9已考试、10已通过、11待补考、12待长训
-(NSString *)tateOne {
    
    NSInteger typeInt = self.intValue;
    switch (typeInt) {
        case 0:
            return @"未报名";
            break;
        case 10:
            return @"报名信息提交成功，请等待驾考顾问联系！";
            break;
        case 20:
            return @"您的资料正在审核，请耐心等候！";
            break;
        case 30:
            return @"您的资料已审核通过，请在线支付费用完成报名！";
            break;
        case 35:
            return @"您的资料已审核通过，请在线支付费用完成报名！";
            break;
        case 40:
            return @"您已成功报名，可预约科目一理论上课！";
            break;
        case 50:
            return @"未开始";
            break;
        case 60:
            return @"学习中";
            break;
        case 70:
            return @"待报考";
            break;
        case 80:
            return @"待考试";
            break;
        case 90:
            return @"已考试";
            break;
        case 100:
            return @"已通过";
            break;
        case 110:
            return @"待补考";
            break;
        case 120:
            return @"待长训";
            break;
        default:
            return @"";
            break;
    }
}

//进度状态 报名状态返回
-(NSString *)learnStateZero{
    NSInteger learnStateInt = self.intValue;
    
    if (learnStateInt == 10) {
        return @"报名信息提交成功,请等待驾考顾问联系！";
    }else if (learnStateInt == 20) {
        return @"您的资料正在审核,请耐心等候！";
    }else if (learnStateInt == 30) {
        return @"您的资料已审核通过,请在线支付费用完成报名！";
    }else if (learnStateInt == 35){
        return @"亲，您已报名并付款成功！";
    }else if (learnStateInt == 40){
        return @"您已成功报名，可预约科目一理论上课！";
    }else{
        return @"亲，您还没报名，想拿证快，请选宜快！";
    }
}


- (NSString *)urlEncodedString {
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(__bridge CFStringRef)self,NULL, CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                                             kCFStringEncodingUTF8));
    return result;
}

- (NSString *)MD5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    unsigned int cStrLen = (CC_LONG)strlen(cStr);
    CC_MD5( cStr, cStrLen, result );
    
    NSMutableString *target = [NSMutableString string];
    for(int i = 0; i < 16; ++ i) {
        [target appendFormat:@"%02x", result[i]];
    }
    return target;
    
}

//是否纯数字
- (BOOL)isPureInteger
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

/// 是否是手机号码
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    if (mobileNum.length != 11)
    {
        return NO;
    }
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
     * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     * 联通号段: 130,131,132,155,156,185,186,145,176,1709
     * 电信号段: 133,153,180,181,189,177,1700
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
     */
    NSString *CM = @"(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
    /**
     * 中国联通：China Unicom
     * 130,131,132,155,156,185,186,145,176,1709
     */
    NSString *CU = @"(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
    /**
     * 中国电信：China Telecom
     * 133,153,180,181,189,177,1700
     */
    NSString *CT = @"(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
    
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

//判断是否为浮点数
- (BOOL)isPureFloat{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

//是否是手机号码
- (BOOL)isMobileNumber
{
    if (self.length == 11)
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", REGEX_MOBILE];
        if ([predicate evaluateWithObject:self]) {
            return YES; 
        }
    }
    return NO;
}
//判断是否是验证码
- (BOOL)isVcode{

    if (self.length >= 4)
    {
        if( ![self isPureInteger] || ![self isPureFloat])
        {
            //        resultLabel.textColor = [UIColor redColor];
            //        resultLabel.text = @"警告:含非法字符，请输入纯数字！";
            NSLog(@"JFJKD");
            return NO;
        }
        return YES;
    }
    return NO;
}

//pandua
-(BOOL)isPwd{
    
    if (self.length >= 6 && self.length <= 16) {
        NSCharacterSet *nameCharacters = [[NSCharacterSet characterSetWithCharactersInString:@"_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"] invertedSet];
        NSRange userNameRange = [self rangeOfCharacterFromSet:nameCharacters];
        if (userNameRange.location != NSNotFound) {
            NSLog(@"包含特殊字符");
            return NO;
        }
        return YES;
    }
    return NO;
}
//是否是固定电话号码
//- (BOOL)isTelephoneNumber
//{
//    if (self.length == 11 || self.length == 12) {
////        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", REGEX_TELEPHONE];
////        if ([predicate evaluateWithObject:self]) {
////            return YES;
////        }
//        NSRange range = [self rangeOfRegex:REGEX_TELEPHONE];
//        return range.length > 2 && range.location == 0;
//    }
//    return NO;
//}


- (NSString *)mobileNumber
{
    if (self.length == 11) {
        //正则匹配是否合法的手机号码
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", REGEX_MOBILE];
        if ([predicate evaluateWithObject:self]) {
            return self;
        }
    }
    return nil;
}


+(BOOL)isEmpty:(NSString *) str
{
    if (!str) {
        return true;
    } else {
        
        //A character set containing only the whitespace characters space (U+0020) and tab (U+0009) and the newline and nextline characters (U+000A–U+000D, U+0085).
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        //Returns a new string made by removing from both ends of the receiver characters contained in a given character set.
        NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
        
        if ([trimedString length] == 0) {
            return true;
        } else {
            return false;
        }
    }
}

- (NSString*)toHexRC4WithKey:(NSString*)key
{
    int j = 0;
    unichar res[self.length];
    unsigned char s[256];
    for (int i = 0; i < 256; i++)
    {
        s[i] = i;
    }
    for (int i = 0; i < 256; i++)
    {
        j = (j + s[i] + [key characterAtIndex:(i % key.length)]) % 256;
        
        unsigned char c = s[i];
        s[i] = s[j];
        s[j] = c;
    }
    
    int i = j = 0;
    
    for (int y = 0; y < self.length; y++)
    {
        i = (i + 1) % 256;
        j = (j + s[i]) % 256;
        
        unsigned char c = s[i];
        s[i] = s[j];
        s[j] = c;
        
        unsigned char f = [self characterAtIndex:y] ^ s[ (s[i] + s[j]) % 256];
        res[y] = f;
    }
    
    NSMutableString *dest = [NSMutableString string];
    for (int i = 0; i < self.length; i++) {
        [dest appendFormat:@"%02x", res[i]];
    }
    
    return dest;
}

//- (NSString *)toPhoneFormat
//{
//    if (self.length > 3 && self.length <= 11) {
//        //手机号码
//        NSString *regex = @"^1[3458]";
//        NSRange range = [self rangeOfRegex:regex];
//        if (range.length > 0) {
//            if (self.length < 8) {
//                return [NSString stringWithFormat:@"%@ %@", [self substringToIndex:3], [self substringFromIndex:3]];
//            }
//            return [NSString stringWithFormat:@"%@ %@ %@", [self substringToIndex:3], [self substringWithRange:NSMakeRange(3, 4)], [self substringFromIndex:7]];
//        }
//    }
//    if (self.length > 3 && self.length <= 12) {
//        NSString *regex = @"^0\\d{2,3}";
//        NSRange range = [self rangeOfRegex:regex];
//        if (range.length > 0) {
//            int index = ([self characterAtIndex:1] <= '2') ? 3 : 4;
//            return [NSString stringWithFormat:@"%@ %@", [self substringToIndex:index], [self substringFromIndex:index]];
//        }
//    }
//
//    return self;
//}

//- (NSString *)areaNumber
//{
//    NSRange range = [self rangeOfRegex:REGEX_TELEPHONE];
//    if (range.length > 0) {
//        NSString *str = [self substringWithRange:range];
//        if ([str characterAtIndex:2] <= '2')
//        {
//            return [str substringToIndex:3];
//        }
//        else{
//            if (str.length <= 3) {
//                return nil;
//            }
//            return str;
//        }
//    }
//    return nil;
//}

//解码URL
-(NSString*)urlDecodedString {
    char words[self.length];
    int k = 0;
    
    for (int i = 0; i < self.length; i++, k++) {
        unichar ch = [self characterAtIndex:i];
        if (ch == '%') {
            NSString* s = [self substringWithRange:NSMakeRange(i+1, 2)];
//            int n = [NSString intValueFromHexString:s];
            int n = [s intValue];
            if (n >= 128) {
                n -= 256;
            }
            words[k] = n;
            i += 2;
        } else {
            words[k] = ch;
        }
    }
    
    words[k] = 0;
    
    __autoreleasing NSString *urlDecodedStr;
    urlDecodedStr = [NSString stringWithUTF8String:words];
    
    return urlDecodedStr;
}


//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}



@end

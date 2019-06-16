//
//  NSString+common.m
//  GXQApp
//
//  Created by jinfuzi on 14-2-26.
//  Copyright (c) 2014年 jinfuzi. All rights reserved.
//

#import "NSString+common.h"

#import <CommonCrypto/CommonDigest.h>
#import "NSDate+Common.h"

@implementation NSString (Common)

+(NSString*)stringWithFileSize:(unsigned long long)size {
    
    if (size < 1000) {
        return [NSString stringWithFormat:@"%llu", size];
    } else if(size < 1000 * 1024){
        return [NSString stringWithFormat:@"%.2fKB", size / 1024.0];
    } else if(size < 1000 * 1024 * 1024){
        return [NSString stringWithFormat:@"%.2fMB", size / (1024.0 * 1024)];
    } else {
        return [NSString stringWithFormat:@"%.2fGB", size / (1024.0 * 1024 * 1024)];
    }
    
}

+(BOOL)isEmptyString:(NSString *)str {
    
    if (str) {
        const char* ch = [str cStringUsingEncoding:NSUTF8StringEncoding];
        while (*ch) {
            switch (*ch) {
                case ' ' :
                case '\n':
                case '\r':
                case '\t':
                    break;
                default:
                    return NO;
            }
            ch++;
        }
    }
    return YES;
}

+(NSString*)stringFrom:(NSString*)src withRegex:(NSString*)regex {
    
    NSRegularExpression* o_regex = [NSRegularExpression regularExpressionWithPattern:regex
                                                                             options:0 error:nil];
    NSTextCheckingResult* ret = [o_regex firstMatchInString:src options:0
                                                      range:NSMakeRange(0, src.length)];
    if (ret && ret.range.location != NSNotFound) {
        if (ret.numberOfRanges > 1) {
            return [src substringWithRange:[ret rangeAtIndex:1]];
        } else {
            return [src substringWithRange:ret.range];
        }
    }
    
    return nil;
}

+(int)intValueFromHexString:(NSString*)hex {
    hex = [hex lowercaseString];
    if ([hex hasPrefix:@"0x"]) {
        hex = [hex substringFromIndex:2];
    }
    int ret = 0;
    const char* ch = [hex UTF8String];
    int length = (int)hex.length;
    for (int i = length - 1; i >= 0; i--) {
        if (ch[i] >= '0' && ch[i] <= '9') {
            ret += (ch[i] - '0') * powf(16, (length - 1 - i));
        } else if(ch[i] >= 'a' && ch[i] <= 'f') {
            ret += (ch[i] - 'a' + 10) * powf(16, (length - 1 - i));
        }
    }
    return ret;
}

+(NSString *)stringFromArray:(NSArray *)array withDelimiter:(NSString *)delimiter {
    NSMutableString* str = [[NSMutableString alloc] init];
    for (int i = 0; i < array.count; i++) {
        NSString* s = [array objectAtIndex:i];
        [str appendString:s];
        if (i < array.count - 1) {
            [str appendString:delimiter];
        }
    }
    return str;
}

+(NSString*)urlEncodedWtihDictionary:(NSDictionary*)dictionary {
    NSMutableString* string = [[NSMutableString alloc] init];
    NSArray* keys = dictionary.allKeys;
    for (int i = 0; i < keys.count; i++) {
        NSString* key = [keys objectAtIndex:i] ;
        NSString* value = [dictionary objectForKey:key];
        key = [key urlEncodedString];
        value = [value urlEncodedString];
        [string appendFormat:@"%@=%@", key, value];
        if (i < keys.count - 1) {
            [string appendString:@"&"];
        }
    }
    return [NSString stringWithString:string];
}


//生成32的随机数
+(NSString*)return32BitsRandomString{
    
    NSMutableString* randomString = @"".mutableCopy;
    
    NSArray* dateSource = @[
                            
                            @"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",
                            @"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",
                            @"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",
                            @"U",@"V",@"W",@"X",@"Y",@"Z"
        
                            ];
    
    for (int i = 0; i < 32; i++ ) {
        
         int  randomNumber =  arc4random_uniform(36);
        
        [randomString appendString:dateSource[randomNumber]];
        
        
    }
    
        return randomString;
    
}

- (NSString *)urlEncodedString {
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(__bridge CFStringRef)self,NULL, CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                                             kCFStringEncodingUTF8));
	return result;
}

-(NSString*)urlDecodedString {
    char words[self.length];
    int k = 0;
    
    for (int i = 0; i < self.length; i++, k++) {
        unichar ch = [self characterAtIndex:i];
        if (ch == '%') {
            NSString* s = [self substringWithRange:NSMakeRange(i+1, 2)];
            int n = [NSString intValueFromHexString:s];
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
    
    return [NSString stringWithUTF8String:words];
}


-(NSString *)md5HexDigest
{
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}


-(NSString *)md5HexDigestWithASCIIStringEncoding
{
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}


-(BOOL)isValidateEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}


/*手机号码验证 */
-(BOOL) isValidateMobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
//    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSString *phoneRegex = @"^((13[0-9])|(15[0-9])|(17[0-9])|(18[0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    
    return [phoneTest evaluateWithObject:self];
}




/////////////////////////////////
#pragma mark - by xp start -
/////////////////////////////////////
//getNSDocumentDirectoryFilePath
+(NSString *)getNSDocumentDirectoryFilePath:(NSString *)fileName{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:fileName];
}

+(NSMutableString *)replaceAllString:(NSString *)str1 WithString:(NSString *)str2 forString:(NSMutableString *)str{
    NSRange range = [str rangeOfString:str1];
    while (range.length>0) {
        [str replaceCharactersInRange:range withString:str2];
        range = [str rangeOfString:str1];
    }
    return str;
}

- (NSMutableString *)replaceAllString:(NSString *)str1 WithString:(NSString *)str2{
    if (self) {
        NSMutableString *str = [NSMutableString stringWithString:self];
        NSRange range = [str rangeOfString:str1];
        while (range.length>0) {
            [str replaceCharactersInRange:range withString:str2];
            range = [str rangeOfString:str1];
        }
        return str;
    }
    
    return nil;
}

//isValidateStr
-(BOOL)isValidateStr{
    if (self && ![self isEqualToString:@""] && ![self isEqualToString:@"(null)"]) {
        return true;
    }
    return false;
}

/**
 * 身份证号码验证
 */

-(BOOL)validateIdentityCard
{
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    
    if ([self chk18PaperId:self]) {
        NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
        NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
        return [identityCardPredicate evaluateWithObject:self];
    }
    return NO;
}


/**
 * 台湾通行证
 */

-(BOOL)validateTaiWanCard{
    
    
    NSString *regex1 = @"^[0-9]{8}$/";
    
    NSString* regex2 = @"^[0-9]{10}$";
    
    NSPredicate *taiwanCardPredicate1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex1];
    
    NSPredicate *taiwanCardPredicate2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    
    return [taiwanCardPredicate1 evaluateWithObject:self] || [taiwanCardPredicate2 evaluateWithObject:self];
    
}



/**
 * 护照
 */

-(BOOL)validatePassportCard{
    
    
    NSString *regex1 = @"^[a-zA-Z]{5,17}$/";
    
    NSString* regex2 = @"^[a-zA-Z0-9]{5,17}$";
    
    NSPredicate *taiwanCardPredicate1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex1];
    
    NSPredicate *taiwanCardPredicate2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    
    return [taiwanCardPredicate1 evaluateWithObject:self] || [taiwanCardPredicate2 evaluateWithObject:self];
    
}




/**
 * 港澳通行证
 */

-(BOOL)validateHKPassCard{
    
    NSString *regex = @"^[HMhm]{1}([0-9]{10}|[0-9]{8})$";
    
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    return [identityCardPredicate evaluateWithObject:self];
    
}



///////////////////////////////////
#pragma mark - 身份证号码验证 - start
//////////////////////////////////////////
/**
 * 功能:获取指定范围的字符串
 * 参数:字符串的开始小标
 * 参数:字符串的结束下标
 */
-(NSString *)getStringWithRange:(NSString *)str Value1:(NSInteger)value1 Value2:(NSInteger)value2;
{
    return [str substringWithRange:NSMakeRange(value1,value2)];
}

/*
 * 功能:判断是否在地区码内
 * 参数:地区码
 */
-(BOOL)areaCode:(NSString *)code
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    [dic setObject:@"北京" forKey:@"11"];
    [dic setObject:@"天津" forKey:@"12"];
    [dic setObject:@"河北" forKey:@"13"];
    [dic setObject:@"山西" forKey:@"14"];
    [dic setObject:@"内蒙古" forKey:@"15"];
    [dic setObject:@"辽宁" forKey:@"21"];
    [dic setObject:@"吉林" forKey:@"22"];
    [dic setObject:@"黑龙江" forKey:@"23"];
    [dic setObject:@"上海" forKey:@"31"];
    [dic setObject:@"江苏" forKey:@"32"];
    [dic setObject:@"浙江" forKey:@"33"];
    [dic setObject:@"安徽" forKey:@"34"];
    [dic setObject:@"福建" forKey:@"35"];
    [dic setObject:@"江西" forKey:@"36"];
    [dic setObject:@"山东" forKey:@"37"];
    [dic setObject:@"河南" forKey:@"41"];
    [dic setObject:@"湖北" forKey:@"42"];
    [dic setObject:@"湖南" forKey:@"43"];
    [dic setObject:@"广东" forKey:@"44"];
    [dic setObject:@"广西" forKey:@"45"];
    [dic setObject:@"海南" forKey:@"46"];
    [dic setObject:@"重庆" forKey:@"50"];
    [dic setObject:@"四川" forKey:@"51"];
    [dic setObject:@"贵州" forKey:@"52"];
    [dic setObject:@"云南" forKey:@"53"];
    [dic setObject:@"西藏" forKey:@"54"];
    [dic setObject:@"陕西" forKey:@"61"];
    [dic setObject:@"甘肃" forKey:@"62"];
    [dic setObject:@"青海" forKey:@"63"];
    [dic setObject:@"宁夏" forKey:@"64"];
    [dic setObject:@"新疆" forKey:@"65"];
    [dic setObject:@"台湾" forKey:@"71"];
    [dic setObject:@"香港" forKey:@"81"];
    [dic setObject:@"澳门" forKey:@"82"];
    [dic setObject:@"国外" forKey:@"91"];
    
    if ([dic objectForKey:code] == nil) {
        return NO;
    }
    
    return YES;
}

/*
 * 功能:验证身份证是否合法
 * 参数:输入的身份证号
 */

-(BOOL)chk18PaperId:(NSString *)sPaperId
{
    //判断位数
    if ([sPaperId length] != 15 && [sPaperId length] != 18) {
        return NO;
    }
    
    NSString *carid = sPaperId;
    long lSumQT = 0;
    //加权因子
    int R[] ={7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 };
    //校验码
    unsigned char sChecker[11]={'1','0','X', '9', '8', '7', '6', '5', '4', '3', '2'};
    
    //将15位身份证号转换成18位
    NSMutableString *mString = [NSMutableString stringWithString:sPaperId];
    if ([sPaperId length] == 15) {
        [mString insertString:@"19" atIndex:6];
        
        long p = 0;
        const char *pid = [mString UTF8String];
        
        for (int i=0; i<=16; i++)
        {
            p += (pid[i]-48) * R[i];
        }
        
        int o = p%11;
        
        NSString *string_content = [NSString stringWithFormat:@"%c",sChecker[o]];
        [mString insertString:string_content atIndex:[mString length]];
        
        carid = mString;
    }
    
    //判断地区码
    NSString * sProvince = [carid substringToIndex:2];
    if (![self areaCode:sProvince]) {
        return NO;
    }
    
    //判断年月日是否有效
    //年份
    int strYear = [[self getStringWithRange:carid Value1:6 Value2:4] intValue];
    //月份
    int strMonth = [[self getStringWithRange:carid Value1:10 Value2:2] intValue];
    //日
    int strDay = [[self getStringWithRange:carid Value1:12 Value2:2] intValue];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    
    //Bug Fix START 2014.12.08 App version :1.5
    //V1.5以前都存在的bug
    //当系统时间设置为12小时制时，日期格式用大写的HH会导致dateformatter不能生成date
    //这样就误判了身份证的年月日
#if 0
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
#else
    //获取系统是24小时制或者12小时制
    NSString *formatStringForHours = [NSDateFormatter dateFormatFromTemplate:@"j" options:0 locale:[NSLocale currentLocale]];
    NSRange containsA = [formatStringForHours rangeOfString:@"a"];
    BOOL hasAMPM = containsA.location != NSNotFound;
    if (hasAMPM) {
        //hasAMPM==TURE为12小时制，否则为24小时制
        //12小时制的日期要用小写的h
        [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    }
    else
    {
        //24小时制的日期要用大写的H
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
#endif
    //Bug Fix END 2014.12.08 App version :1.5
    
    NSDate *date = [dateFormatter dateFromString:[NSString stringWithFormat:@"%d-%d-%d 12:01:01",strYear,strMonth,strDay]];
    if (date == nil) {
        return NO;
    }
    
    const char *PaperId  = [carid UTF8String];
    //检验长度
    if( 18 != strlen(PaperId)) return -1;
    
    //校验数字
    for (int i=0; i<18; i++)
    {
        if (!isdigit(PaperId[i]) && !(('X' == PaperId[i] || 'x' == PaperId[i]) && 17 == i))
        {
            return NO;
        }
    }
    
    //验证最末的校验码
    for (int i=0; i<=16; i++)
    {
        lSumQT += (PaperId[i]-48) * R[i];
    }
    if (sChecker[lSumQT%11] != PaperId[17])
    {
        return NO;
    }
    
    return YES;
}


///////////////////////////////////
#pragma mark - 身份证号码验证 - end
//////////////////////////////////////////

/**
 * 计算指定时间与当前的时间差
 * @param compareDate   某一指定时间
 * @return 多少(秒or分or天or月or年)+前 (比如，3天前、10分钟前)
 */

+ (NSString *)compareCurrentTime:(NSDate*)compareDate{
    
    NSTimeInterval timeInterval = [compareDate timeIntervalSinceNow];
    //使用服务端系统时间
  //  timeInterval = [compareDate timeIntervalSinceDate:[NSDate localDataWithTimeIntervalSince1970:[[_LOGIC getValueForKey:@"STIMESTAMP"] longLongValue]]];
    
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    return  result;
}

-(BOOL)isQuote{
    if([self isEqualToString:@""]){
        return YES;
    }else{
        return NO;
    }
}

+(BOOL)isNSNullOrNil:(NSObject *)object{
    if([object isKindOfClass:[NSNull class]] || object == nil){
        return YES;
    }else{
        return NO;
    }
}
@end

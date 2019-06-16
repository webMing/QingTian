//
//  NSDate+Common.m

//

#import "NSDate+Common.h"

@implementation NSDate (Common)

#pragma mark - 工具函数
#pragma mark -获取时间戳

+ (NSString * )getTimeStamp
{
    //NSTimeInterval double 类型.
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[date timeIntervalSince1970];
    NSString * key = [NSString stringWithFormat:@"%.0f", a];
    return key;
}


//传入的时间戳是 北京时间的时间戳.
+ (NSString* )getStart:(NSString*)startTime AndEndTime:(NSString*)endTime{
    
    //传入的参数都是时间戳.
    NSDateFormatter* formatter1 = [[NSDateFormatter alloc] init];
    
    [formatter1 setDateStyle:NSDateFormatterMediumStyle];
    [formatter1 setTimeStyle:NSDateFormatterShortStyle];
    [formatter1 setDateFormat:@"YYYY.MM.dd HH:mm"];
    
    
    NSDateFormatter* formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateStyle:NSDateFormatterMediumStyle];
    [formatter2 setTimeStyle:NSDateFormatterShortStyle];
    [formatter2 setDateFormat:@"HH:mm"];
   
    NSTimeInterval time0=[startTime doubleValue] ;//+28800;//因为时差问题要加8小时 == 28800 sec
    NSTimeInterval time1=[endTime doubleValue];
    
    NSDate *startDate=[NSDate dateWithTimeIntervalSince1970:time0];
    NSDate *endDate=[NSDate dateWithTimeIntervalSince1970:time1];
    
    NSString* startStr = [formatter1 stringFromDate:startDate];
    NSString* endStr = [formatter2 stringFromDate:endDate];
    
    NSString* str = [NSString stringWithFormat:@"%@ - %@",startStr,endStr];
    
    return str;
    
    
}

//传入的参数是时间戳...
+ (NSString *)timeString:(NSString *)str{
    
  // NSString *str=@"1368082020";//时间戳
    NSTimeInterval time=[str doubleValue];//+28800;
    
 //因为时差问题要加8小时 == 28800 sec
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
     //设定时间格式,这里可以设置成自己需要的格式
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    NSString *currentDateStr = [dateFormatter stringFromDate:detaildate];
    
    return currentDateStr;
}


//=======================================万能滴=================================

+ (NSString *)transformToDateWithTimeInterval:(NSTimeInterval)interval  formaterString:(NSString*)string
{
    
    //NSString *str=@"1368082020";//时间戳
    //NSTimeInterval time=[str doubleValue];//+28800;
    
    //因为时差问题要加8小时 == 28800 sec
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:interval];
    
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //设定时间格式,这里可以设置成自己需要的格式
    //[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    [dateFormatter setDateFormat:string];
    
    NSString *currentDateStr = [dateFormatter stringFromDate:detaildate];
    
    return currentDateStr;
    
    
}


//===================================把任意的时间转换为时间戳============================
+(NSTimeInterval)transformToTimeStampWithDateFormaterString:(NSString*)formaterString String:(NSString*)dateString
{
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:formaterString];
    
    NSDate*  date = [dateFormatter dateFromString:dateString];
    
    return [date timeIntervalSince1970];
}

/// 判断是否是今天
+ (BOOL)compareDate:(NSDate *)date{
    
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    
    NSDate *today = [[NSDate alloc] init];
    
    NSDate *tomorrow, *yesterday;
    
    tomorrow = [today dateByAddingTimeInterval: secondsPerDay];
    
    yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
    
    // 10 first characters of description is the calendar date:
    NSString * todayString = [[today description] substringToIndex:10];
    
    NSString * yesterdayString = [[yesterday description] substringToIndex:10];
    
    NSString * tomorrowString = [[tomorrow description] substringToIndex:10];
    
    NSString * dateString = [[date description] substringToIndex:10];
    
    if ([dateString isEqualToString:todayString])
    {
        return YES;
        
    } else if ([dateString isEqualToString:yesterdayString])
    {
        return NO;
        
    }else if ([dateString isEqualToString:tomorrowString])
    {
        return NO;
    }
    else
    {
        return NO;
    }
    
    
}

/// 根据时间戳返回时间字符串
+(NSString *)displayDateStrWithTimeStamp:(NSUInteger)timeStamp{
    
    NSDate *displayDate=[NSDate dateWithTimeIntervalSince1970:timeStamp];
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *nowComponent = [calendar components:unitFlags fromDate:now];
    NSDateComponents *displayComponent = [calendar components:unitFlags fromDate:displayDate];
    int nowYear = [nowComponent year];
 // int nowMonth = [nowComponent month];
    int nowDay = [nowComponent day];
    
    int displayYear = [displayComponent year];
    int displayMonth = [displayComponent month];
    int displayDay = [displayComponent day];
    
    if(displayYear != nowYear){
        return [NSString stringWithFormat:@"%d年%d月%d日",displayYear,displayMonth,displayDay];
    }else if (displayYear == nowYear && displayDay != nowDay){
        return [NSString stringWithFormat:@"%d月%d日",displayMonth,displayDay];
    }else{
        return @"今天";
    }
}

@end

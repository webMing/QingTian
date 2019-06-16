//
//  NSDate+Common.h
//  iOS_ChiHaoDian
//
//  Created by xiao jocky on 15/8/18.
//  Copyright (c) 2015年 wangsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Common)

#pragma mark -获取时间戳
+ (NSString * )getTimeStamp;

//开始时间和结束时间拼成时间NSString
+ (NSString* )getStart:(NSString*)startTime AndEndTime:(NSString*)endTime;


//时间 和
+ (NSString *)timeString:(NSString *)str;


+ (NSString *)transformToDateWithTimeInterval:(NSTimeInterval)interval  formaterString:(NSString*)string;


+(NSTimeInterval)transformToTimeStampWithDateFormaterString:(NSString*)formaterString String:(NSString*)dateString;

/// 判断是否是今天
+ (BOOL)compareDate:(NSDate *)date;

/// 根据时间戳返回时间字符串
+(NSString *)displayDateStrWithTimeStamp:(NSUInteger)timeStamp;


@end

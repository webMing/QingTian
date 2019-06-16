//
//  NSCalendar+XMGExtension.h
//
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCalendar (XMGExtension)
+ (instancetype)calendar;
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate;
+(NSString*)getChineseCalendarWithDate:(NSDate *)date;
@end

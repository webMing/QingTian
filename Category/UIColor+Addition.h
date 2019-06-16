//
//  UIColor+Addition.h
//  iOS_common
//
//  Created by shjy on 13-6-1.
//  Copyright (c) 2013年 0xn.net. All rights reserved.
//

#import <UIKit/UIKit.h>

#define C_COLOR_SEL_FORMAT @"eventColor_%d"
#define C_COLOR_SEL_COUNT 4
#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define HexRGBAlpha(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

@interface UIColor (Addition)

+(UIColor*) colorWithWebStr:(NSString*)webStr;
+(UIColor*) colorWithColorStr:(NSString*)colorStr;
+(UIColor*) colorWithTime:(NSTimeInterval)time;
+(UIColor*) colorWithCount:(NSInteger)count;

+(UIColor*) workColor;
+(UIColor*) eatColor;
+(UIColor*) eventColor_0;
+(UIColor*) eventColor_1;
+(UIColor*) eventColor_2;
+(UIColor*) eventColor_3;
+(UIColor*) sleepColor;
+(UIColor*) lazyColor;

+(UIColor*) safelyColor;
+(UIColor*) warningColor;
+(UIColor*) dangerousColor;
+ (UIColor*) colorWithHex:(NSInteger)hexValue;
+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
@end

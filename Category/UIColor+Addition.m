//
//  UIColor+Addition.m
//  iOS_common
//
//  Created by shjy on 13-6-1.
//  Copyright (c) 2013年 0xn.net. All rights reserved.
//

#import "UIColor+Addition.h"

@implementation UIColor (Addition)

#pragma mark - private

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

#pragma mark - public

+(UIColor *)colorWithWebStr:(NSString *)webStr
{
    NSString *colorString = [[webStr stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            [NSException raise:@"Invalid color value" format: @"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", webStr];
            break;
    }
    
    UIColor* result = [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
    
    return result;
}

+(UIColor *)colorWithColorStr:(NSString *)colorStr
{
    UIColor* result = nil;
    
    if ([colorStr isEqualToString:@"sleepColor"]) {
        result = [UIColor sleepColor];
    } else if ([colorStr isEqualToString:@"eatColor"]) {
        result = [UIColor eatColor];
    } else if ([colorStr isEqualToString:@"workColor"]) {
        result = [UIColor workColor];
    } else if ([colorStr isEqualToString:@"eventColor_0"]) {
        result = [UIColor eventColor_0];
    } else if ([colorStr isEqualToString:@"eventColor_1"]) {
        result = [UIColor eventColor_1];
    } else if ([colorStr isEqualToString:@"eventColor_2"]) {
        result = [UIColor eventColor_2];
    } else if ([colorStr isEqualToString:@"eventColor_3"]) {
        result = [UIColor eventColor_3];
    } else {
        result = [UIColor lazyColor];
    }
    
    return result;
}

+(UIColor *)colorWithTime:(NSTimeInterval)time
{
    UIColor* result = [UIColor dangerousColor];
    CGFloat halfDay = time / (12 * 60 * 60);
    
    if (halfDay < 1.f) {
        result = [UIColor safelyColor];
    } else if (halfDay < 2.f) {
        result = [UIColor warningColor];
    }
    
    return result;
}

+(UIColor *)colorWithCount:(NSInteger)count
{
    CGFloat tGrayLevel = 0.75 - count * .05f;
    if (tGrayLevel < 0.1f) {
        tGrayLevel = 0.1f;
    }
    CGFloat tSaturation = .3f * tGrayLevel;
//    UIColor* result = [UIColor colorWithWhite:tGrayLevel alpha:1.0f];
    UIColor* result = [UIColor colorWithHue:.713 saturation:tSaturation  brightness:tGrayLevel alpha:1.f];
    
    return result;
}

+(UIColor *)workColor
{
    return [UIColor redColor];
}

+(UIColor *)eatColor
{
    return [UIColor orangeColor];
}

+(UIColor *)eventColor_0
{
    return [UIColor yellowColor];
}

+(UIColor *)eventColor_1
{
    return [UIColor greenColor];
}

+(UIColor *)eventColor_2
{
    return [UIColor cyanColor];
}

+(UIColor *)eventColor_3
{
    return [UIColor blueColor];
}

+(UIColor *)sleepColor
{
    return [UIColor purpleColor];
}

+(UIColor *)lazyColor
{
    return [UIColor blackColor];
}

+(UIColor *)safelyColor
{
    return [UIColor colorWithWebStr:@"62d446"];
}

+(UIColor *)warningColor
{
    return [UIColor colorWithWebStr:@"d47046"];
}

+(UIColor *)dangerousColor
{
    return [UIColor colorWithWebStr:@"d44662"];
}

+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

+ (UIColor*) colorWithHex:(NSInteger)hexValue
{
    return [UIColor colorWithHex:hexValue alpha:1.0];
}
@end

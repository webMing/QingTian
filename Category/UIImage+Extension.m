//
//  UIImage+Extension.m
//  BusManager
//
//  Created by tangzhiqiang on 17/2/6.
//  Copyright © 2017年 com.yjihua. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
/// 根据颜色创建图片
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f); //宽高 1.0只要有值就够了
    UIGraphicsBeginImageContext(rect.size); //在这个范围内开启一段上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);//在这段上下文中获取到颜色UIColor
    CGContextFillRect(context, rect);//用这个颜色填充这个上下文
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    //从这段上下文中获取Image属性,,,结束
    UIGraphicsEndImageContext();
    
    return image;
}

/// 中点拉伸图片
+(UIImage *)stretchableImageWithImageName:(NSString *)imageName{
    UIImage *oldImg = [UIImage imageNamed:imageName];
    NSInteger leftCapWidth = oldImg.size.width * 0.5f;
    // 顶端盖高度
    NSInteger topCapHeight = oldImg.size.height * 0.5f;
    
    // 重新赋值
    return [oldImg stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
}
@end

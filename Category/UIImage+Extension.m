//
//  NSObject+Dealloc.h
//  QingTian
//
//  Created by Stephanie on 2019/6/17.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
+(UIImage *)stretchableImageWithImageName:(NSString *)imageName{
    UIImage *oldImg = [UIImage imageNamed:imageName];
    NSInteger leftCapWidth = oldImg.size.width * 0.5f;
    NSInteger topCapHeight = oldImg.size.height * 0.5f;
    return [oldImg stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
}
@end

//
//  UIImage+XMGExtension.m
//  5期-百思不得姐
//
//  Created by xiaomage on 15/11/23.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "UIImage+XMGExtension.h"

@implementation UIImage (XMGExtension)
- (instancetype)circleImage
{
    // 开启图形上下文
    //NO:不透明  0：scale不缩放
    UIGraphicsBeginImageContextWithOptions(self.size, YES, 0);

    
    // 上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
     [[UIColor redColor] set];
    
    // 添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    CGContextAddEllipseInRect(ctx, rect);
    
    // 裁剪
    CGContextClip(ctx);
    
    // 绘制图片
    [self drawInRect:rect];
    
    /*
     如果裁剪后没有使用 CGContextAddEllipseInRect(context, rect);
     CGContextStrokePath(context); 这条代码 就会引起背景为白色时看不出来任务效果。*/
    CGContextAddEllipseInRect(ctx, rect);
    
    CGContextStrokePath(ctx);
    
    // 获得图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
}

/// 根据大小裁剪
- (instancetype)circleImageWithSize:(CGSize)size
{
    // 开启图形上下文
    //NO:不透明  0：scale不缩放
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    
    // 上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 添加一个圆
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    CGContextAddEllipseInRect(ctx, rect);
    
    // 裁剪
    CGContextClip(ctx);
    
    // 绘制图片
    [self drawInRect:rect];
    
    /*
    如果裁剪后没有使用 CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context); 这条代码 就会引起背景为白色时看不出来任务效果。*/
    CGContextAddEllipseInRect(ctx, rect);
    
    CGContextStrokePath(ctx);
    
    // 获得图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
}

+ (instancetype)circleImage:(NSString *)name
{
    return [[self imageNamed:name] circleImage];
}

/**
 *  从图片中按指定的位置大小截取图片的一部分
 *
 *  @param image UIImage image 原始的图片
 *  @param rect  CGRect rect 要截取的区域
 *
 *  @return UIImage
 */
+ (UIImage *)ct_imageFromImage:(UIImage *)image inRect:(CGRect)rect{
    
    //把像 素rect 转化为 点rect（如无转化则按原图像素取部分图片）
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat x= rect.origin.x*scale,y=rect.origin.y*scale,w=rect.size.width*scale,h=rect.size.height*scale;
    CGRect dianRect = CGRectMake(x, y, w, h);
    
    //截取部分图片并生成新图片
    CGImageRef sourceImageRef = [image CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, dianRect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    CGImageRelease(newImageRef);
    return newImage;
    
    
}
@end

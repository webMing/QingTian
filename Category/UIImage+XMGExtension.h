//
//  UIImage+XMGExtension.h
//  5期-百思不得姐
//
//  Created by xiaomage on 15/11/23.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XMGExtension)
/**
 *  返回圆形图片
 */
- (instancetype)circleImage;

+ (instancetype)circleImage:(NSString *)name;

/// 根据大小裁剪
- (instancetype)circleImageWithSize:(CGSize)size;

/// 截取图片的一部分 rect要截取的部分
+ (UIImage *)ct_imageFromImage:(UIImage *)image inRect:(CGRect)rect;

@end

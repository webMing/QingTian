//
//  UIImage+Extension.h
//  BusManager
//
//  Created by tangzhiqiang on 17/2/6.
//  Copyright © 2017年 com.yjihua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/// 根据颜色创建图片
+ (UIImage *)imageWithColor:(UIColor *)color;

/// 中点拉伸图片
+(UIImage *)stretchableImageWithImageName:(NSString *)imageName;
@end

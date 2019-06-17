//
//  NSObject+Dealloc.h
//  QingTian
//
//  Created by Stephanie on 2019/6/17.
//  Copyright © 2019 Stephanie. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/// 根据颜色创建图片
+ (UIImage *)imageWithColor:(UIColor *)color;

/// 中点拉伸图片
+(UIImage *)stretchableImageWithImageName:(NSString *)imageName;
@end

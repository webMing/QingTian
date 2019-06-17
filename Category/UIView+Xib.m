//
//  UIView+Xib.m
//  QingTian
//
//  Created by Stephanie on 2019/6/17.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import "UIView+Xib.h"

@implementation UIView (Xib)

+ (instancetype)viewFromXib
{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
}
+ (UINib*)nib {
    return [UINib nibWithNibName:NSStringFromClass(self) bundle:nil];
}

@end

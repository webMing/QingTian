//
//  UINavigationItem+Extention.m
//  QingTian
//
//  Created by Stephanie on 2019/6/17.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import "UINavigationItem+Extention.h"

@implementation UINavigationItem (Extention)

#pragma mark- LifeCicle

#pragma mark- SetUpView

#pragma mark- EventRespone

- (void)leftItemWithTarget:(id)target action:(SEL)action {
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    self.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod


@end

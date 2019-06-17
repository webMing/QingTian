//
//  UIViewController+Initialize.m
//  QingTian
//
//  Created by Stephanie on 2019/6/17.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import "UIViewController+Initialize.h"

@implementation UIViewController (Initialize)
+ (UIViewController *)ViewControllerInitWithNibName:(NSString *)nibName {
    return [[self alloc]initWithNibName:nibName bundle:[NSBundle mainBundle]];
}
+ (UIViewController *)ViewControllerInitWithSelf {
    return [[self alloc]initWithNibName:NSStringFromClass(self) bundle:[NSBundle mainBundle]];
}
+ (UIViewController *)ViewControllerInitWithSB:(NSString *)sbn  className:(NSString *)cn {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbn bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:cn];
}

/***************************************************************************************/

- (void)addLeftBtnItem {
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    //恢复侧滑返回
    self.navigationController.interactivePopGestureRecognizer.delegate =(id<UIGestureRecognizerDelegate>)self;
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

@end

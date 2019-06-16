//
//  QTLoginVC.m
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import "QTLoginVC.h"

@interface QTLoginVC ()

@end

@implementation QTLoginVC

#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark- SetUpView

#pragma mark- EventRespone
- (IBAction)userRegister:(UIButton *)btn {
    UIViewController* vc = InstanceVC(@"Me", @"QTRegisterVC");
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod


@end

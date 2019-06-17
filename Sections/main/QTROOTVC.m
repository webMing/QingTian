//
//  QTROOTVC.m
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import "QTROOTVC.h"
#import "QTTabBarVC.h"

@interface QTROOTVC ()

@end

@implementation QTROOTVC

#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViews];
}
#pragma mark- SetUpView
- (void)setUpViews {
    self.view.backgroundColor = UIColor.whiteColor;
    QTTabBarVC* vc = [[QTTabBarVC alloc]init];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
}
- (void)addCustomViews {
    
}
- (void)layoutCustomViews {
    
}
#pragma mark- EventRespone

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

@end

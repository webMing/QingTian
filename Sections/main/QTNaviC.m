//
//  QTNaviC.m
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import "QTNaviC.h"

@interface QTNaviC ()

@end

@implementation QTNaviC
#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViews];
}
#pragma mark- SetUpView
- (void)setUpViews {
    self.view.backgroundColor = UIColor.whiteColor;
}
- (void)addCustomViews {
    
}
- (void)layoutCustomViews {
    
}
#pragma mark- EventRespone
- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}
#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod


@end

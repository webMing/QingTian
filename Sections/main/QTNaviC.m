//
//  QTNaviC.m
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import "QTNaviC.h"

#import "NaviGestureDelegate.h"

@interface QTNaviC ()
@property (nonatomic, strong) NaviGestureDelegate* gestureDelegate;
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
    
    self.navigationBar.translucent = NO;
    self.navigationBar.barTintColor = QTNavBar;
    self.navigationBar.tintColor = UIColor.whiteColor;
    
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColor.whiteColor,NSFontAttributeName:StePFMediumFontWithSize(17)}];
    
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
   
    self.gestureDelegate = [[NaviGestureDelegate alloc]init];
    self.gestureDelegate.navi = self;
    self.interactivePopGestureRecognizer.delegate = self.gestureDelegate;
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

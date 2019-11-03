//
//  QTTabBarVC.m
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import "QTTabBarVC.h"
#import "QTNaviC.h"

#import "QTLoginVC.h"

#import "UIViewController+Initialize.h"

@interface QTTabBarVC ()

@end

@implementation QTTabBarVC

#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViews];
}

#pragma mark- SetUpView
- (void)setUpViews {
    self.tabBar.backgroundImage = [UIImage new];
    self.tabBar.shadowImage = [UIImage new];
    self.view.backgroundColor = UIColor.whiteColor;
    // Me
    UIViewController* vc = [UIViewController ViewControllerInitWithSB:@"Me" className:@"QTLoginVC"];
    [self addChildViewController:vc title:@"Login" image:@"tabbar_me" selectedImage:@"tabbar_me_highLight"];
    
    // Me1
    vc = [UIViewController ViewControllerInitWithSB:@"Me" className:@"QTMEVC"];
    [self addChildViewController:vc title:@"Home" image:@"tabbar_me" selectedImage:@"tabbar_me_highLight"];
}

- (void)addCustomViews {
    
}
- (void)layoutCustomViews {
    
}

#pragma mark- EventRespone
- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)imageName selectedImage:(NSString *)selectedImageName {
    
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.title = title;

    NSMutableDictionary *textAttr = [NSMutableDictionary dictionary];
    textAttr[NSForegroundColorAttributeName] = QTHexRGB(0xa0acbe);
    textAttr[NSFontAttributeName] = StePFRegularFontWithSize(11);

    NSMutableDictionary *selectedAttr = [NSMutableDictionary dictionary];
    selectedAttr[NSForegroundColorAttributeName] = QTNavBar;
    selectedAttr[NSFontAttributeName] = StePFRegularFontWithSize(11);

    [childController.tabBarItem setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    [childController.tabBarItem setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];

    QTNaviC *nav = [[QTNaviC alloc] initWithRootViewController:childController];
    
    [self addChildViewController:nav];
}

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

@end

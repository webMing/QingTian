//
//  QTMEVC.m
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import "QTMEVC.h"

@interface QTMEVC ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation QTMEVC

#pragma mark- LifeCicle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpCustomViews];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
#pragma mark- SetUpView
- (void)setUpCustomViews{
    QTNeverAutoAjustScrollViewContentInset(self,self.scrollView);
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.edgesForExtendedLayout = UIRectEdgeTop;
    
}
#pragma mark- EventRespone

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

DellocCheck

@end

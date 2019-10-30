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
@property (weak, nonatomic) IBOutlet UIImageView *headImgView;
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
    
    self.headImgView.clipsToBounds = YES;
    self.headImgView.layer.borderColor = UIColor.lightTextColor.CGColor;
    self.headImgView.layer.borderWidth = 2;
    self.headImgView.layer.cornerRadius = 30.0f;
}
#pragma mark- EventRespone
// 文章列表
- (IBAction)articles:(UIControl *)sender {
    
}
#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

DellocCheck

@end

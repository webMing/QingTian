//
//  UIViewController+Initialize.h
//  QingTian
//
//  Created by Stephanie on 2019/6/17.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Initialize)
+ (UIViewController *)ViewControllerInitWithSB:(NSString *)sbn  className:(NSString *)cn;
+ (UIViewController *)ViewControllerInitWithNibName:(NSString *)nibName;
+ (UIViewController *)ViewControllerInitWithSelf;
@end

NS_ASSUME_NONNULL_END

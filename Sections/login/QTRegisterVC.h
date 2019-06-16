//
//  QTRegisterVC.h
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, RegisterVCUseType) {
    UseAsPasswordRetake = 1,
    UseAsRegisterCounter= 2,
};

@interface QTRegisterVC : UIViewController
@property (nonatomic, assign) RegisterVCUseType useType;
@end

NS_ASSUME_NONNULL_END

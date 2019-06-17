//
//  UIView+Xib.h
//  QingTian
//
//  Created by Stephanie on 2019/6/17.
//  Copyright © 2019 Stephanie. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Xib)
+ (UINib*)nib;
+ (instancetype)viewFromXib;

- (void)configureWithObj:(id)obj;
- (void)configureWithDict:(NSDictionary*)dict;

@end

NS_ASSUME_NONNULL_END

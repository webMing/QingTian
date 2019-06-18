//
//  QTIL.h
//  QingTian
//
//  Created by Stephanie on 2019/6/18.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NaviGestureDelegate : NSObject<UIGestureRecognizerDelegate>
@property (nonatomic, weak) UINavigationController* navi;
@end

NS_ASSUME_NONNULL_END

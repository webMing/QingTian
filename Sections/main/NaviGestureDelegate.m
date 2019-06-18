//
//  QTIL.m
//  QingTian
//
//  Created by Stephanie on 2019/6/18.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import "NaviGestureDelegate.h"

@implementation NaviGestureDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == self.navi.interactivePopGestureRecognizer )
    {
          //UIViewController *vc = self.viewControllers.lastObject;
         //禁用某些不支持侧滑返回的页面
         //  if ([vc isKindOfClass:[xxx class]]) {
         //     return NO;
         // }
        //禁用根目录的侧滑手势
        if ( self.navi.viewControllers.count < 2 || self.navi.visibleViewController == [self.navi.viewControllers objectAtIndex:0] )
        {
            return NO;
        }
    }
    return YES;
}
@end

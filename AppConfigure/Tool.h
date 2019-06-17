//
//  Tool.h
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#ifndef Tool_h
#define Tool_h

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT void SteCallPhone(NSString* phoneNumber);

/** 获取 navigationBar 底部坐标;相当于 statusBarHeight + navigationBarHeight */
FOUNDATION_EXPORT CGFloat JXBNavBarMaxYValueWithVC(UIViewController *vc);

/** 禁止 scrollView auto ajsut content inset */
FOUNDATION_EXPORT void JXBNeverAutoAjustScrollViewContentInset(UIViewController *vc,UIScrollView *sc);

#endif /* Tool_h */

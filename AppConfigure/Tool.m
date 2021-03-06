//
//  Tool.m
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//


#import <UIKit/UIKit.h>

inline void SteCallPhone(NSString* phoneNumber){
    NSMutableString * phoneNumberString=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",phoneNumber];
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:completionHandler:)]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumberString] options:@{} completionHandler:nil];
        }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumberString]];
#pragma clang diagnostic pop
        }
    });
    
}

/** 获取 navigationBar 底部坐标;相当于 statusBarHeight + navigationBarHeight */
inline CGFloat QTNavBarMaxYValueWithVC(UIViewController *vc) {
    return CGRectGetMinX(vc.navigationController.navigationBar.frame) + CGRectGetMaxY(vc.navigationController.navigationBar.frame);
}

/** 禁止 scrollView auto ajsut content inset */
void QTNeverAutoAjustScrollViewContentInset(UIViewController *vc,UIScrollView *sc) {
    if (@available(iOS 11.0, *)) {
        sc.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    else {
        vc.automaticallyAdjustsScrollViewInsets = NO;
    }
}


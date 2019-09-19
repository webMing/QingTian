//
//  UIView+STEHUD.m
//
//  Created by Stephanie on 2019/4/3.
//  Copyright © 2019 com.ste.www. All rights reserved.
//

#import "UIView+STEHUD.h"

/**
 *  每个方法的代码都是独立的减少各个代码之间的耦合
 */

@implementation UIView (STEHUD)

/**   only title  */
- (MBProgressHUD *)showHUDWithTitle:(NSString *)title dismissAfter:(NSTimeInterval )time {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    if (!hud) hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = title;
    hud.label.numberOfLines = 0;
    hud.offset = CGPointMake(0, -120);
    if (time > 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES afterDelay:time];
        });
    }
    return hud;
}

/**    title and subTitle */
- (MBProgressHUD *)showHUDWithTitle:(NSString *)title subTitle:(NSString *)subTitle dismissAfter:(NSTimeInterval )time {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    if (!hud) hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = title;
    hud.detailsLabel.text = subTitle;
    hud.offset = CGPointMake(0, -120);
    if (time > 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES afterDelay:time];
        });
    }
    return hud;
}

/**  only activity Indicator  */
- (MBProgressHUD *)showHUDWithActivityIndicatorDismissAfter:(NSTimeInterval )time {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    if (!hud) hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.offset = CGPointMake(0, -120);
    if (time > 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
             [hud hideAnimated:YES afterDelay:time];
        });
    }
    return hud;
}

/**  activity Indicator  and title    */
- (MBProgressHUD *)showHUDWithActivityIndicatorTitle:(NSString*)title  dismissAfter:(NSTimeInterval )time {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    if (!hud) hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = title;
    hud.offset = CGPointMake(0, -120);
    if (time > 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES afterDelay:time];
        });
    }
    return hud;
}

/**  activity Indicator  title  subTitle  */
- (MBProgressHUD *)showHUDWithActivityIndicatorTitle:(NSString*)title subTitle:(NSString *)subTitle dismissAfter:(NSTimeInterval )time {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    if (!hud) hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = title;
    hud.detailsLabel.text = subTitle;
    hud.offset = CGPointMake(0, -120);
    if (time > 0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES afterDelay:time];
        });
    }
    return hud;
}

/** hide hud from view */
- (void)hideHUDAnimated:(BOOL)animated {
    [MBProgressHUD hideHUDForView:self animated:animated];
}

/** remove hud  don`t use this method**/
- (void)removeHUDAnimated:(BOOL)animated  {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    if (hud) {
        [hud hideAnimated:animated];
    }
}

@end

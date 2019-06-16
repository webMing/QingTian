//
//  UIViewController+CustomAlertView.m
//  CustomAlertView
//
//  Created by Stephanie on 16/4/5.
//  Copyright © 2016年 Stephanie. All rights reserved.
//

/* 
 * 其他想法：如果alertView有多个选项可以把一些块放在容器中, 同样的方式用于actionSheet
 */

#import "UIViewController+CustomAlertView.h"
#import <objc/runtime.h>
static char*  kAlertViewCancelKey = "AlertViewCancelKey";
static char*  kAlertViewConfirmKey = "AlertViewConfirmKey";
@interface  UIViewController()<UIAlertViewDelegate>
@end

@implementation UIViewController (CustomAlertView)


- (void)showAlertViewWithString:(NSString *)title
                        message:(NSString *)message
                    cancelTitle:(NSString *)cancelTitle
                    cancelBlock:(void (^)(void))cancelBtnBlock
                   confirmTitle:(NSString *)confirmTitle
                   confirmBlock:(void (^)(void))confirmBlock {
    
    
    UIAlertView*  alertView = [[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:confirmTitle, nil];
    
    objc_setAssociatedObject(alertView, kAlertViewCancelKey, cancelBtnBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    objc_setAssociatedObject(alertView, kAlertViewConfirmKey, confirmBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [alertView show];
    
    
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    alertViewCancelBlock  cancelBlock ;
    alertViewCanfirmBlock canfirmBlock;
    
    /* cancel action */
    if (buttonIndex == alertView.cancelButtonIndex) {
        cancelBlock =  objc_getAssociatedObject(alertView, kAlertViewCancelKey);
        if (cancelBlock) {
            cancelBlock();
        }
        
    }else if (buttonIndex == alertView.firstOtherButtonIndex){
        /* confirm action */
        canfirmBlock = objc_getAssociatedObject(alertView, kAlertViewConfirmKey);
        if (canfirmBlock) {
           canfirmBlock();
        }
        
    }
}
@end

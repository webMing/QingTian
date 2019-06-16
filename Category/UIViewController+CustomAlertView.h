//
//  UIViewController+CustomAlertView.h
//  CustomAlertView
//
//  Created by Apple on 16/4/5.
//  Copyright © 2016年 com.taobus.www. All rights reserved.
//
typedef void(^alertViewCancelBlock)(void);
typedef void(^alertViewCanfirmBlock)(void);
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface UIViewController (CustomAlertView)
-(void)showAlertViewWithString:(NSString*)title
                       message:(NSString *) message
                   cancelTitle:(NSString*)cancelTitle
                   cancelBlock:(void(^)(void))cancelBtnBlock
                  confirmTitle:(NSString* )confirmTitle
                  confirmBlock:(void(^)(void))confirmBlock;


@end

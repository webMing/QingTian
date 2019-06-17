//
//  UIView+STEHUD.h
//
//  Created by Stephanie on 2019/4/3.
//  Copyright © 2019 com.ste.www. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

/**
 *  项目中一般用到的View类型
 *  如果是View: self, self.superView,self.window
 *  如果是VC: self.view, self.navigationController.view
 *    dismissAfter:表示过几秒后 HUD 自动消失.
 */

/**
 *  每个项目中的HUD基本都不大相同(字体大小,颜色方面等等), 这里的只包含项目中80%的情况
 *  如果现有的视图无法满足就直接添加;
 *  返回 MBProgressHUD 提供一个方法对HUD进行小的修改(eg dispaly location)
 */

NS_ASSUME_NONNULL_BEGIN

@interface UIView (STEHUD)

/**   only title  */
- (MBProgressHUD *)showHUDWithTitle:(NSString *)title dismissAfter:(NSTimeInterval )time;
/**    title and subTitle */
- (MBProgressHUD *)showHUDWithTitle:(NSString *)title subTitle:(NSString *)subTitle dismissAfter:(NSTimeInterval )time;

/**  only activity Indicator  */
- (MBProgressHUD *)showHUDWithActivityIndicatorDismissAfter:(NSTimeInterval )time;
/**  activity Indicator  and title    */
- (MBProgressHUD *)showHUDWithActivityIndicatorTitle:(NSString*)title  dismissAfter:(NSTimeInterval )time;
/**  activity Indicator  title  subTitle  */
- (MBProgressHUD *)showHUDWithActivityIndicatorTitle:(NSString*)title subTitle:(NSString *)subTitle dismissAfter:(NSTimeInterval )time;

/** hide hud from view */
- (void)hideHUDAnimated:(BOOL)animated ;

/**
*Other cases can be added according to the requirements of the project
*/

@end


NS_ASSUME_NONNULL_END

//
//  AppDelegate+Service.m
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import "AppDelegate+Service.h"

#import "IQKeyboardManager.h"
#import "QTROOTVC.h"
#import "QTNetWork.h"

#import "SteNetworkSpeedMonitor.h"

@implementation AppDelegate (Service)

#pragma mark- LifeCicle
- (void)setUP {
    
    UIWindow* win = [[UIWindow alloc]initWithFrame:UIScreen.mainScreen.bounds];
    win.backgroundColor = UIColor.whiteColor;
    win.rootViewController = [[QTROOTVC alloc]init];
    self.window = win;
    [self.window makeKeyAndVisible];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
          [self setUpIQKeyboardManager];
          [QTNetWork checkNetConnection];
    });
  
}

#pragma mark- SetUpView

#pragma mark- EventRespone
// configure
- (void)setUpIQKeyboardManager {
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.placeholderFont = [UIFont boldSystemFontOfSize:14];
    manager.enableAutoToolbar = YES;
}

//不要进行网卡监听
- (void)setUpNetworkMonitor {
    SteNetworkSpeedMonitor* m = [SteNetworkSpeedMonitor shareMonitor];
    [m setUploadSpeedBlock:^(NSString * _Nonnull speed) {
        QTLog(@"Upload Speed: %@",speed);
    }];
    [m setDownloadSpeedBlock:^(NSString * _Nonnull speed) {
        QTLog(@"Download Seed: %@",speed);
    }];
    [m startNetworkSpeedMonitor];
}
#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod


@end

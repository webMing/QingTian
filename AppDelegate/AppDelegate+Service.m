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

#import "QTConfigurationHelper.h"

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
          [self fetchUUID];
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

// 获取UUID
- (void)fetchUUID{
    
    NSDictionary* memberDict =
                                @{
                                    @"user_client":@"iOS",
                                 };
   [QTNetWork postRequest:memberDict url:@"/api/v1/uuid" ssBlock:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
       //NSString* msg = [responseObject objectForKey:@"msg"];
       NSString* code = [responseObject objectForKey:@"code"];
       NSString* uuid = [responseObject objectForKey:@"uuid"];
       if (code.integerValue == 0) {
           //QTLog(@"-----------------------  : %d",[NSThread isMainThread]);
           dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
               [QTConfigurationHelper setStringValueForConfigurationKey:QTAPPLANTCHUUIDKEY withValue:uuid];
           });
       }
       
   } ftBlock:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       [self.window showHUDWithTitle:@"无法获取UUID" dismissAfter:1.5];
   }];
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

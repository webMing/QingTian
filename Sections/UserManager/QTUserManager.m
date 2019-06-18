//
//  QTUser.m
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import "QTUserManager.h"

static NSString*  const QTUserKeyChainServerName = @"QTUserKeyChainServerName";
static NSString*  const QTLastLoginUserKey = @"QTLastLoginUserKey";

@interface QTUserManager()

@end

@implementation QTUserManager

#pragma mark- LifeCicle
+(instancetype)Manager{
    static QTUserManager* manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[QTUserManager alloc]init];
    });
    return manager;
}

#pragma mark- SetUpView

#pragma mark- EventRespone

+ (void)ReadDiskUserInfo {
    
}

+ (BOOL)ClearUserInfo {
    return NO;
}

+ (BOOL)saveUserInfo:(NSString* )phoneNum passwd:(NSString*)pwd {
    if (!phoneNum|| !pwd ) {
        return NO;
    }
    QTUserManager* manager = [QTUserManager Manager];
    QTUser *user = manager.user;
    user.mobile  = phoneNum;
    user.passwd = pwd;
    NSError *error;
    BOOL suss =[YYKeychain setPassword:pwd forService:QTUserKeyChainServerName account:QTUserKeyChainServerName error:&error];
    if(!suss && !error){
        QTLog(@"%@", error);
    }
    return suss;
}

- (void)saveUser:(NSDictionary*)userInfo {
    QTUser* user = [[QTUser alloc]init];
//    user.userID =
}

- (void)saveUserHeaderImage:(UIImage*)image {
    
}

- (UIImage*)userHeaderImage {
    return nil;
}

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod

@end 


/******************************************* QTUser ************************************************************/

@implementation QTUser

#pragma mark- LifeCicle

#pragma mark- SetUpView

#pragma mark- EventRespone

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod
DellocCheck
@end

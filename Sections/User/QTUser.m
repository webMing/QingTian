//
//  QTUser.m
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import "QTUser.h"

#import "SAMKeychain.h"
#import "SAMKeychainQuery.h"

static NSString*  const QTUserKeyChainServerName = @"QTUserKeyChainServerName";
static NSString*  const QTLastLoginUserKey = @"QTLastLoginUserKey";

@interface QTUser()

@end

@implementation QTUser

#pragma mark- LifeCicle
+(instancetype)User{
    static QTUser* user = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        user = [[QTUser alloc]init];
    });
    return user;
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
    QTUser* user = [QTUser User];
    user.mobile  = phoneNum;
    user.passwd = pwd;
    NSError *error;
    BOOL suss = [SAMKeychain setPassword:pwd forService:QTUserKeyChainServerName account:phoneNum error:&error];
    if(!suss && !error){
        QTLog(@"%@", error);
    }
    return suss;
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

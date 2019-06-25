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
@property (nonatomic, strong) YYDiskCache* cache;
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

+ (void)readDiskUserInfo {
}

+ (BOOL)clearUserInfo {
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
    user.userID = [userInfo objectForKey:@"userID"];
    user.name =  [userInfo objectForKey:@"name"];
    user.mobile = [userInfo objectForKey:@"mobile"];
    
    NSAssert(user.mobile.length != 0, @"User.mobile.lenth == 0");
    [self.cache setObject:user forKey:user.mobile];
}

- (void)saveUserHeaderImage:(UIImage*)image {
    YYMemoryCache
}

- (UIImage*)userHeaderImage {
    return nil;
}

#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod
- (YYDiskCache *)cache{
    if (!_cache) {
        //_cache = [YYDiskCache cacheWithName:@"QTUSER"];
    }
    return _cache;
}
@end 


/******************************************* QTUser ************************************************************/

@implementation QTUser

#pragma mark- LifeCicle

#pragma mark- SetUpView

#pragma mark- EventRespone
- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.unionID forKey:@"userID"];
    [aCoder encodeObject:self.unionID forKey:@"unionID"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.mobile forKey:@"mobile"];
    [aCoder encodeObject:self.sessionID forKey:@"sessionID"];
    [aCoder encodeObject:self.headURL forKey:@"headURL"];
    
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    QTUser* user = [[QTUser alloc]init];
    user.name = [aDecoder decodeObjectForKey:@"name"];
    user.userID = [aDecoder decodeObjectForKey:@"userID"];
    user.unionID = [aDecoder decodeObjectForKey:@"unionID"];
    user.email = [aDecoder decodeObjectForKey:@"email"];
    user.mobile = [aDecoder decodeObjectForKey:@"mobile"];
    user.sessionID = [aDecoder decodeObjectForKey:@"sessionID"];
    user.headURL = [aDecoder decodeObjectForKey:@"headURL"];
    return user;
}
#pragma mark- CustomDelegateMethod

#pragma mark- DelegateMethod

#pragma mark- GetterAndSetter

#pragma mark- PrivateMethod
DellocCheck
@end

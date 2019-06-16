//
//  QTUser.h
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QTUser : NSObject

@property (nonatomic, copy)    NSString*  mobile; //手机
@property (nonatomic, copy)    NSString*  name;  //"昵称 名字
@property (nonatomic, copy)    NSString*  passwd; //密码
@property (nonatomic, copy)    NSString*  email; //邮件
@property (nonatomic, copy)    NSString*  userID; //userID
@property (nonatomic, copy)    NSString*  headURL;

@property (nonatomic, copy)    NSString*  sessionID;


@property (nonatomic, assign) BOOL isLogin;

+ (instancetype)User;

+ (void)ReadDiskUserInfo;

+ (BOOL)ClearUserInfo;

+ (BOOL)saveUserInfo:(NSString* )counter passwd:(NSString*)pwd;

- (void)saveUserHeaderImage:(UIImage*)image;

- (UIImage*)userHeaderImage;

@end

NS_ASSUME_NONNULL_END

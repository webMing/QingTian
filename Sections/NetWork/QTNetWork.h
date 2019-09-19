//
//  QTNetWork.h
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^NetRequestProssBlock)(NSProgress * _Nonnull progress);
typedef void(^NetRequestSuccBlock)(NSURLSessionDataTask * _Nonnull task, id _Nonnull responseObject);
typedef void(^NetRequestFailtBlock)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error);

NS_ASSUME_NONNULL_BEGIN

@interface QTNetWork : NSObject

+ (void)postRequest:(NSDictionary *)para  url:(NSString*)url ssBlock:(NetRequestSuccBlock _Nullable)ssBlock ftBlock:(NetRequestFailtBlock _Nullable)ftBlock;
+ (void)getRequest:(NSDictionary *)para   url:(NSString*)url ssBlock:(NetRequestSuccBlock _Nullable)ssBlock ftBlock:(NetRequestFailtBlock _Nullable)ftBlock;

+ (void)postRequest:(NSDictionary *)para  url:(NSString*)url ps:(NetRequestProssBlock _Nullable)ps ssBlock:(NetRequestSuccBlock _Nullable)ssBlock ftBlock:(NetRequestFailtBlock _Nullable)ftBlock;
+ (void)getRequest:(NSDictionary *)para  url:(NSString*)url ps:(NetRequestProssBlock _Nullable)ps ssBlock:(NetRequestSuccBlock _Nullable)ssBlock ftBlock:(NetRequestFailtBlock _Nullable)ftBlock;

+ (void)checkNetConnection;

@end
NS_ASSUME_NONNULL_END

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

+ (void)postRequest:(NSDictionary *)para ssBlock:(NetRequestSuccBlock)ssBlock ftBlock:(NetRequestFailtBlock)ftBlock;
+ (void)getRequest:(NSDictionary *)para ssBlock:(NetRequestSuccBlock)ssBlock ftBlock:(NetRequestFailtBlock)ftBlock;

+ (void)postRequest:(NSDictionary *)para ps:(NetRequestProssBlock)ps ssBlock:(NetRequestSuccBlock)ssBlock ftBlock:(NetRequestFailtBlock)ftBlock;
+ (void)getRequest:(NSDictionary *)para ps:(NetRequestProssBlock)ps ssBlock:(NetRequestSuccBlock)ssBlock ftBlock:(NetRequestFailtBlock)ftBlock;
@end

NS_ASSUME_NONNULL_END

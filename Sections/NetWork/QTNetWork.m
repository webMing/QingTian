//
//  QTNetWork.m
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import "QTNetWork.h"
#import "AFHTTPSessionManager.h"

static CGFloat const kNetworkRequestTimeoutInterval = 10.0f;

@implementation QTNetWork

+ (void)postRequest:(NSDictionary *)para ssBlock:(NetRequestSuccBlock _Nullable)ssBlock ftBlock:(NetRequestFailtBlock _Nullable)ftBlock {
    [self postRequest:para ps:nil ssBlock:ssBlock ftBlock:ftBlock];
}

+ (void)getRequest:(NSDictionary *)para ssBlock:(NetRequestSuccBlock _Nullable)ssBlock ftBlock:(NetRequestFailtBlock _Nullable)ftBlock {
    [self getRequest:para ps:nil ssBlock:ssBlock ftBlock:ftBlock];
}

+ (void)postRequest:(NSDictionary *)para ps:(NetRequestProssBlock _Nullable)ps ssBlock:(NetRequestSuccBlock _Nullable)ssBlock ftBlock:(NetRequestFailtBlock _Nullable)ftBlock {
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = kNetworkRequestTimeoutInterval;
    manager.responseSerializer =[AFJSONResponseSerializer serializer];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];
    [manager POST:BASEURL parameters:para progress:^(NSProgress * _Nonnull uploadProgress) {
        if(ps)ps(uploadProgress);// ??
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(ssBlock)ssBlock(task,responseObject); // ??
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(ftBlock)ftBlock(task,error); // ??
    }];
}
+ (void)getRequest:(NSDictionary *)para ps:(NetRequestProssBlock _Nullable)ps ssBlock:(NetRequestSuccBlock _Nullable)ssBlock ftBlock:(NetRequestFailtBlock _Nullable)ftBlock {
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = kNetworkRequestTimeoutInterval;
    manager.responseSerializer =[AFJSONResponseSerializer serializer];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];
    [manager GET:BASEURL parameters:para progress:^(NSProgress * _Nonnull downloadProgress) {
        if(ps)ps(downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(ssBlock)ssBlock(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(ftBlock)ftBlock(task,error);
    }];
}

@end

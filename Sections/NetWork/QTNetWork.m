//
//  QTNetWork.m
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import "QTNetWork.h"
#import "AFHTTPSessionManager.h"

static CGFloat const kNetworkRequestTimeoutInterval = 5.0f;

@implementation QTNetWork

+ (void)postRequest:(NSDictionary *)para url:(NSString*)url ssBlock:(NetRequestSuccBlock _Nullable)ssBlock ftBlock:(NetRequestFailtBlock _Nullable)ftBlock {
    [self postRequest:para url:url ps:nil ssBlock:ssBlock ftBlock:ftBlock];
}

+ (void)getRequest:(NSDictionary *)para url:(NSString*)url ssBlock:(NetRequestSuccBlock _Nullable)ssBlock ftBlock:(NetRequestFailtBlock _Nullable)ftBlock {
    [self getRequest:para url:url ps:nil ssBlock:ssBlock ftBlock:ftBlock];
}

+ (void)postRequest:(NSDictionary *)para url:(NSString*)url ps:(NetRequestProssBlock _Nullable)ps ssBlock:(NetRequestSuccBlock _Nullable)ssBlock ftBlock:(NetRequestFailtBlock _Nullable)ftBlock {
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = kNetworkRequestTimeoutInterval;
    manager.responseSerializer =[AFJSONResponseSerializer serializer];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];
    url = [BASEURL stringByAppendingPathComponent:url];
    [manager POST:url parameters:para progress:^(NSProgress * _Nonnull uploadProgress) {
        if(ps)ps(uploadProgress);// ??
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(ssBlock)ssBlock(task,responseObject); // ??
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(ftBlock)ftBlock(task,error); // ??
    }];
}
+ (void)getRequest:(NSDictionary *)para url:(NSString*)url ps:(NetRequestProssBlock _Nullable)ps ssBlock:(NetRequestSuccBlock _Nullable)ssBlock ftBlock:(NetRequestFailtBlock _Nullable)ftBlock {
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = kNetworkRequestTimeoutInterval;
    manager.responseSerializer =[AFJSONResponseSerializer serializer];
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];
    url = [BASEURL stringByAppendingPathComponent:url];
    [manager GET:url parameters:para progress:^(NSProgress * _Nonnull downloadProgress) {
        if(ps)ps(downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(ssBlock)ssBlock(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(ftBlock)ftBlock(task,error);
    }];
}

static BOOL hasDisconnect  = NO;

+ (void)checkNetConnection{
   AFNetworkReachabilityManager* manager =  [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        UIWindow* window = [[[UIApplication sharedApplication] delegate] window];
        if (status == AFNetworkReachabilityStatusNotReachable) {
            hasDisconnect = YES;
            [window showHUDWithTitle:@"网络已断开" dismissAfter:2.0f];
        }else if (status ==  AFNetworkReachabilityStatusReachableViaWWAN || status == AFNetworkReachabilityStatusReachableViaWiFi){
            if (hasDisconnect) {
                [window showHUDWithTitle:@"网络恢复" dismissAfter:2.0f];
            }
        }
    }];
    [manager startMonitoring];
}

@end

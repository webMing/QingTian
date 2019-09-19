//
//  SteSpeedLoadingView.h
//  QingTian
//
//  Created by Stephanie on 2019/9/19.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SteNetworkSpeedMonitor : NSObject

@property (nonatomic, copy, readonly) NSString *downloadNetworkSpeed;
@property (nonatomic, copy, readonly) NSString *uploadNetworkSpeed;

// 初始化
+ (instancetype)shareMonitor;
// 设置开始监听
- (void)setDownloadSpeedBlock:(void(^)(NSString* speed))block;
- (void)setUploadSpeedBlock:(void(^)(NSString* speed))block;

// 开始监听网速
- (void)startNetworkSpeedMonitor;
// 停止监听
- (void)stopNetworkSpeedMonitor;


@end

NS_ASSUME_NONNULL_END

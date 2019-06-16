//
//  NSTimer+invoke.m
//  CaShapeLayerAndUIBezierPath
//
//  Created by Apple on 16/3/4.
//  Copyright © 2016年 com.taobus.www. All rights reserved.
//

#import "NSTimer+invoke.h"
/*
 1.使用的时候可已使用block，避免循环调用.
 2.但是不能让 NSTimer 失效
 */


@implementation NSTimer (ste_invoke)
+(NSTimer*)scheduledTimerWithTimeInterval:(NSTimeInterval)ti block:(void(^)(void))aBlock userInfo:(id)userInfo repeats:(BOOL)yesOrNo
{
    return [self scheduledTimerWithTimeInterval:ti target:self selector:@selector(ste_timerFireMethod:) userInfo:[aBlock copy ]repeats:yesOrNo];
}

+(void)ste_timerFireMethod:(NSTimer*)timer
{
    void(^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}
@end

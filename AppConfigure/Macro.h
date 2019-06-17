//
//  Macro.h
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define ScreenBounds [UIScreen mainScreen].bounds;

#ifdef DEBUG
     #define QTLog(...) NSLog(@"CLASS=%@, LINE=%d -> %@", [self class], __LINE__, [NSString stringWithFormat:__VA_ARGS__])
    #define DellocCheck   -(void)dealloc{QTLog(@"Dealloc ViewControllerName:%@",[[self class]description]);}
#else
    #define QTLog(...) {}
    #define DellocCheck  {}
#endif

#ifdef DEBUG
        /**
         使用测试环境内网:  就不用注释掉 #define ENABLEINTERNALNET
         使用测试环境外网:  就把 #define ENABLEINTERNALNET 注释掉
         */
        //#define DEBUG_EXTERN

        #ifdef DEBUG_EXTERN
                  #define BASEURL  @"http:localhost"
        #else
                //#define ENABLEINTERNALNET
                #ifdef ENABLEINTERNALNET
                      #define BASEURL  @"http:localhost"
                #else
                     #define BASEURL  @"http:localhost"
                #endif

        #endif

#else
    // 正式环境
     #define BASEURL  @"http:localhost"
#endif

#endif /* Macro_h */

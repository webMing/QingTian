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
    #define BASEURL  @"http:localhost"
    #define QTLog(...) NSLog(@"CLASS=%@, LINE=%d -> %@", [self class], __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#else
    #define BASEURL  @"http:localhost"
    #define QTLog(...) {}
#endif

#endif /* Macro_h */

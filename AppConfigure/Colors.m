//
//  Colors.c
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import "Colors.h"

inline UIColor * QTRGB(int r,int g, int b){
    return [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0];
}

inline UIColor * QTRGBA(int r,int g, int b,CGFloat a){
    return [UIColor colorWithRed:((r) / 255.0)green:((g) / 255.0)blue:((b) / 255.0)alpha:a];
}

inline UIColor * QTHexRGB(int hexValue){
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0];
}

inline UIColor * QTHexRGBA(int hexValue, CGFloat a){
    return   [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:(a)];
}

inline UIColor * QTRandom(void){
    return [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
}

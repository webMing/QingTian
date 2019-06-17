//
//  Colors.h
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#ifndef Colors_h
#define Colors_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

FOUNDATION_EXPORT UIColor * QTRGB(int r,int g, int b);
FOUNDATION_EXPORT UIColor * QTRGBA(int r,int g, int b,CGFloat a);
FOUNDATION_EXPORT UIColor * QTHexRGB(int hexValue);
FOUNDATION_EXPORT UIColor * QTHexRGBA(int hexValue, CGFloat a);
FOUNDATION_EXPORT UIColor * QTRandom(void);

#define QTBackground         QTHexRGB(0xf2f5f8)
#define QTNavBar                 QTHexRGB(0xf5ab00)
#define QTSeparateLine       QTHexRGB(0xf2f5f8)
#define QTYellow                  QTHexRGB(0xf5ab00)
#define QTBrown                   QTHexRGB(0x8c5828)
#define QTNavy                     QTHexRGB(0x415A78)

#define QTStateOrange        QTHexRGB(0xff6d00)
#define QTStateRed             QTHexRGB(0xf05050)
#define QTStateGreen         QTHexRGB(0x91c456)
#define QTStateYellow         QTHexRGB(0xff9e00)
#define QTStateBlue           QTHexRGB(0x00b0ff)

#define QTBlack             QTHexRGB(0x2c3747)
#define QTBlack1            QTHexRGB(0x283c5a)
#define QTBlack2            QTHexRGB(0xa0acbe)
#define QTBlack3            QTHexRGB(0x415a78)
#define QTWhite             QTHexRGB(0xffffff)
#define QTClear             [UIColor clearColor]


#endif /* Colors_h */

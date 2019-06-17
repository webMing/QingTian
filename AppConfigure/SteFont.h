//
//  SteFont.h
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define StePF_Medium_Font_Size(size)     StePFMediumFontWithSize(size)
#define StePF_Semibold_Font_Size(size)   StePFSemiboldFontWithSize(size)
#define StePF_Light_Font_Size(size)          StePFLightFontWithSize(size)
#define StePF_Ultralight_Font_Size(size)   StePFUltralightFontWithSize(size)
#define StePF_Regular_Font_Size(size)      StePFRegularFontWithSize(size)
#define StePF_Thin_Font_Size(size)           StePFThinFontWithSize(size)

FOUNDATION_EXPORT UIFont* StePFMediumFontWithSize(CGFloat size);
FOUNDATION_EXPORT UIFont* StePFSemiboldFontWithSize(CGFloat size);
FOUNDATION_EXPORT UIFont* StePFLightFontWithSize(CGFloat size);
FOUNDATION_EXPORT UIFont* StePFUltralightFontWithSize(CGFloat size);
FOUNDATION_EXPORT UIFont* StePFRegularFontWithSize(CGFloat size);
FOUNDATION_EXPORT UIFont* StePFThinFontWithSize(CGFloat size);



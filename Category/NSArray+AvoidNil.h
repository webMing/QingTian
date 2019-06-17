//
//  NSArray+AvoidNil.h
//  BaXiaoEr
//
//  Created by Apple on 16/7/30.
//  Copyright © 2016年 com.taobus.www. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (AvoidNil)

- (id)ste_objAtIndex:(NSInteger)index;

@end

@interface NSMutableArray (AvoidNil)

- (id)ste_objAtIndex:(NSInteger)index;
- (void)ste_addNonNilObj:(id)obj;

@end

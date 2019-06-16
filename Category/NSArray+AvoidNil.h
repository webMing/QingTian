//
//  NSArray+AvoidNil.h
//  BaXiaoEr
//
//  Created by Apple on 16/7/30.
//  Copyright © 2016年 com.taobus.www. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (AvoidNil)

- (id)objectAtIndexCheck:(NSUInteger)index;

@end

@interface NSMutableArray (AvoidNil)

- (void)addCheckObject:(id)anObject;

- (id)objectAtIndexCheck:(NSUInteger)index;

@end

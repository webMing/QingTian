//
//  NSMutableDictionary+AvoidNil.h
//  BookingTicket
//
//  Created by Apple on 16/8/27.
//  Copyright © 2016年 Stephnaie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (AvoidNil)

- (void)setCheckObject:(id)anCheckObject forKey:(id<NSCopying>)aKey;

@end

//
//  NSMutableDictionary+AvoidNil.h
//  BookingTicket
//
//  Created by Apple on 16/8/27.
//  Copyright © 2016年 Stephnaie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (AvoidNil)

- (void)ste_setNonNilObj:(id)obj forKey:(NSString *)key;
- (id)ste_objForKey:(NSString *)key optionValue:(id)option;
- (void)ste_setEmptyStringWithObjIsNil:(id)obj forKey:(NSString *)key;
- (void)ste_setObj:(id)obj forKey:(NSString *)key optionValue:(id)option;

- (id)ste_valueForKey:(NSString *)key;
- (id)ste_objForKey:(NSString *)key;

@end


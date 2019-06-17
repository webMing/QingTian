//
//  NSMutableDictionary+AvoidNil.m
//  BookingTicket
//
//  Created by Apple on 16/8/27.
//  Copyright © 2016年 com.taobus.www. All rights reserved.
//

#import "NSDictionary+AvoidNil.h"


/*
 
 * Send -setObject:forKey: to the receiver, unless the value is nil, in which case send -removeObjectForKey:.

- (void)setValue:(nullable ObjectType)value forKey:(NSString*)key;
 
 1.setValue的第一个参数是nullable，也就是可为nil的。如果是nil的话，便会执行removeObjectForKey。而setObject是不能为nil的，如果是nil便会崩溃。（此处特别指出是nil，nil是一个连对象都没有的，因为还可以是NSNull 它表示一个值为空的对象。NSNull null是有一个有效的内存地址的）
 nil Nil NSNull NULL
 2.setValue的key只能是字符串，setObject的key是实现NSCopying协议的对象即可（如NSNumber）
 
 另一个本质区别是：
 setObject forKey是NSMutableDictionary独有的
 setValue forKey是KVC（键值编码）的主要方法
 
 */

@implementation NSDictionary (AvoidNil)
//如果obj为nil；则空字符串会添加到dict中
- (void)ste_setEmptyStringWithObjIsNil:(id)obj forKey:(NSString *)key {
    [self setValue:obj?obj:@"" forKey:key];
}

- (void)ste_setNonNilObj:(id)obj forKey:(NSString *)key {
    if (obj) {
        [self setValue:obj forKey:key];
    }
}

- (void)ste_setObj:(id)obj forKey:(NSString *)key optionValue:(id)option{
    if (obj) {
        [self setValue:obj forKey:key];
    }else if(option) {
        [self setValue:option forKey:key];
    }
}

- (id)ste_objForKey:(NSString *)key optionValue:(id)option {
    id value = [self valueForKey:key];
    return value?value:option;
}

- (id)ste_valueForKey:(NSString *)key {
    id value = [self valueForKey:key];
    return [value isKindOfClass:NSNull.class] ? nil : value;
}
- (id)ste_objForKey:(NSString *)key {
    id value = [self objectForKey:key];
    return [value isKindOfClass:NSNull.class] ? nil : value;
}

@end

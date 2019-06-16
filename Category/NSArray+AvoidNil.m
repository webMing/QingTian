//
//  NSArray+AvoidNil.m
//  BaXiaoEr
//
//  Created by Apple on 16/7/30.
//  Copyright © 2016年 com.taobus.www. All rights reserved.
//

#import "NSArray+AvoidNil.h"


@implementation NSArray (AvoidNil)

//防止数组越界...  //首先要确定 语法糖和 objectAtIndexPath的作用是否相同...
// 其次还要检查 语法糖的用法 和这个没有关系的...
- (id)objectAtIndexCheck:(NSUInteger)index  {
    
    __block id obj ;
    //dispatch_queue_t syncQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
   // dispatch_barrier_async(syncQueue, ^{
        
        if (index < self.count)
        {
            obj =  self[index];
        }
        
    //});
       return obj;
    
}

@end


@implementation NSMutableArray (AvoidNil)

- (void)addCheckObject:(id)anObject{
    
    //dispatch_queue_t syncQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //dispatch_barrier_sync(syncQueue, ^{
        
        //并没有排除 【NSNull  null】 对象 ，
        if (anObject) {
            [self addObject:anObject];
        }
        
    //});
    
}


- (id)objectAtIndexCheck:(NSUInteger)index {
    
    id obj;
    
    if (index < self.count)
    {
        obj =  self[index];
    }

    return obj;
    
}

@end

//
//  STEConfigurationHelper.m
//  BaXiaoEr
//
//  Created by Apple on 16/1/17.
//  Copyright © 2016年 Stephanie. All rights reserved.
//

#import "QTConfigurationHelper.h"

@implementation QTConfigurationHelper

+ (BOOL)isFirstLaunch {
    if ([self getBoolValueForConfigurationKey:@"AppFirstLanch"]) {
        return NO;
    } else {
        [self setBoolValueForConfigurationKey:@"AppFirstLanch" withValue:YES];
        return YES;
    }
}

+ (void)setApplicationStartupDefaults
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    [defaults setBool:NO forKey:@"firstla"];
    [defaults synchronize];
}

#pragma mark - Getting Value

+ (BOOL)getBoolValueForConfigurationKey:(NSString *)_objectkey
{
    //create an instance of NSUserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize]; //let's make sure the object is synchronized
    return [defaults boolForKey:_objectkey];
}

+ (NSString *)getStringValueForConfigurationKey:(NSString *)_objectkey
{
    //create an instance of NSUserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize]; //let's make sure the object is synchronized
    if ([defaults stringForKey:_objectkey] == nil )
    {
        //I don't want a (null) returned since the result might be a text property of a UILabel
        return @"";
    }
    else
    {
        return [defaults stringForKey:_objectkey];
    }
    
}

+ (NSNumber*)getNSNumberValueForConfigurationKey:(NSString*)_objectkey
{
    //create an instance of NSUserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize]; //let's make sure the object is synchronized
    if ([defaults valueForKey:_objectkey] == nil )
    {
        return @0;
    }
    else
    {
        return [defaults valueForKey:_objectkey];
    }

}

+ (NSData*)getNSdataValueForConfigurationKey:(NSString*)_objectkey
{
    //create an instance of NSUserDefaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize]; //let's make sure the object is synchronized
    if ([defaults valueForKey:_objectkey] == nil )
    {
        return nil;
    }
    else
    {
        return [defaults valueForKey:_objectkey];
    }
    
}

#pragma mark - Setting Value

+ (void)setBoolValueForConfigurationKey:(NSString *)_objectkey
                              withValue:(BOOL)_boolvalue
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize]; //let's make sure the object is synchronized
    [defaults setBool:_boolvalue forKey:_objectkey];
    [defaults synchronize];//make sure you're synchronized again
}

+ (void)setStringValueForConfigurationKey:(NSString *)_objectkey
                                withValue:(NSString *)_value
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize]; //let's make sure the object is synchronized
    [defaults setValue:_value forKey:_objectkey];
    [defaults synchronize];//make sure you're synchronized again
    
}

+ (void)setNSNumberValueForConfigurationKey:(NSString*)_objectkey
                                  withValue:(NSNumber*)_value
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize]; //let's make sure the object is synchronized
    [defaults setObject:_value forKey:_objectkey];
    [defaults synchronize];//make sure you're synchronized again
}

+ (void)setNSDataValueForConfigurationKey:(NSString*)_objectkey
                                  withValue:(NSData*)_value
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize]; //let's make sure the object is synchronized
    [defaults setObject:_value forKey:_objectkey];
    [defaults synchronize];//make sure you're synchronized again
}

/// 删除NSUserDefaults的键值对
+(void)deleteStringValueForConfigurationKey:(NSString *)_objectkey{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize]; //let's make sure the object is synchronized
    [defaults removeObjectForKey:_objectkey];
    [defaults synchronize];//make sure you're synchronized again
}

@end

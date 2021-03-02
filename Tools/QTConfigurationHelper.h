//
//  STEConfigurationHelper.h
//
//  Created by Apple on 16/1/17.
//  Copyright © 2016年 Stephanie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QTConfigurationHelper : NSObject

+ (BOOL)isFirstLaunch;

+ (void)setApplicationStartupDefaults;

+ (BOOL)getBoolValueForConfigurationKey:(NSString *)_objectkey;

+ (NSString *)getStringValueForConfigurationKey:(NSString *)_objectkey;

+ (NSNumber*)getNSNumberValueForConfigurationKey:(NSString*)_objectkey;

+ (NSData*)getNSdataValueForConfigurationKey:(NSString*)_objectkey;

+ (void)setBoolValueForConfigurationKey:(NSString *)_objectkey
                             withValue:(BOOL)_boolvalue;

+ (void)setStringValueForConfigurationKey:(NSString *)_objectkey
                               withValue:(NSString *)_value;

+ (void)setNSNumberValueForConfigurationKey:(NSString*)_objectkey
                                  withValue:(NSNumber*)_value;

+ (void)setNSDataValueForConfigurationKey:(NSString*)_objectkey
                                withValue:(NSData*)_value;

+(void)deleteStringValueForConfigurationKey:(NSString *)_objectkey;

@end

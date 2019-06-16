//
//  Tool.m
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//


#import <UIKit/UIKit.h>

inline UIViewController * InstanceVC(NSString* sbn,NSString* identify){
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbn bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:identify];
    return vc;
}

inline void SteCallPhone(NSString* phoneNumber){
    
    NSMutableString * phoneNumberString=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",phoneNumber];
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:completionHandler:)]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumberString] options:@{} completionHandler:nil];
        }else{
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumberString]];
        }
        
    });
    
}

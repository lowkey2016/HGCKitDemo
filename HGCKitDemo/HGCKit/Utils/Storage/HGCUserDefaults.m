//
//  HGCUserDefaults.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/7/24.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import "HGCUserDefaults.h"

@implementation HGCUserDefaults

+ (id)objectForKey:(NSString *)aKey {
    if (aKey == nil) {
        NSLog(@"从User Defaults中获取数据失败: key为空");
        
        return nil;
    }
    else {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        return [userDefaults objectForKey:aKey];
    }
}

+ (void)setObject:(id)obj forKey:(NSString *)aKey {
    if (obj == nil || aKey == nil) {
        NSLog(@"保存数据到User Defaults失败: obj或key为空");
        
        return;
    }
    else {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:obj forKey:aKey];
        [userDefaults synchronize];
    }
}

+ (void)removeObjectForKey:(NSString *)aKey {
    if (aKey == nil) {
        NSLog(@"从User Defaults中移除数据失败: key为空");
        
        return;
    }
    else {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults removeObjectForKey:aKey];
        [userDefaults synchronize];
    }
}

@end

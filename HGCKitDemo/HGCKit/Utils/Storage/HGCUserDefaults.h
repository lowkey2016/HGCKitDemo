//
//  HGCUserDefaults.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/7/24.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HGCUserDefaults : NSObject

+ (id)objectForKey:(NSString *)aKey;
+ (void)setObject:(id)obj forKey:(NSString *)aKey;
+ (void)removeObjectForKey:(NSString *)aKey;

@end

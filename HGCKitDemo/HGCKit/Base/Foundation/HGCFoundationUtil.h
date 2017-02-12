//
//  HGCFoundationUtil.h
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/8/16.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HGCFoundationUtil : NSObject

/** NSString */

+ (BOOL)isStringEmpty:(NSString *)str;
+ (BOOL)isStringNotEmpty:(NSString *)str;

/** NSArray */

+ (NSArray *)array:(NSArray *)array addObject:(id)obj;
+ (NSArray *)array:(NSArray *)array insertObject:(id)obj atIndex:(NSInteger)index;
+ (NSArray *)array:(NSArray *)array replaceObject:(id)obj atIndex:(NSInteger)index;
+ (NSArray *)array:(NSArray *)array appendObject:(id)obj;
+ (NSArray *)array:(NSArray *)array removeObjectAtIndex:(NSInteger)index;

/** NSRecursiveLock */

+ (NSRecursiveLock *)recursiveLockOfInstance:(id)instance;

@end

//
//  HGCFoundationUtil.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/8/16.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "HGCFoundationUtil.h"
#import "NSString+HGCCategory.h"

@implementation HGCFoundationUtil

#pragma mark - NSString

+ (BOOL)isStringEmpty:(NSString *)str {
    if (str == nil || [str hgc_isEmpty]) {
        return YES;
    }
    return NO;
}

+ (BOOL)isStringNotEmpty:(NSString *)str {
    if (str && [str hgc_isNotEmpty]) {
        return YES;
    }
    return NO;
}

#pragma mark - NSArray

+ (NSArray *)array:(NSArray *)array addObject:(id)obj {
    return [self array:array insertObject:obj atIndex:0];
}

+ (NSArray *)array:(NSArray *)array insertObject:(id)obj atIndex:(NSInteger)index {
    if (array == nil) {
        return nil;
    }
    if (obj == nil) {
        return array;
    }
    if (index < 0 || index > array.count) {
        return array;
    }
    
    NSMutableArray *marr = [array mutableCopy];
    [marr insertObject:obj atIndex:index];
    return marr.copy;
}

+ (NSArray *)array:(NSArray *)array replaceObject:(id)obj atIndex:(NSInteger)index {
    if (array == nil) {
        return nil;
    }
    if (obj == nil) {
        return array;
    }
    if (index < 0 || index >= array.count) {
        return array;
    }
    
    NSMutableArray *marr = [array mutableCopy];
    marr[index] = obj;
    return marr.copy;
}

+ (NSArray *)array:(NSArray *)array appendObject:(id)obj {
    return [self array:array insertObject:obj atIndex:array.count];
}

+ (NSArray *)array:(NSArray *)array removeObjectAtIndex:(NSInteger)index {
    if (array == nil) {
        return nil;
    }
    if (index < 0 || index >= array.count) {
        return array;
    }
    
    NSMutableArray *marr = [array mutableCopy];
    [marr removeObjectAtIndex:index];
    return marr.copy;
}

#pragma mark - NSRecursiveLock

+ (NSRecursiveLock *)recursiveLockOfInstance:(id)instance {
    if (instance == nil) {
        return nil;
    }
    
    NSString *name = [NSString stringWithFormat:@"%@Lock", [instance class]];
    NSRecursiveLock *lock = [NSRecursiveLock new];
    lock.name = name;
    return lock;
}

@end

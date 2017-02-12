//
//  NSNull+HGCGetValue.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/7/24.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import "NSNull+HGCGetValue.h"
#import "NSString+HGCCategory.h"

#define HGCNullObjects @[@"", @0, @{}, @[]]

@implementation NSNull (HGCGetValue)

- (NSMethodSignature*)methodSignatureForSelector:(SEL)selector {
    NSMethodSignature *signature = [super methodSignatureForSelector:selector];
    if (signature == nil) {
        for (NSObject *object in HGCNullObjects) {
            signature = [object methodSignatureForSelector:selector];
            if (signature) {
                break;
            }
        }
        
    }
    
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL aSelector = [anInvocation selector];
    
    for (NSObject *object in HGCNullObjects) {
        if ([object respondsToSelector:aSelector]) {
            [anInvocation invokeWithTarget:object];
            
            return;
        }
    }
    
    [self doesNotRecognizeSelector:aSelector];
}

@end

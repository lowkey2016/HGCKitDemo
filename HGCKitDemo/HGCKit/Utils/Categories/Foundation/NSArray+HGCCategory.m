//
//  NSArray+HGCCategory.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/4/24.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "NSArray+HGCCategory.h"

@implementation NSArray (HGCCategory)

#pragma mark - Shuffle

- (NSArray *)hgc_shuffledArray {
    NSMutableArray *tmpArr = [self mutableCopy];
    for (int i = 0; i < tmpArr.count; i++) {
        int randomInt1 = arc4random() % tmpArr.count;
        int randomInt2 = arc4random() % tmpArr.count;
        [tmpArr exchangeObjectAtIndex:randomInt1 withObjectAtIndex:randomInt2];
    }
    return tmpArr.copy;
}

@end

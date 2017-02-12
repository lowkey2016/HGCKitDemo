//
//  NSDictionary+HGCCategory.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/8/19.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "NSDictionary+HGCCategory.h"

@implementation NSDictionary (HGCCategory)

- (NSString *)hgc_jsonString {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    if (data) {
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] ?: @"";
        return str;
    }
    return @"";
}

@end

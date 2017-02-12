//
//  HGCDateFormatter.h
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/2/26.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define mHGCDateFormatter [HGCDateFormatter sharedInstance]

@interface HGCDateFormatter : NSObject

+ (instancetype)sharedInstance;

- (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format;
- (NSDate *)dateFromString:(NSString *)str format:(NSString *)format;
- (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format;
- (NSString *)stringFromUNIXTimeInterval:(NSTimeInterval)interval format:(NSString *)format;
- (NSString *)nearestStringFromUNIXTimeInterval:(NSTimeInterval)interval format:(NSString *)format;

#ifdef DEBUG
- (NSDictionary *)debug_holdingDateFormatters;
#endif

@end

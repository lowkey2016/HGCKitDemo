//
//  HGCDateFormatter.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/2/26.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "HGCDateFormatter.h"
#import <UIKit/UIKit.h>


///////////////////////////////////////////////////////////////////////////////////////////


static NSInteger const kHGCHoldingDateFormattersMaxCount = 8;

static CGFloat const kHGCTimeInterval_minute = 60.0;
static CGFloat const kHGCTimeInterval_hour = 3600.0;
static CGFloat const kHGCTimeInterval_day = 24 * 3600.0;
static CGFloat const kHGCTimeInterval_week = 7 * 24 * 3600.0;

@interface HGCDateFormatter ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, NSDateFormatter *> *holdingDateFormatters;

@end

@implementation HGCDateFormatter


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Singleton

+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[super allocWithZone:NULL] init];
    });
    return _sharedInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [[self class] sharedInstance];
}

//- (instancetype)copyWithZone:(NSZone *)zone {
//    return [[self class] sharedInstance];
//}
//
//- (instancetype)mutableCopyWithZone:(NSZone *)zone {
//    return [[self class] sharedInstance];
//}

#pragma mark - Init

- (instancetype)init {
    self = [super init];
    if (self) {
        self.holdingDateFormatters = [NSMutableDictionary dictionaryWithCapacity:kHGCHoldingDateFormattersMaxCount];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleMemoryWarningNotification:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Private Methods

- (void)holdDateFormatter:(NSDateFormatter *)formatter forKey:(NSString *)key {
    if (formatter == nil) {
        return;
    }
    if (key == nil || [[key stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]  isEqualToString:@""]) {
        return;
    }
    
    if (_holdingDateFormatters == nil) {
        _holdingDateFormatters = [NSMutableDictionary dictionaryWithCapacity:kHGCHoldingDateFormattersMaxCount];
    }
    if (_holdingDateFormatters.count >= kHGCHoldingDateFormattersMaxCount) {
        [_holdingDateFormatters removeObjectForKey:_holdingDateFormatters.allKeys.firstObject];
    }
    if (_holdingDateFormatters.count < kHGCHoldingDateFormattersMaxCount) {
        _holdingDateFormatters[key] = formatter;
    }
}

#ifdef DEBUG
- (NSDictionary *)debug_holdingDateFormatters {
    return _holdingDateFormatters;
}
#endif


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Public Methods

- (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format {
    NSDateFormatter *formatter = _holdingDateFormatters[format];
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = format;
        [self holdDateFormatter:formatter forKey:format];
    }
    return formatter;
}

- (NSDate *)dateFromString:(NSString *)str format:(NSString *)format {
    NSDateFormatter *formatter = [self dateFormatterWithFormat:format];
    return [formatter dateFromString:str];
}

- (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format {
    NSDateFormatter *formatter = [self dateFormatterWithFormat:format];
    return [formatter stringFromDate:date];
}

- (NSString *)stringFromUNIXTimeInterval:(NSTimeInterval)interval format:(NSString *)format {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    return [self stringFromDate:date format:format];
}

- (NSString *)nearestStringFromUNIXTimeInterval:(NSTimeInterval)interval format:(NSString *)format
{
    NSTimeInterval nowInterval = [[NSDate new] timeIntervalSince1970];
    NSTimeInterval intervalWithNow = nowInterval - interval;
    if (intervalWithNow < kHGCTimeInterval_minute) {
        return @"刚刚";
    }
    else if (intervalWithNow < kHGCTimeInterval_hour) {
        NSInteger minutes = intervalWithNow / kHGCTimeInterval_minute;
        return [NSString stringWithFormat:@"%zd分钟前", minutes];
    }
    else if (intervalWithNow < kHGCTimeInterval_day) {
        NSInteger hours = intervalWithNow / kHGCTimeInterval_hour;
        return [NSString stringWithFormat:@"%zd小时前", hours];
    }
    else if (intervalWithNow < kHGCTimeInterval_week) {
        NSInteger days = intervalWithNow / kHGCTimeInterval_day;
        return [NSString stringWithFormat:@"%zd天前", days];
    }
    else {
        return [self stringFromUNIXTimeInterval:interval format:format];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Notifications Handlers

- (void)handleMemoryWarningNotification:(NSNotification *)noti {
    [_holdingDateFormatters removeAllObjects];
}

@end

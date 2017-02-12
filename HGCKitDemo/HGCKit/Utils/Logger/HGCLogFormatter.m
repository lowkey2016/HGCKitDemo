//
//  HGCLogFormatter.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/10/26.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "HGCLogFormatter.h"

@interface HGCLogFormatter ()

@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@end

@implementation HGCLogFormatter

- (instancetype)init {
    self = [super init];
    if (self) {
        _dateFormatter = [NSDateFormatter new];
        _dateFormatter.formatterBehavior = NSDateFormatterBehavior10_4;
        _dateFormatter.dateFormat = @"HH:mm:ss.SSS";
    }
    return self;
}

inline static NSString *HGCGetLogLevelFrom(DDLogFlag flag) {
    switch (flag) {
        case DDLogFlagDebug: {
            return @"[DEBUG]";
        }
        case DDLogFlagInfo: {
            return @"[INFO]";
        }
        case DDLogFlagWarning: {
            return @"[WARNING]";
        }
        case DDLogFlagError: {
            return @"[ERROR]";
        }
        case DDLogFlagVerbose: {
            return @"[VERBOSE]";
        }
    }
    
    return @"[???]";
}

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
#ifdef HGC_DEBUG_MODE
    NSString *timestamp = [_dateFormatter stringFromDate:logMessage.timestamp];
    NSString *logLevel = HGCGetLogLevelFrom(logMessage.flag);
    NSString *formatedMsg = [NSString stringWithFormat:@"%@ HGCLogger %@ **** <%@ : %@> line %zd **** \n%@", timestamp, logLevel, logMessage.fileName, logMessage.function, logMessage.line, logMessage.message];
    
    return formatedMsg;
#else
    NSString *timestamp = [_dateFormatter stringFromDate:logMessage.timestamp];
    NSString *logLevel = HGCGetLogLevelFrom(logMessage.flag);
    NSString *formatedMsg = [NSString stringWithFormat:@"%@ HGCLogger %@ **** \n%@", timestamp, logLevel, logMessage.message];
    
    return formatedMsg;
#endif
}

@end

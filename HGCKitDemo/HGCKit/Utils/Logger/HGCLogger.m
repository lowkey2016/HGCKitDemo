//
//  HGCLogger.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/10/26.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "HGCLogger.h"
#import "UIColor+HGCUtil.h"

#import "HGCLogFormatter.h"


///////////////////////////////////////////////////////////////////////////////////////////


@interface HGCLogger ()

@property (nonatomic, strong) HGCLogFormatter *logFormatter;

@end

@implementation HGCLogger


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
        _logFormatter = [HGCLogFormatter new];
    }
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Setup

- (void)setupLogConfig {
#ifdef HGC_DEBUG_MODE
    // Enable XcodeColors
    setenv("XcodeColors", "YES", 0);
    
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
    NSDictionary *colorsConfig = @{@(DDLogFlagDebug)    : [UIColor greenColor],
                                   @(DDLogFlagInfo)     : HGCRGBHexColor(0xBA9356),
                                   @(DDLogFlagWarning)  : [UIColor yellowColor],
                                   @(DDLogFlagError)    : [UIColor redColor],
                                   @(DDLogFlagVerbose)  : [UIColor orangeColor]
                                   };
    for (NSNumber *k in colorsConfig.allKeys) {
        UIColor *v = colorsConfig[k];
        [[DDTTYLogger sharedInstance] setForegroundColor:v backgroundColor:nil forFlag:(DDLogFlag)[k unsignedIntegerValue]];
    }
#endif
    [DDTTYLogger sharedInstance].logFormatter = _logFormatter;
    [DDASLLogger sharedInstance].logFormatter = _logFormatter;
    [DDLog addLogger:[DDTTYLogger sharedInstance] withLevel:DDLogLevelAll];
    [DDLog addLogger:[DDASLLogger sharedInstance] withLevel:DDLogLevelWarning];
    
#ifdef HGC_DEBUG_MODE
    /**
     *  使用说明
     */
    DDLogDebug(@"调试信息");
    DDLogInfo(@"提示信息");
    DDLogVerbose(@"详细信息");
    
    // Warn 和 Error 必须带上前缀说明是哪个类触发这个错误的
    DDLogWarn(@"Logger ** 警告");
    DDLogError(@"Logger ** 错误信息");
#endif
}

@end

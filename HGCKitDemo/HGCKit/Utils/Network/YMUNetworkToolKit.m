//
//  YMUNetworkToolKit.m
//  YMUSDKit
//
//  Created by 陈俊宇 on 14-8-20.
//  Copyright (c) 2014年 com.youmi. All rights reserved.
//

#import "YMUNetworkToolKit.h"
#import "NSString+HGCCategory.h"

@interface YMUNetworkToolKit ()

@property (nonatomic, copy) NSString *secretUserAgent;

@end

@implementation YMUNetworkToolKit

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
        _secretUserAgent = nil;
    }
    return self;
}

#pragma mark - Public Methods

+ (NSString *)getUserAgent {
    return [[YMUNetworkToolKit sharedInstance] getUserAgent];
}

- (NSString *)getUserAgent {
    if (_secretUserAgent && [_secretUserAgent hgc_isNotEmpty]) {
        // secretUserAgent不为空，已经正确获取，可以直接返回
        return _secretUserAgent;
    }
    else {
        if ([NSThread isMainThread]) {
            UIWebView *hiddenWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
            self.secretUserAgent = [hiddenWebView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
            return _secretUserAgent;
        }
        else {
            // secretUserAgent为空，需要主动获取
            // 注意：下列操作必须在主线程中执行，为了避免阻塞，需要异步执行
            dispatch_async(dispatch_get_main_queue(), ^{
                UIWebView *hiddenWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
                self.secretUserAgent = [hiddenWebView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
            });
            
            // 此时返回空字符串
            return @"";
        }
    }
}

+ (void)setUserAgentAppendix:(NSString *)appendix {
    [[self sharedInstance] setUserAgentAppendix:appendix];
}

- (void)setUserAgentAppendix:(NSString *)appendix {
    if (appendix == nil || [appendix hgc_isEmpty]) {
        return;
    }
    if (_secretUserAgent == nil || [_secretUserAgent hgc_isEmpty]) {
        return;
    }
    if ([_secretUserAgent hasSuffix:appendix]) {
        return;
    }
    
    self.secretUserAgent = [_secretUserAgent stringByAppendingString:appendix];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:_secretUserAgent, @"UserAgent", nil];
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
}

+ (void)resetUserAgentByTrimAppendix:(NSString *)appendix {
    [[self sharedInstance] resetUserAgentByTrimAppendix:appendix];
}

- (void)resetUserAgentByTrimAppendix:(NSString *)appendix {
    if (appendix == nil || [appendix hgc_isEmpty]) {
        return;
    }
    if (_secretUserAgent == nil || [_secretUserAgent hgc_isEmpty]) {
        return;
    }
    if ([_secretUserAgent hasSuffix:appendix] == NO) {
        return;
    }
    
    NSInteger length = _secretUserAgent.length;
    NSInteger subLength = appendix.length;
    self.secretUserAgent = [_secretUserAgent substringToIndex:(length - subLength)];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:_secretUserAgent, @"UserAgent", nil];
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
}

@end

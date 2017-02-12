//
//  AXMAppInfo.m
//  AXMAdVideoSDK
//
//  Created by Jymn_Chen on 15/4/29.
//  Copyright (c) 2015年 com.adxmi. All rights reserved.
//

#import "AXMAppInfo.h"


///////////////////////////////////////////////////////////////////////////////////////////


@implementation AXMAppInfo

#pragma mark - Singleton

+ (instancetype)axm_sharedInstance {
    static AXMAppInfo *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [AXMAppInfo new];
    });
    return instance;
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - App Info

- (NSString *)axm_appShortVersion {
    NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    if (version == nil) {
        version = @"";
    }
    
    return version;
}

- (NSInteger)axm_appShortVersionCode {
    NSString *version = [self axm_appShortVersion];
    NSString *handledVersion = [version stringByReplacingOccurrencesOfString:@"." withString:@""];
    NSInteger code = [handledVersion integerValue];
    
    return code;
}

- (NSString *)axm_appBuildVersion {
    NSString *build = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
    if (build == nil) {
        build = @"";
    }
    
    return build;
}

- (NSInteger)axm_appBuildVersionCode {
    return [[self axm_appBuildVersion] integerValue];
}

- (NSString *)axm_bundleIdentifier {
    NSString *bundleID = [[NSBundle mainBundle] bundleIdentifier];
    if (bundleID == nil) {
        bundleID = @"";
    }
    
    return bundleID;
}

- (NSString *)axm_bundleDisplayName {
    NSString *bundleName = [[[NSBundle mainBundle] localizedInfoDictionary] objectForKey:@"CFBundleDisplayName"];
    if (bundleName == nil) {
        bundleName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    }
    if (bundleName == nil) {
        bundleName = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleNameKey];
    }
    if (bundleName == nil) {
        bundleName = @"";
    }
    
    return bundleName;
}

- (BOOL)axm_isAppInstalledFirstly {
    NSString *kIsFirstInstallKey = @"_axm_isAppInstalledFirstly";
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *isFirstInstallStr = [userDefaults objectForKey:kIsFirstInstallKey];
    if (isFirstInstallStr == nil || [[isFirstInstallStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        [userDefaults setObject:@"NO" forKey:kIsFirstInstallKey];
        [userDefaults synchronize];
        
        return YES;
    }
    
    return NO;
}

@end

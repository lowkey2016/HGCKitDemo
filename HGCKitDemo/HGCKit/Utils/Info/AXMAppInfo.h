//
//  AXMAppInfo.h
//  AXMAdVideoSDK
//
//  Created by Jymn_Chen on 15/4/29.
//  Copyright (c) 2015年 com.adxmi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define mAXMAppInfo [AXMAppInfo axm_sharedInstance]

@interface AXMAppInfo : NSObject

+ (instancetype)axm_sharedInstance;

- (NSString *)axm_appShortVersion; // version
- (NSInteger)axm_appShortVersionCode; // 例如: 1.0.3 -> 103, 2.0.0 -> 200
- (NSString *)axm_appBuildVersion; // build
- (NSInteger)axm_appBuildVersionCode; // build 的整数值
- (NSString *)axm_bundleIdentifier;
- (NSString *)axm_bundleDisplayName;

// 是否初次安装
- (BOOL)axm_isAppInstalledFirstly;

@end

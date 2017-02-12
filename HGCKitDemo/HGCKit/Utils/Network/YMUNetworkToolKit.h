//
//  YMUNetworkToolKit.h
//  YMUSDKit
//
//  Created by 陈俊宇 on 14-8-20.
//  Copyright (c) 2014年 com.youmi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YMUNetworkToolKit : NSObject

+ (NSString *)getUserAgent;

+ (void)setUserAgentAppendix:(NSString *)appendix;
+ (void)resetUserAgentByTrimAppendix:(NSString *)appendix;

@end

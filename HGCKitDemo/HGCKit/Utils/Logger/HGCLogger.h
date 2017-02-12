//
//  HGCLogger.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/10/26.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define mHGCLogger  [HGCLogger sharedInstance]

@interface HGCLogger : NSObject

+ (instancetype)sharedInstance;

- (void)setupLogConfig;

@end

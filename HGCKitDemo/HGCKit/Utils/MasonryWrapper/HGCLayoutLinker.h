//
//  HGCLayoutLinker.h
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/8/27.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HGCLayoutLinkerProtocol.h"

@interface HGCLayoutLinker : NSObject <HGCLayoutLinkerProtocol>

@property (nonatomic, readonly, strong) UIView *srcView;

+ (HGCLayoutLinker *)linkerWithView:(UIView *)view;
- (instancetype)initWithView:(UIView *)view NS_DESIGNATED_INITIALIZER;

@end

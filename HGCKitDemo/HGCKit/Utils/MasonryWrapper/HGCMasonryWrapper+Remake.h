//
//  HGCMasonryWrapper+Remake.h
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/8/27.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "HGCMasonryWrapper.h"

@interface HGCMasonryWrapper (Remake)

+ (void)removeAllConstraintsOfView:(UIView *)srcView;
+ (void)removeAllConstraintsOfViews:(NSArray<UIView *> *)srcViewArr;

@end

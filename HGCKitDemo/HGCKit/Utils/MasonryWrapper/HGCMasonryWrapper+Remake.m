//
//  HGCMasonryWrapper+Remake.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/8/27.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "HGCMasonryWrapper+Remake.h"

@implementation HGCMasonryWrapper (Remake)

#pragma mark - Remove all constraints

+ (void)removeAllConstraintsOfView:(UIView *)srcView {
    HGCMW_singleCheck
    NSArray *installedConstraints = [MASViewConstraint installedConstraintsForView:srcView];
    for (MASConstraint *constraint in installedConstraints) {
        [constraint uninstall];
    }
}

+ (void)removeAllConstraintsOfViews:(NSArray<UIView *> *)srcViewArr {
    for (UIView *view in srcViewArr) {
        [self removeAllConstraintsOfView:view];
    }
}

@end

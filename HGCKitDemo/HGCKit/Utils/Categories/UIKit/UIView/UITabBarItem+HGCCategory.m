//
//  UITabBarItem+HGCCategory.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/9/11.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "UITabBarItem+HGCCategory.h"
#import "UIView+HGCCategory.h"

@implementation UITabBarItem (HGCCategory)

#pragma mark - Private Methods

/**
 *  Because UIBarButtonItem is kind of NSObject, it is not able to directly attach badge.
 *  This method is used to find actual view (non-nil) inside UIBarButtonItem instance.
 *
 *  @return view
 */
- (UIView *)_getActualBadgeSuperView {
    // 1. get UITabbarButton
    UIView *bottomView = [self valueForKeyPath:@"_view"];
    
    // 2. get imageView, to make sure badge front at anytime.
    UIView *actualSuperView = nil;
    if (bottomView) {
        actualSuperView = [self _find:bottomView firstSubviewWithClass:NSClassFromString(@"UITabBarSwappableImageView")];
    }
    
    // badge label will be added onto imageView
    return actualSuperView;
}

- (UIView *)_find:(UIView *)view firstSubviewWithClass:(Class)cls {
    __block UIView *targetView = nil;
    [view.subviews enumerateObjectsUsingBlock:^(UIView *subview, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([subview isKindOfClass:cls]) {
            targetView = subview;
            *stop = YES;
        }
    }];
    return targetView;
}

#pragma mark - Badge

#define _HGC_tabbaritem_reddot_tag  912

- (void)hgc_addRedDotBadge {
    UIView *view = [self _getActualBadgeSuperView];
    if (view && [view viewWithTag:_HGC_tabbaritem_reddot_tag] == nil) {
        CGFloat redDotDimension = 6;
        CGRect frame = view.bounds;
        frame.origin.x = frame.size.width - redDotDimension;
        frame.origin.y = 0;
        frame.size.width = redDotDimension;
        frame.size.height = redDotDimension;
        UIView *redDot = [UIView hgc_viewWithColor:[UIColor redColor]];
        redDot.tag = _HGC_tabbaritem_reddot_tag;
        redDot.frame = frame;
        [redDot hgc_addBorderWithRadius:redDotDimension / 2 color:nil width:0];
        [view addSubview:redDot];
    }
}

- (void)hgc_clearRedDotBadge {
    UIView *view = [self _getActualBadgeSuperView];
    [[view viewWithTag:_HGC_tabbaritem_reddot_tag] removeFromSuperview];
}

#pragma mark - Title and Image Position

- (void)hgc_setTitleOffset:(UIOffset)titleOffset imageInset:(UIEdgeInsets)imgInsets {
    self.titlePositionAdjustment = titleOffset;
    self.imageInsets = imgInsets;
}

@end

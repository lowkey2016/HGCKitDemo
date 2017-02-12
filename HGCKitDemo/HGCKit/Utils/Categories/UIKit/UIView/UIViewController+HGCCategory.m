//
//  UIViewController+HGCCategory.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/7/24.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import "UIViewController+HGCCategory.h"
#import "HGCMacros.h"
#import "NSString+HGCCategory.h"
#import "ALAlertBanner.h"
#import "HGCProgressHUD.h"

#ifdef _HGC_isMainThread
#undef _HGC_isMainThread
#endif
#define _HGC_isMainThread   [[NSThread currentThread] isMainThread]

#ifdef _HGC_isNotMainThread
#undef _HGC_isNotMainThread
#endif
#define _HGC_isNotMainThread   ![[NSThread currentThread] isMainThread]

#ifdef _HGC_HUDContainerView
#undef _HGC_HUDContainerView
#endif
#define _HGC_HUDContainerView (self.view ?: HGCApplicationWindow)

#define kHGCHUDHideDelay    2.0
#define kHGCHUDDimissDelay  2.2

@implementation UIViewController (HGCCategory)


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Storyboard

+ (id)hgc_rootViewControllerInMainStoryboard {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    return [sb instantiateInitialViewController];
}

+ (id)hgc_viewControllerInMainStoryboardWithClass:(Class)controllerClass {
    NSString *className = [controllerClass description];
    return [self hgc_viewControllerInMainStoryboardWithIdentifier:className];
}

+ (id)hgc_viewControllerInMainStoryboardWithIdentifier:(NSString *)controllerId {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *controller = [sb instantiateViewControllerWithIdentifier:controllerId];
    return controller;
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Custom Alert View

- (void)hgc_alertWithTitle:(NSString *)title detail:(NSString *)detail {
    [self hgc_alertWithTitle:title detail:detail dismissBlock:nil];
}

- (void)hgc_alertWithTitle:(NSString *)title detail:(NSString *)detail dismissBlock:(HGCHUDDismissBlock)block {
    if (_HGC_isNotMainThread) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self hgc_alertWithTitle:title detail:detail dismissBlock:block];
        });
        
        return;
    }
    
    UIView *containerView = _HGC_HUDContainerView;
    [HGCProgressHUD hideAllHUDsForView:containerView animated:NO];
    
    HGCProgressHUD *hud = [HGCProgressHUD showHUDAddedTo:containerView animated:YES];
    hud.mode = HGCProgressHUDModeText;
    hud.labelText = title;
    hud.detailsLabelText = detail;
    dispatch_async(dispatch_get_main_queue(), ^{
        [hud hide:YES afterDelay:kHGCHUDHideDelay];
        if (block) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kHGCHUDDimissDelay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                block();
            });
        }
    });
}

+ (void)hgc_alertInWindowWithTitle:(NSString *)title detail:(NSString *)detail {
    [self hgc_alertInWindowWithTitle:title detail:detail dismissBlock:nil];
}

+ (void)hgc_alertInWindowWithTitle:(NSString *)title detail:(NSString *)detail dismissBlock:(HGCHUDDismissBlock)block
{
    if (_HGC_isNotMainThread) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self hgc_alertInWindowWithTitle:title detail:detail dismissBlock:block];
        });
        
        return;
    }
    
    [HGCProgressHUD hideAllHUDsForView:HGCApplicationWindow animated:NO];
    
    HGCProgressHUD *hud = [HGCProgressHUD showHUDAddedTo:HGCApplicationWindow animated:YES];
    hud.mode = HGCProgressHUDModeText;
    hud.labelText = title;
    hud.detailsLabelText = detail;
    dispatch_async(dispatch_get_main_queue(), ^{
        [hud hide:YES afterDelay:kHGCHUDHideDelay];
        if (block) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kHGCHUDDimissDelay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                block();
            });
        }
    });
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Progress HUD

- (void)hgc_showProgressHUD {
    if (_HGC_isNotMainThread) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self hgc_showProgressHUD];
        });
        
        return;
    }
    
    [self hgc_showProgressHUDWithHint:nil];
}

- (void)hgc_showProgressHUDWithHint:(NSString *)hint {
    if (_HGC_isNotMainThread) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self hgc_showProgressHUDWithHint:hint];
        });
        
        return;
    }
    
    UIView *containerView = _HGC_HUDContainerView;
    [HGCProgressHUD hideAllHUDsForView:containerView animated:NO];
    HGCProgressHUD *HUD = [HGCProgressHUD showHUDAddedTo:containerView animated:YES];
    if (hint && [hint hgc_isNotEmpty]) {
        HUD.labelText = hint;
        HUD.labelFont = [UIFont systemFontOfSize:14.0f];
    }
}

- (void)hgc_hideProgessHUD {
    if (_HGC_isNotMainThread) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self hgc_hideProgessHUD];
        });
        
        return;
    }
    
    [HGCProgressHUD hideHUDForView:HGCApplicationWindow animated:YES];
    [HGCProgressHUD hideHUDForView:self.view animated:YES];
}

+ (void)hgc_showProgressHUDInWindow {
    [self hgc_showProgressHUDInWindowWithHint:nil];
}

+ (void)hgc_showProgressHUDInWindowWithHint:(NSString *)hint {
    if (_HGC_isNotMainThread) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self hgc_showProgressHUDInWindowWithHint:hint];
        });
        
        return;
    }
    
    [HGCProgressHUD hideAllHUDsForView:HGCApplicationWindow animated:NO];
    
    HGCProgressHUD *HUD = [HGCProgressHUD showHUDAddedTo:HGCApplicationWindow animated:YES];
    if (hint && [hint hgc_isNotEmpty]) {
        HUD.labelText = hint;
        HUD.labelFont = [UIFont systemFontOfSize:14.0f];
    }
}

+ (void)hgc_hideProgressHUDInWindow {
    if (_HGC_isNotMainThread) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self hgc_hideProgressHUDInWindow];
        });
        
        return;
    }
    
    [HGCProgressHUD hideHUDForView:HGCApplicationWindow animated:YES];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Alert Banner

- (void)hgc_showSuccessAlertBannerAtTopWithTitle:(NSString *)title {
    [ALAlertBanner forceHideAllAlertBannersInView:self.view];
    ALAlertBanner *banner = [ALAlertBanner alertBannerForView:self.view style:ALAlertBannerStyleSuccess position:ALAlertBannerPositionTop title:title subtitle:nil];
    banner.bannerOpacity = 1;
    banner.secondsToShow = 1.5;
    banner.allowTapToDismiss = YES;
    [banner show];
}

- (void)hgc_showFailAlertBannerAtTopWithTitle:(NSString *)title subTitle:(NSString *)subTitle {
    [ALAlertBanner forceHideAllAlertBannersInView:self.view];
    ALAlertBanner *banner = [ALAlertBanner alertBannerForView:self.view style:ALAlertBannerStyleFailure position:ALAlertBannerPositionTop title:title subtitle:subTitle];
    banner.bannerOpacity = 1;
    banner.secondsToShow = 1.5;
    banner.allowTapToDismiss = YES;
    [banner show];
}

- (void)hgc_hideAllAlertBanners {
    [ALAlertBanner forceHideAllAlertBannersInView:self.view];
}

@end


///////////////////////////////////////////////////////////////////////////////////////////


#undef _HGC_isMainThread
#undef _HGC_isNotMainThread
#undef _HGC_HUDContainerView

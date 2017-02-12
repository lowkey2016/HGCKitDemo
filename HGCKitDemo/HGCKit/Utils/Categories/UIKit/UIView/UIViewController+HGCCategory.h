//
//  UIViewController+HGCCategory.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/7/24.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HGCProgressHUD.h"

typedef void(^HGCHUDDismissBlock)();

@interface UIViewController (HGCCategory)

/**************/
/* Storyboard */
/**************/
+ (id)hgc_rootViewControllerInMainStoryboard;
+ (id)hgc_viewControllerInMainStoryboardWithClass:(Class)controllerClass;
+ (id)hgc_viewControllerInMainStoryboardWithIdentifier:(NSString *)controllerId;

/*********************/
/* Custom Alert View */
/*********************/
- (void)hgc_alertWithTitle:(NSString *)title detail:(NSString *)detail;
- (void)hgc_alertWithTitle:(NSString *)title detail:(NSString *)detail dismissBlock:(HGCHUDDismissBlock)block;

+ (void)hgc_alertInWindowWithTitle:(NSString *)title detail:(NSString *)detail;
+ (void)hgc_alertInWindowWithTitle:(NSString *)title detail:(NSString *)detail dismissBlock:(HGCHUDDismissBlock)block;

/*******/
/* HUD */
/*******/
- (void)hgc_showProgressHUD;
- (void)hgc_showProgressHUDWithHint:(NSString *)hint;
- (void)hgc_hideProgessHUD;

+ (void)hgc_showProgressHUDInWindow;
+ (void)hgc_showProgressHUDInWindowWithHint:(NSString *)hint;
+ (void)hgc_hideProgressHUDInWindow;

/****************/
/* Alert Banner */
/****************/

- (void)hgc_showSuccessAlertBannerAtTopWithTitle:(NSString *)title;
- (void)hgc_showFailAlertBannerAtTopWithTitle:(NSString *)title subTitle:(NSString *)subTitle;
- (void)hgc_hideAllAlertBanners;

@end

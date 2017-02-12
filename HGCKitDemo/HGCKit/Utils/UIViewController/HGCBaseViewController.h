//
//  HGCBaseViewController.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/7/24.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HGCBaseLeftItemType) {
    HGCBaseLeftItemTypeNone     = 0,
    HGCBaseLeftItemTypePop      = 1,
    HGCBaseLeftItemTypeDismiss  = 2,
};

@class HGCButton;
@class HGCNavigationTitleView;
@class HGCImageView;

@interface HGCBaseViewController : UIViewController

@property (nonatomic, strong) HGCButton *leftBarButtonItem;
@property (nonatomic, strong) HGCButton *rightBarButtonItem;
@property (nonatomic, strong) HGCNavigationTitleView *titleView;

- (void)setTitle:(NSString *)title titleViewText:(NSString *)titleViewTitle logo:(UIImage *)image;
- (void)setTitle:(NSString *)title titleViewText:(NSString *)titleViewTitle textColor:(UIColor *)titleViewTextColor titleViewFont:(UIFont *)titleViewFont logo:(UIImage *)image;
- (void)setLeftItemType:(HGCBaseLeftItemType)leftItemType backgroundImage:(UIImage *)bgImg;
@property (nonatomic, assign) HGCBaseLeftItemType leftItemType;

//- (void)setupBadNetworkTipsImage:(UIImage *)badnetworkImg
//                            size:(CGSize)imgSize
//                       tapAction:(void (^)())tapAction;
//@property (nonatomic, strong) HGCImageView *badnetworkTipsImageView;

@end

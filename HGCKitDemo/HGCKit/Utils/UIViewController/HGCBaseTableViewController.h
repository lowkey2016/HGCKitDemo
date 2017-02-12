//
//  HGCBaseTableViewController.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/7/24.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HGCBaseTableLeftItemType) {
    HGCBaseTableLeftItemTypeNone     = 0,
    HGCBaseTableLeftItemTypePop      = 1,
    HGCBaseTableLeftItemTypeDismiss  = 2,
};

@class HGCButton;
@class HGCNavigationTitleView;

@interface HGCBaseTableViewController : UITableViewController

@property (nonatomic, strong) HGCButton *leftBarButtonItem;
@property (nonatomic, strong) HGCButton *rightBarButtonItem;
@property (nonatomic, strong) HGCNavigationTitleView *titleView;

- (void)setTitle:(NSString *)title
   titleViewText:(NSString *)titleViewTitle
            logo:(UIImage *)image;
- (void)setLeftItemType:(HGCBaseTableLeftItemType)leftItemType backgroundImage:(UIImage *)bgImg;
- (void)setTitle:(NSString *)title titleViewText:(NSString *)titleViewTitle textColor:(UIColor *)titleViewTextColor titleViewFont:(UIFont *)titleViewFont logo:(UIImage *)image;
@property (nonatomic, assign) HGCBaseTableLeftItemType leftItemType;

@end

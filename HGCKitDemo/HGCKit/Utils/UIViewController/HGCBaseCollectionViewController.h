//
//  HGCBaseCollectionViewController.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/8/11.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HGCBaseCollectionLeftItemType) {
    HGCBaseCollectionLeftItemTypeNone     = 0,
    HGCBaseCollectionLeftItemTypePop      = 1,
    HGCBaseCollectionLeftItemTypeDismiss  = 2,
};

@class HGCButton;
@class HGCNavigationTitleView;

@interface HGCBaseCollectionViewController : UICollectionViewController

@property (nonatomic, strong) HGCButton *leftBarButtonItem;
@property (nonatomic, strong) HGCButton *rightBarButtonItem;
@property (nonatomic, strong) HGCNavigationTitleView *titleView;

- (void)setTitle:(NSString *)title
   titleViewText:(NSString *)titleViewTitle
            logo:(UIImage *)image;
- (void)setLeftItemType:(HGCBaseCollectionLeftItemType)leftItemType backgroundImage:(UIImage *)bgImg;
- (void)setTitle:(NSString *)title titleViewText:(NSString *)titleViewTitle textColor:(UIColor *)titleViewTextColor titleViewFont:(UIFont *)titleViewFont logo:(UIImage *)image;
@property (nonatomic, assign) HGCBaseCollectionLeftItemType leftItemType;

@end

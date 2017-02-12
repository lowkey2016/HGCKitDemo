//
//  UITabBarItem+HGCCategory.h
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/9/11.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarItem (HGCCategory)

- (void)hgc_addRedDotBadge;
- (void)hgc_clearRedDotBadge;

- (void)hgc_setTitleOffset:(UIOffset)titleOffset imageInset:(UIEdgeInsets)imgInsets;

@end

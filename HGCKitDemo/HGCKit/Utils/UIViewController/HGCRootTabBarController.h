//
//  HGCRootTabBarController.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/7/24.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HGCRootTabBarController : UITabBarController

- (void)configTabBarItemsWithCount:(NSInteger)tabBarItemsCount;

- (void)updateSelectStatus:(NSInteger)selectedIndex;

@end

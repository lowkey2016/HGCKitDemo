//
//  HGCRootTabBarController.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/7/24.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import "HGCRootTabBarController.h"
#import "UIColor+HGCUtil.h"

@interface HGCRootTabBarController ()

@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) NSMutableArray *tabBarItemBackgroundViews;

@end

@implementation HGCRootTabBarController


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - View

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Style

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

#pragma mark - Rotate

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return (UIInterfaceOrientationMaskPortrait);
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Public Methods

- (void)configTabBarItemsWithCount:(NSInteger)tabBarItemsCount {
    if (tabBarItemsCount <= 0) {
        return;
    }
    
    CGRect rect = self.tabBar.bounds;
    rect.size.width = [[UIScreen mainScreen] bounds].size.width / tabBarItemsCount;
    
    self.tabBarItemBackgroundViews = [NSMutableArray array];
    for (NSInteger i = 0; i < tabBarItemsCount; i++) {
        rect.origin.x = i * rect.size.width;
        UIView *bgView = [[UIView alloc] initWithFrame:rect];
        bgView.hidden = YES;
        [self.tabBar insertSubview:bgView atIndex:0];
        [_tabBarItemBackgroundViews addObject:bgView];
    }
    
    self.currentIndex = -1;
    [self updateSelectStatus:0];
}

- (void)updateSelectStatus:(NSInteger)selectedIndex {
    if (_currentIndex == selectedIndex) {
        return;
    }
    else {
        if (_currentIndex >= 0) {
            UIView *preBGView = _tabBarItemBackgroundViews[_currentIndex];
            preBGView.hidden = YES;
        }
        UIView *curBGView = _tabBarItemBackgroundViews[selectedIndex];
        curBGView.hidden = NO;
        _currentIndex = selectedIndex;
    }
}

@end

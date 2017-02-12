//
//  HGCBaseViewController.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/7/24.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import "HGCBaseViewController.h"
#import "UINavigationItem+Margin.h"
#import "HGCButton.h"
#import "HGCNavigationTitleView.h"
#import "HGCImageView.h"
#import "HGCMasonryWrapper.h"


///////////////////////////////////////////////////////////////////////////////////////////


@interface HGCBaseViewController ()

@end

@implementation HGCBaseViewController


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - View

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setTitle:(NSString *)title titleViewText:(NSString *)titleViewTitle logo:(UIImage *)image {
    [self setTitle:title titleViewText:titleViewTitle textColor:nil titleViewFont:nil logo:image];
}

- (void)setTitle:(NSString *)title titleViewText:(NSString *)titleViewTitle textColor:(UIColor *)titleViewTextColor titleViewFont:(UIFont *)titleViewFont logo:(UIImage *)image
{
    self.title = title;
    self.titleView = [[HGCNavigationTitleView alloc] initWithFrame:CGRectMake(0, 0, 100, 36) title:titleViewTitle textColor:titleViewTextColor font:titleViewFont logo:image];
    self.navigationItem.titleView = _titleView;
}

- (void)setLeftItemType:(HGCBaseLeftItemType)leftItemType backgroundImage:(UIImage *)bgImg {
    self.leftBarButtonItem = [[HGCButton alloc] initWithTitle:nil fontSize:0 isBoldFont:NO backgroundImage:bgImg highlightedImage:nil frame:CGRectMake(0, 0, 30, 30) type:HGCButtonTypeImage];
    
    if (leftItemType == HGCBaseLeftItemTypeNone) {
        return;
    }
    else if (leftItemType == HGCBaseLeftItemTypePop) {
        [_leftBarButtonItem addTarget:self action:@selector(popAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    else if (leftItemType == HGCBaseLeftItemTypeDismiss) {
        [_leftBarButtonItem addTarget:self action:@selector(dismissAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_leftBarButtonItem];
    self.navigationItem.leftMargin = 15;
}

- (void)setLeftItemType:(HGCBaseLeftItemType)leftItemType {
    [self setLeftItemType:leftItemType backgroundImage:[UIImage imageNamed:@"btn_common_goback"]];
}

#pragma mark - Memory

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    
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

#pragma mark - Extend Layout

- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Button Actions

- (void)dismissAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)popAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end

//
//  HGCContentScrollView.h
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/9/8.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HGCContentScrollView : UIScrollView

@property (nonatomic, readonly, strong) UIView *contentView;

+ (instancetype)viewWithBackgroundColor:(UIColor *)bgColor
                               delegate:(id<UIScrollViewDelegate>)delegate
                         addToSuperview:(UIView *)superview
                             edgeInsets:(UIEdgeInsets)insets;

- (void)beginAddView:(UIView *)view toContentViewWithTopMargin:(CGFloat)margin;
- (void)addViewToContentView:(UIView *)view;
- (void)endAddView:(UIView *)view toContentViewWithBottomMargin:(CGFloat)margin;

@end

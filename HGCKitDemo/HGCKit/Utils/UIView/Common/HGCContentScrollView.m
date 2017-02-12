//
//  HGCContentScrollView.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/9/8.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "HGCContentScrollView.h"
#import "UIView+HGCMasonryWrapper.h"


///////////////////////////////////////////////////////////////////////////////////////////


@interface HGCContentScrollView ()

@property (nonatomic, readwrite, strong) UIView *contentView;

@end

@implementation HGCContentScrollView


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Init

+ (instancetype)viewWithBackgroundColor:(UIColor *)bgColor
                               delegate:(id<UIScrollViewDelegate>)delegate
                         addToSuperview:(UIView *)superview
                             edgeInsets:(UIEdgeInsets)insets
{
    return [[HGCContentScrollView alloc] initWithBackgroundColor:bgColor delegate:delegate addToSuperview:superview edgeInsets:insets];
}

- (instancetype)initWithBackgroundColor:(UIColor *)bgColor
                               delegate:(id<UIScrollViewDelegate>)delegate
                         addToSuperview:(UIView *)superview
                             edgeInsets:(UIEdgeInsets)insets
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.backgroundColor = bgColor;
        self.pagingEnabled = NO;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.delegate = delegate;
        
        if (superview) {
            [superview addSubview:self];
            self.hgc_make.edgeToSuperView(insets);
        }
        
        _contentView = [UIView new];
        _contentView.backgroundColor = bgColor;
        [self addSubview:_contentView];
        _contentView.hgc_make.edgeAlignToSuperView().widthEqualToSuperview();
    }
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Add Views

- (void)beginAddView:(UIView *)view toContentViewWithTopMargin:(CGFloat)margin {
    if (view == nil) {
        return;
    }
    
    [_contentView addSubview:view];
    view.hgc_make.topToSuperView(margin);
}

- (void)addViewToContentView:(UIView *)view {
    if (view == nil) {
        return;
    }
    
    [_contentView addSubview:view];
}

- (void)endAddView:(UIView *)view toContentViewWithBottomMargin:(CGFloat)margin {
    if (view == nil) {
        return;
    }
    
    [_contentView addSubview:view];
    _contentView.hgc_make.bottomTo(view, -margin);
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Override Methods

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (CGRectEqualToRect(self.frame, CGRectZero)) {
        self.scrollEnabled = YES;
    }
    else {
        CGSize frameSize = self.frame.size;
        CGSize contentSize = self.contentSize;
        self.scrollEnabled = (contentSize.height > frameSize.height ||
                              contentSize.width > frameSize.width);
    }
}

@end

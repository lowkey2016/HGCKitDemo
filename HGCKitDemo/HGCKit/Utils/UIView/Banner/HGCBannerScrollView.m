//
//  HGCBannerScrollView.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/8/10.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import "HGCBannerScrollView.h"
#import "HGCMacros.h"
#import "HGCConstants.h"
#import "UIImageView+HGCWebImage.h"
#import "UIColor+HGCUtil.h"
#import "UIView+HGCFrameSugar.h"
#import "HWWeakTimer.h"
#import "HGCMasonryWrapper.h"
#import "StyledPageControl.h"


///////////////////////////////////////////////////////////////////////////////////////////


@interface HGCBannerScrollView () <UIScrollViewDelegate>

@property (nonatomic, assign) CGRect pageFrame;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) NSInteger allPages;
@property (nonatomic, weak) id<HGCBannerScrollViewDelegate> delegate;
@property (nonatomic, copy) NSArray<NSString *> *allImageURLStrings;
@property (nonatomic, strong) NSMutableArray<NSString *> *curImageURLStrings;
@property (nonatomic, strong) UIImage *loadingPlaceholderImage;
@property (nonatomic, strong) UIImage *loadfailPlaceholderImage;
@property (nonatomic, assign) HGCBannerPageControlPosition pagePosition;
@property (nonatomic, assign) CGFloat pageDotDimension;
@property (nonatomic, assign) CGFloat pageDotMargin;

@property (nonatomic, strong) UIScrollView *mainScrollView;
@property (nonatomic, strong) UIImageView *curImageView;
@property (nonatomic, strong) StyledPageControl *pageControl;

@property (nonatomic, assign) BOOL autoScrollEnable;
@property (nonatomic, weak) NSTimer *scrollEventTimer;

@end

@implementation HGCBannerScrollView


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame
                     delegate:(id<HGCBannerScrollViewDelegate>)delegate
              imageURLStrings:(NSArray *)allImageURLStrings
                 loadingImage:(UIImage *)loadingImg
                loadFailImage:(UIImage *)loadFailImg
          pageControlPosition:(HGCBannerPageControlPosition)position
             pageDotDimension:(CGFloat)dotDimention
                pageDotMargin:(CGFloat)dotMargin
             pageDotTintColor:(UIColor *)dotColor
          curPageDotTintColor:(UIColor *)curDotColor
           pageDotStrokeColor:(UIColor *)dotStrokeColor
           pageDotStrokeWidth:(CGFloat)dotStrokeWidth
                   autoScroll:(BOOL)enableAutoScroll
{
    self = [super initWithFrame:frame];
    if (self) {
        // 先 setup 数据
        _pageFrame = (CGRect){CGPointZero, frame.size};
        _delegate = delegate;
        _loadingPlaceholderImage = loadingImg;
        _loadfailPlaceholderImage = loadFailImg;
        _autoScrollEnable = enableAutoScroll;
        
        // 再 setup UI
        [self setupMainScrollViewWithFrame:frame];
        [self setupPageControlWithPosition:HGCBannerPageControlPositionRight dotDimension:dotDimention dotMargin:dotMargin dotColor:dotColor curDotColor:curDotColor dotStrokeColor:dotStrokeColor dotStrokeWidth:dotStrokeWidth];
        
        // 加载数据源
        [self reloadDataSourceWithImageURLStrings:allImageURLStrings];
    }
    return self;
}

- (void)setupMainScrollViewWithFrame:(CGRect)frame {
    self.mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
    _mainScrollView.bounces = NO;
    _mainScrollView.bouncesZoom = NO;
    _mainScrollView.pagingEnabled = YES;
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    _mainScrollView.showsVerticalScrollIndicator = NO;
    _mainScrollView.delegate = self;
    _mainScrollView.contentSize = CGSizeMake(frame.size.width * 3, frame.size.height);
    _mainScrollView.backgroundColor = self.backgroundColor;
    _mainScrollView.frame = frame;
    _mainScrollView.scrollsToTop = NO; // 不要妨碍顶部电池栏响应点击后，表格返回顶部的手势
    [self addSubview:_mainScrollView];
}

- (void)setupPageControlWithPosition:(HGCBannerPageControlPosition)position
                        dotDimension:(CGFloat)dotDimension
                           dotMargin:(CGFloat)dotMargin
                            dotColor:(UIColor *)dotColor
                         curDotColor:(UIColor *)curDotColor
                      dotStrokeColor:(UIColor *)dotStrokeColor
                      dotStrokeWidth:(CGFloat)dotStrokeWidth
{
    if (dotDimension <= 0) {
        dotDimension = 10;
    }
    if (dotMargin <= 0) {
        dotMargin = 8;
    }
    if (dotColor == nil) {
        dotColor = [UIColor whiteColor];
    }
    if (curDotColor == nil) {
        curDotColor = [UIColor lightGrayColor];
    }
    if (dotStrokeWidth < 0) {
        dotStrokeWidth = 0;
    }
    
    self.pagePosition = position;
    self.pageDotDimension = dotDimension;
    self.pageDotMargin = dotMargin;
    
    self.pageControl = [[StyledPageControl alloc] initWithFrame:CGRectZero];
    _pageControl.hidden = NO;
    _pageControl.hidesForSinglePage = YES;
    _pageControl.coreNormalColor = dotColor;
    _pageControl.coreSelectedColor = curDotColor;
    _pageControl.strokeNormalColor = dotStrokeColor;
    _pageControl.strokeSelectedColor = dotStrokeColor;
    _pageControl.pageControlStyle = PageControlStyleDefault;
    _pageControl.strokeWidth = dotStrokeWidth;
    _pageControl.diameter = dotDimension;
    _pageControl.gapWidth = dotMargin;
    _pageControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self addSubview:_pageControl];
}

#pragma mark - Memory

- (void)dealloc {
    if ([_scrollEventTimer isValid]) {
        [_scrollEventTimer invalidate];
        _scrollEventTimer = nil;
    }
    _mainScrollView.delegate = nil;
    _mainScrollView = nil;
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Reload View

- (void)reloadMainScrollView {
    NSArray *subViews = [_mainScrollView subviews];
    if(subViews.count > 0) {
        [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
    [self getDisplayImagesWithCurpage:_currentPage];
    
    for (NSInteger i = 0; i < 3; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:_pageFrame];
        NSString *urlstring = _curImageURLStrings[i];
        [imageView hgc_setImageWithURLString:urlstring placeholderImage:_loadingPlaceholderImage loadFailImage:_loadfailPlaceholderImage scaleToFillSize:CGSizeZero];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        imageView.frame = CGRectOffset(imageView.frame, _pageFrame.size.width * i, 0);
        imageView.userInteractionEnabled = YES;
        imageView.tag = i;
        UITapGestureRecognizer *tapInImageView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInImageViewAction:)];
        [imageView addGestureRecognizer:tapInImageView];
        [_mainScrollView addSubview:imageView];
        
        if (i == 1) {
            self.curImageView = imageView;
        }
    }
    
    [_mainScrollView setContentOffset:CGPointMake(_pageFrame.size.width, 0)];
}

- (NSArray *)getDisplayImagesWithCurpage:(NSInteger)page {
    NSInteger pre = [self validPageValue:_currentPage - 1];
    NSInteger last = [self validPageValue:_currentPage + 1];
    
    if(_curImageURLStrings.count > 0) {
        [_curImageURLStrings removeAllObjects];
    }
    
    [_curImageURLStrings addObject:_allImageURLStrings[pre - 1]];
    [_curImageURLStrings addObject:_allImageURLStrings[_currentPage - 1]];
    [_curImageURLStrings addObject:_allImageURLStrings[last - 1]];
    
    return _curImageURLStrings;
}

- (NSInteger)validPageValue:(NSInteger)value {
    if (value == 0) {
        value = _allPages; // value＝1为第一张，value = 0为前面一张
    }
    if (value == _allPages + 1) {
        value = 1;
    }
    
    return value;
}

#pragma mark - Scroll

- (void)fireScrollEventTimer {
    if ([_scrollEventTimer isValid] == NO) {
        self.scrollEventTimer = [HWWeakTimer scheduledTimerWithTimeInterval:3.5 target:self selector:@selector(scrollToNextPage) userInfo:nil repeats:YES];
        // 不需要在 scroll view 滑动时回调
        // [[NSRunLoop currentRunLoop] addTimer:_scrollEventTimer forMode:NSRunLoopCommonModes];
    }
}

- (void)invalidateScrollEventTimer {
    if ([_scrollEventTimer isValid]) {
        [self.scrollEventTimer invalidate];
        self.scrollEventTimer = nil;
    }
}

- (void)scrollToNextPage {
    if (_autoScrollEnable) {
        CGPoint offset = _mainScrollView.contentOffset;
        offset.x += _pageFrame.size.width;
        NSInteger page = (NSInteger)(offset.x / _pageFrame.size.width);
        offset.x = page * _pageFrame.size.width;
        [_mainScrollView setContentOffset:offset animated:YES];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Public Methods

/**
 *  Reload
 */

- (void)reloadDataSourceWithImageURLStrings:(NSArray *)allImageURLStrings {
    if (allImageURLStrings == nil || [allImageURLStrings count] == 0) {
        _allPages = 0;
        _currentPage = 0;
        
        return;
    }
    
    // 先停止自动滑动
    BOOL shouldAutoScroll = _autoScrollEnable;
    [self stopAutoScroll];
    
    _allImageURLStrings = [allImageURLStrings copy];
    _allPages = [_allImageURLStrings count];
    _currentPage = 1;
    if (_curImageURLStrings) {
        [_curImageURLStrings removeAllObjects];
    }
    else {
        _curImageURLStrings = [NSMutableArray array];
    }
    
    _mainScrollView.scrollEnabled = _allPages > 1;
    _pageControl.currentPage = 0;
    _pageControl.numberOfPages = _allPages;
    NSInteger dotCount = _allPages;
    if (dotCount > 0) {
        _pageControl.frame = CGRectMake(0, 0, (dotCount * _pageDotDimension + (dotCount - 1) * _pageDotMargin), _pageDotDimension);
        _pageControl.frame_bottom = _pageFrame.size.height - 7;
        switch (_pagePosition) {
            case HGCBannerPageControlPositionLeft: {
                _pageControl.frame_x = 8;
                break;
            }
            case HGCBannerPageControlPositionCenter: {
                _pageControl.frame_centerX = CGRectGetMidX(_pageFrame);
                break;
            }
            case HGCBannerPageControlPositionRight: {
                _pageControl.frame_right = _pageFrame.size.width - 8;
                break;
            }
        }
    }
    [self reloadMainScrollView];
    
    // 恢复是否自由滑动
    self.autoScrollEnable = shouldAutoScroll;
    if (_autoScrollEnable) {
        [self startAutoScroll];
    }
}

/**
 *  Scroll
 */

- (void)startAutoScroll {
    self.autoScrollEnable = YES;
    if (_allPages > 1) {
        [self fireScrollEventTimer];
    }
}

- (void)stopAutoScroll {
    self.autoScrollEnable = NO;
    [self invalidateScrollEventTimer];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self invalidateScrollEventTimer];
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
    NSInteger x = aScrollView.contentOffset.x;
    
    // 往下翻一张
    if (x >= (2 * _pageFrame.size.width)) {
        _currentPage = [self validPageValue:_currentPage + 1];
        [self reloadMainScrollView];
    }
    // 往上翻一页
    if (x <= 0) {
        _currentPage = [self validPageValue:_currentPage - 1];
        [self reloadMainScrollView];
    }
    
    if (_pageControl) {
        _pageControl.currentPage = _currentPage - 1;
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [_mainScrollView setContentOffset:CGPointMake(_pageFrame.size.width, 0) animated:YES];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self fireScrollEventTimer];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Gesture Actions

- (void)tapInImageViewAction:(UITapGestureRecognizer *)tap {
    NSInteger callbackPage = _currentPage - 1;
    if (_tapAction) {
        _tapAction(callbackPage);
    }
    else {
        if (_delegate && [_delegate respondsToSelector:@selector(bannerScrollViewDidTapPage:)])
        {
            [_delegate bannerScrollViewDidTapPage:callbackPage];
        }
    }
}

@end

//
//  HGCBannerScrollView.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/8/10.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HGCBannerScrollViewDelegate <NSObject>
// curPage从0算起
- (void)bannerScrollViewDidTapPage:(NSInteger)curPage;
@end

typedef NS_ENUM(NSUInteger, HGCBannerPageControlPosition) {
    HGCBannerPageControlPositionLeft = 0,
    HGCBannerPageControlPositionCenter,
    HGCBannerPageControlPositionRight,
};

@interface HGCBannerScrollView : UIView

// 优先于 HGCBannerScrollViewDelegate 中的 bannerScrollViewDidTapPage: 方法调用
@property (nonatomic, copy) void (^tapAction)(NSInteger curPage);

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
                   autoScroll:(BOOL)enableAutoScroll;
- (void)reloadDataSourceWithImageURLStrings:(NSArray *)allImageURLStrings;

- (void)startAutoScroll;
- (void)stopAutoScroll;

@end

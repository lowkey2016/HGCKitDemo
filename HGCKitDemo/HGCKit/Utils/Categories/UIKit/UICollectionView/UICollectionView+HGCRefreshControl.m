//
//  UICollectionView+HGCRefreshControl.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/8/11.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import "UICollectionView+HGCRefreshControl.h"

@implementation UICollectionView (HGCRefreshControl)

- (void)hgc_addHeaderWithRefreshingTarget:(id)target refreshingAction:(SEL)action {
    [self hgc_addHeaderWithRefreshingTarget:target
                           refreshingAction:action
                          titleForIdleState:@"下拉刷新"
                       titleForPullingState:@"松开刷新"
                    titleForRefreshingState:@"正在刷新...."];
}

- (void)hgc_addHeaderWithRefreshingTarget:(id)target
                         refreshingAction:(SEL)action
                        titleForIdleState:(NSString *)idleText
                     titleForPullingState:(NSString *)pullingText
                  titleForRefreshingState:(NSString *)refreshingText
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];
    [header setTitle:idleText forState:MJRefreshStateIdle];
    [header setTitle:pullingText forState:MJRefreshStatePulling];
    [header setTitle:refreshingText forState:MJRefreshStateRefreshing];
    self.mj_header = header;
}

- (void)hgc_addFooterWithRefreshingTarget:(id)target refreshingAction:(SEL)action {
    [self hgc_addFooterWithRefreshingTarget:target
                           refreshingAction:action
                          titleForIdleState:@""
                    titleForRefreshingState:@"正在刷新...."
                    titleForNoMoreDataState:@"没有了"];
}

- (void)hgc_addFooterWithRefreshingTarget:(id)target
                         refreshingAction:(SEL)action
                        titleForIdleState:(NSString *)idleText
                  titleForRefreshingState:(NSString *)refreshingText
                  titleForNoMoreDataState:(NSString *)noMoreDataText
{
    [self hgc_addFooterWithRefreshingTarget:target
                           refreshingAction:action
                          titleForIdleState:idleText
                    titleForRefreshingState:refreshingText
                    titleForNoMoreDataState:noMoreDataText
                                  textColor:nil
                                   fontSize:0];
}

- (void)hgc_addFooterWithRefreshingTarget:(id)target
                         refreshingAction:(SEL)action
                        titleForIdleState:(NSString *)idleText
                  titleForRefreshingState:(NSString *)refreshingText
                  titleForNoMoreDataState:(NSString *)noMoreDataText
                                textColor:(UIColor *)textColor
                                 fontSize:(CGFloat)fontSize
{
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:action];
    [footer setTitle:idleText forState:MJRefreshStateIdle];
    [footer setTitle:refreshingText forState:MJRefreshStateRefreshing];
    [footer setTitle:noMoreDataText forState:MJRefreshStateNoMoreData];
    footer.triggerAutomaticallyRefreshPercent = -1.0;
    if (textColor) {
        footer.stateLabel.textColor = textColor;
    }
    if (fontSize > 0) {
        footer.stateLabel.font = [UIFont systemFontOfSize:fontSize];
    }
    self.mj_footer = footer;
}

@end

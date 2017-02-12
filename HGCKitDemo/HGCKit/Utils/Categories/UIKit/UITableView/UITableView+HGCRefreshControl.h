//
//  UITableView+HGCRefreshControl.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/8/11.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>

@interface UITableView (HGCRefreshControl)

- (void)hgc_addHeaderWithRefreshingTarget:(id)target refreshingAction:(SEL)action;
- (void)hgc_addHeaderWithRefreshingTarget:(id)target
                         refreshingAction:(SEL)action
                        titleForIdleState:(NSString *)idleText
                     titleForPullingState:(NSString *)pullingText
                  titleForRefreshingState:(NSString *)refreshingText;


- (void)hgc_addFooterWithRefreshingTarget:(id)target refreshingAction:(SEL)action;
- (void)hgc_addFooterWithRefreshingTarget:(id)target
                         refreshingAction:(SEL)action
                        titleForIdleState:(NSString *)idleText
                  titleForRefreshingState:(NSString *)refreshingText
                  titleForNoMoreDataState:(NSString *)noMoreDataText;
- (void)hgc_addFooterWithRefreshingTarget:(id)target
                         refreshingAction:(SEL)action
                        titleForIdleState:(NSString *)idleText
                  titleForRefreshingState:(NSString *)refreshingText
                  titleForNoMoreDataState:(NSString *)noMoreDataText
                                textColor:(UIColor *)textColor
                                 fontSize:(CGFloat)fontSize;

@end

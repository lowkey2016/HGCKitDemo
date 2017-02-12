//
//  HGCRingLoadingView.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/11/27.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HGCRingLoadingView : UIView

- (void)showWithoutLoading;
- (void)hideAndStopLoading;

// progress: [0.0, 1.0]
- (void)updateProgress:(CGFloat)progress;
- (void)startLoading;

@end

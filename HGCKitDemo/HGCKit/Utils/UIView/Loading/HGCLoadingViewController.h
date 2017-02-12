//
//  HGCLoadingViewController.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/9/8.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HGCLoadingFinishBlock)();

@interface HGCLoadingViewController : UIViewController

- (void)willStartLoading;
- (void)startLoading;
- (void)startLoadingLater;

@property (nonatomic, copy) HGCLoadingFinishBlock loadingFinishBlock;

@end

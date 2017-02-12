//
//  UIView+HGCFrameSugar.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/10/19.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HGCFrameSugar)

@property (nonatomic, assign) CGFloat frame_x;
@property (nonatomic, assign) CGFloat frame_y;
@property (nonatomic, assign) CGPoint frame_origin;
@property (nonatomic, assign) CGFloat frame_centerX;
@property (nonatomic, assign) CGFloat frame_centerY;
@property (nonatomic, assign) CGFloat frame_width;
@property (nonatomic, assign) CGFloat frame_height;
@property (nonatomic, assign) CGSize frame_size;

@property (nonatomic, assign) CGFloat frame_top;
@property (nonatomic, assign) CGFloat frame_bottom;
@property (nonatomic, assign) CGFloat frame_left;
@property (nonatomic, assign) CGFloat frame_right;

@end


@interface UIView (HGCUtils)

- (UIViewController *)hgc_viewController;
- (void)hgc_removeAllSubviews;
- (void)hgc_addTapAction:(SEL)tapAction target:(id)target;

@end

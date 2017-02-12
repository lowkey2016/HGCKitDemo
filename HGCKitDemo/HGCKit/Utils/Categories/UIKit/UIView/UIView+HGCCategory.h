//
//  UIView+HGCCategory.h
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/3/21.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HGCCategory)

#pragma mark - View with color

+ (instancetype)hgc_whiteView;
+ (instancetype)hgc_clearView;
+ (instancetype)hgc_blackView;
+ (instancetype)hgc_blackViewWithAlpha:(CGFloat)alpha;
+ (instancetype)hgc_purpleView;
+ (instancetype)hgc_redView;
+ (instancetype)hgc_blueView;
+ (instancetype)hgc_greenView;
+ (instancetype)hgc_viewWithColor:(UIColor *)color;

- (void)hgc_setBackgroundColor:(UIColor *)bgColor alpha:(CGFloat)alpha;

- (void)hgc_addBorderWithRadius:(CGFloat)radius
                          color:(UIColor *)color
                          width:(CGFloat)width;
- (void)hgc_addBorderWithRadius:(CGFloat)radius
                          color:(UIColor *)color
                          width:(CGFloat)width
                shouldRasterize:(BOOL)shouldRasterize;

- (void)hgc_addShadowWithColor:(UIColor *)color
                       opacity:(CGFloat)opacity
                        offset:(CGSize)offset
                        radius:(CGFloat)radius;
- (void)hgc_removeShadow;

#pragma mark - Gestures

- (void)hgc_addTapGestureWithAction:(void (^)())block;
- (void)hgc_addLongPressGestureWithDuration:(CGFloat)duration action:(void (^)())block;

#pragma mark - Add Top Line

- (UIView *)hgc_topLine;

- (void)hgc_addTopLineWithColor:(UIColor *)color;
- (void)hgc_addTopLineWithColor:(UIColor *)color height:(CGFloat)height;

- (void)hgc_addTopLineWithColor:(UIColor *)color
               horizontalMargin:(CGFloat)horMargin;
- (void)hgc_addTopLineWithColor:(UIColor *)color
               horizontalMargin:(CGFloat)horMargin
                         height:(CGFloat)height;

- (void)hgc_addTopLineWithColor:(UIColor *)color
                        leading:(CGFloat)leading
                       trailing:(CGFloat)trailing;
- (void)hgc_addTopLineWithColor:(UIColor *)color
                        leading:(CGFloat)leading
                       trailing:(CGFloat)trailing
                         height:(CGFloat)height;

#pragma mark - Add Bottom Line

- (UIView *)hgc_bottomLine;

- (void)hgc_addBottomLineWithColor:(UIColor *)color;
- (void)hgc_addBottomLineWithColor:(UIColor *)color height:(CGFloat)height;

- (void)hgc_addBottomLineWithColor:(UIColor *)color
                  horizontalMargin:(CGFloat)horMargin;
- (void)hgc_addBottomLineWithColor:(UIColor *)color
                  horizontalMargin:(CGFloat)horMargin
                            height:(CGFloat)height;

- (void)hgc_addBottomLineWithColor:(UIColor *)color
                           leading:(CGFloat)leading
                          trailing:(CGFloat)trailing;
- (void)hgc_addBottomLineWithColor:(UIColor *)color
                           leading:(CGFloat)leading
                          trailing:(CGFloat)trailing
                            height:(CGFloat)height;

@end

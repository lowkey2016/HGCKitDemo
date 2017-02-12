//
//  UIView-HGCMasonryWrapper.h
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/8/26.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HGCLayoutLinker.h"

// L(left), R(right), T(top), B(bottom)
// X(centerX), Y(centerY)
// W(width), H(height)

// E(=), GE(>=), LE(<=)

@interface UIView (HGCMasonryWrapper)

#pragma mark - Linker

- (HGCLayoutLinker *)hgc_make;
- (HGCLayoutLinker *)hgc_update;
- (HGCLayoutLinker *)hgc_remake;

//#pragma mark - Base
//
///** Left */
//
//- (void)hgc_LtoSuperView;
//- (void)hgc_LtoSuperView:(CGFloat)margin;
//- (void)hgc_Lto:(UIView *)view;
//- (void)hgc_L:(CGFloat)margin to:(UIView *)view;
//
///** Right */
//
//- (void)hgc_RtoSuperView;
//- (void)hgc_RtoSuperView:(CGFloat)margin;
//- (void)hgc_Rto:(UIView *)view;
//- (void)hgc_R:(CGFloat)margin to:(UIView *)view;
//
///** Top */
//
//- (void)hgc_TtoSuperView;
//- (void)hgc_TtoSuperView:(CGFloat)margin;
//- (void)hgc_Tto:(UIView *)view;
//- (void)hgc_T:(CGFloat)margin to:(UIView *)view;
//
///** Bottom */
//
//- (void)hgc_BtoSuperView;
//- (void)hgc_BtoSuperView:(CGFloat)margin;
//- (void)hgc_Bto:(UIView *)view;
//- (void)hgc_B:(CGFloat)margin to:(UIView *)view;
//
///** Left and Right */
//
//- (void)hgc_LRtoSuperView;
//- (void)hgc_LRto:(UIView *)view;
//- (void)hgc_L:(CGFloat)lmargin R:(CGFloat)rmargin to:(UIView *)view;
//
///** Top and Bottom */
//
//- (void)hgc_TBtoSuperView;
//- (void)hgc_T:(CGFloat)tmargin B:(CGFloat)bmargin toSuperView:(id)_;
//- (void)hgc_TBto:(UIView *)view;
//- (void)hgc_T:(CGFloat)tmargin B:(CGFloat)bmargin to:(UIView *)view;
//
///** Left, Right and Top */
//
//- (void)hgc_LRTtoSuperView;
//- (void)hgc_L:(CGFloat)lmargin R:(CGFloat)rmargin T:(CGFloat)tmargin toSuperView:(id)_;
//- (void)hgc_LRTto:(UIView *)view;
//- (void)hgc_L:(CGFloat)lmargin R:(CGFloat)rmargin T:(CGFloat)tmargin to:(UIView *)view;
//
///** Left, Right and Bottom */
//
//- (void)hgc_LRBtoSuperView;
//- (void)hgc_L:(CGFloat)lmargin R:(CGFloat)rmargin B:(CGFloat)bmargin toSuperView:(id)_;
//- (void)hgc_LRBto:(UIView *)view;
//- (void)hgc_L:(CGFloat)lmargin R:(CGFloat)rmargin B:(CGFloat)bmargin to:(UIView *)view;
//
///** Top, Bottom and Left */
//
//- (void)hgc_TBLtoSuperView;
//- (void)hgc_T:(CGFloat)tmargin B:(CGFloat)bmargin L:(CGFloat)lmargin toSuperView:(id)_;
//- (void)hgc_TBLto:(UIView *)view;
//- (void)hgc_T:(CGFloat)tmargin B:(CGFloat)bmargin L:(CGFloat)lmargin to:(UIView *)view;
//
///** Top, Bottom and Right */
//
//- (void)hgc_TBRtoSuperView;
//- (void)hgc_T:(CGFloat)tmargin B:(CGFloat)bmargin R:(CGFloat)rmargin toSuperView:(id)_;
//- (void)hgc_TBRto:(UIView *)view;
//- (void)hgc_T:(CGFloat)tmargin B:(CGFloat)bmargin R:(CGFloat)rmargin to:(UIView *)view;
//
///** Left, Right, Top and Bottom */
//
//- (void)hgc_LRTBtoSuperView;
//- (void)hgc_L:(CGFloat)lmargin R:(CGFloat)rmargin T:(CGFloat)tmargin B:(CGFloat)bmargin toSuperView:(id)_;
//- (void)hgc_LRTBto:(UIView *)view;
//- (void)hgc_L:(CGFloat)lmargin R:(CGFloat)rmargin T:(CGFloat)tmargin B:(CGFloat)bmargin to:(UIView *)view;
//
///** Center */
//
//- (void)hgc_XtoSuperView;
//- (void)hgc_Xto:(UIView *)view;
//- (void)hgc_YtoSuperView;
//- (void)hgc_Yto:(UIView *)view;
//- (void)hgc_XYtoSuperView;
//- (void)hgc_XYto:(UIView *)view;
//
///** Width */
//
//- (void)hgc_WE:(CGFloat)width;
//- (void)hgc_WGE:(CGFloat)width;
//- (void)hgc_WLE:(CGFloat)width;
//
//- (void)hgc_WESize:(CGSize)size;
//
//- (void)hgc_WEtoSuperView;
//- (void)hgc_WEtoSuperViewAdd:(CGFloat)offset;
//- (void)hgc_WEtoSuperViewScale:(CGFloat)scale;
//
//- (void)hgc_WEto:(UIView *)view;
//- (void)hgc_WEto:(UIView *)view add:(CGFloat)offset;
//- (void)hgc_WEto:(UIView *)view scale:(CGFloat)scale;
//
///** Height */
//
//- (void)hgc_HE:(CGFloat)height;
//- (void)hgc_HGE:(CGFloat)height;
//- (void)hgc_HLE:(CGFloat)height;
//
//- (void)hgc_HESize:(CGSize)size;
//
//- (void)hgc_HEtoSuperView;
//- (void)hgc_HEtoSuperViewAdd:(CGFloat)offset;
//- (void)hgc_HEtoSuperViewScale:(CGFloat)scale;
//
//- (void)hgc_HEto:(UIView *)view;
//- (void)hgc_HEto:(UIView *)view add:(CGFloat)offset;
//- (void)hgc_HEto:(UIView *)view scale:(CGFloat)scale;
//
///** Width and Height */
//
//- (void)hgc_WE:(CGFloat)width HE:(CGFloat)height;
//- (void)hgc_WHEtoSize:(CGSize)size;
//- (void)hgc_WHEtoSuperView;
//- (void)hgc_WHEto:(UIView *)view;
//
///** Leading */
//
//- (void)hgc_LtoRof:(UIView *)view;
//- (void)hgc_L:(CGFloat)leading toRof:(UIView *)view;
//
///** Trailing */
//
//- (void)hgc_RtoLof:(UIView *)view;
//- (void)hgc_R:(CGFloat)trailing toLof:(UIView *)view;
//
///** Top Spacing to Bottom */
//
//- (void)hgc_TtoBof:(UIView *)view;
//- (void)hgc_T:(CGFloat)spacing toBof:(UIView *)view;
//
///** Bottom Spacing to Top */
//
//- (void)hgc_BtoTof:(UIView *)view;
//- (void)hgc_B:(CGFloat)spacing toTof:(UIView *)view;

@end

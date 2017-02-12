//
//  UIView+HGCMasonryWrapper.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/8/26.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "UIView+HGCMasonryWrapper.h"
#import "HGCMasonryWrapper.h"
#import "HGCMakeLayoutLinker.h"
#import "HGCUpdateLayoutLinker.h"
#import "HGCRemakeLayoutLinker.h"

@implementation UIView (HGCMasonryWrapper)


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Layout Linker

- (HGCLayoutLinker *)hgc_make {
    return [HGCMakeLayoutLinker linkerWithView:self];
}

- (HGCLayoutLinker *)hgc_update {
    return [HGCUpdateLayoutLinker linkerWithView:self];
}

- (HGCLayoutLinker *)hgc_remake {
    return [HGCRemakeLayoutLinker linkerWithView:self];
}


///////////////////////////////////////////////////////////////////////////////////////////


//#pragma mark - Left
//
//- (void)hgc_LtoSuperView {
//    [self hgc_L:0 to:self.superview];
//}
//
//- (void)hgc_LtoSuperView:(CGFloat)margin {
//    [self hgc_L:margin to:self.superview];
//}
//
//- (void)hgc_Lto:(UIView *)view {
//    [self hgc_L:0 to:view];
//}
//
//- (void)hgc_L:(CGFloat)margin to:(UIView *)view {
//    [HGCMas view:self leftMargin:margin to:view];
//}
//
//#pragma mark - Right
//
//- (void)hgc_RtoSuperView {
//    [self hgc_R:0 to:self.superview];
//}
//
//- (void)hgc_RtoSuperView:(CGFloat)margin {
//    [self hgc_R:margin to:self.superview];
//}
//
//- (void)hgc_Rto:(UIView *)view {
//    [self hgc_R:0 to:view];
//}
//
//- (void)hgc_R:(CGFloat)margin to:(UIView *)view {
//    [HGCMas view:self rightMargin:margin to:view];
//}
//
//#pragma mark - Top
//
//- (void)hgc_TtoSuperView {
//    [self hgc_T:0 to:self.superview];
//}
//
//- (void)hgc_TtoSuperView:(CGFloat)margin {
//    [self hgc_T:margin to:self.superview];
//}
//
//- (void)hgc_Tto:(UIView *)view {
//    [self hgc_T:0 to:view];
//}
//
//- (void)hgc_T:(CGFloat)margin to:(UIView *)view {
//    [HGCMas view:self topMargin:margin to:view];
//}
//
//#pragma mark - Bottom
//
//- (void)hgc_BtoSuperView {
//    [self hgc_B:0 to:self.superview];
//}
//
//- (void)hgc_BtoSuperView:(CGFloat)margin {
//    [self hgc_B:margin to:self.superview];
//}
//
//- (void)hgc_Bto:(UIView *)view {
//    [self hgc_B:0 to:view];
//}
//
//- (void)hgc_B:(CGFloat)margin to:(UIView *)view {
//    [HGCMas view:self bottomMargin:margin to:view];
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////
//
//
//#pragma mark - Left and Right
//
//- (void)hgc_LRtoSuperView {
//    [self hgc_L:0 R:0 to:self.superview];
//}
//
//- (void)hgc_LRto:(UIView *)view {
//    [self hgc_L:0 R:0 to:view];
//}
//
//- (void)hgc_L:(CGFloat)lmargin R:(CGFloat)rmargin to:(UIView *)view {
//    [HGCMas view:self leftMargin:lmargin rightMargin:rmargin to:view];
//}
//
//#pragma mark - Top and Bottom
//
//- (void)hgc_TBtoSuperView {
//    [self hgc_T:0 B:0 to:self.superview];
//}
//
//- (void)hgc_T:(CGFloat)tmargin B:(CGFloat)bmargin toSuperView:(id)_ {
//    [self hgc_T:tmargin B:bmargin to:self.superview];
//}
//
//- (void)hgc_TBto:(UIView *)view {
//    [self hgc_T:0 B:0 to:view];
//}
//
//- (void)hgc_T:(CGFloat)tmargin B:(CGFloat)bmargin to:(UIView *)view {
//    [HGCMas view:self topMargin:tmargin bottomMargin:bmargin to:view];
//}
//
//#pragma mark - Left, Right and Top
//
//- (void)hgc_LRTtoSuperView {
//    [self hgc_L:0 R:0 T:0 to:self.superview];
//}
//
//- (void)hgc_L:(CGFloat)lmargin R:(CGFloat)rmargin T:(CGFloat)tmargin toSuperView:(id)_ {
//    [self hgc_L:lmargin R:rmargin T:tmargin to:self.superview];
//}
//
//- (void)hgc_LRTto:(UIView *)view {
//    [self hgc_L:0 R:0 T:0 to:view];
//}
//
//- (void)hgc_L:(CGFloat)lmargin R:(CGFloat)rmargin T:(CGFloat)tmargin to:(UIView *)view {
//    [HGCMas view:self leftMargin:lmargin rightMargin:rmargin topMargin:tmargin bottomMargin:0 to:view];
//}
//
//#pragma mark - Left, Right and Bottom
//
//- (void)hgc_LRBtoSuperView {
//    [self hgc_L:0 R:0 B:0 to:self.superview];
//}
//
//- (void)hgc_L:(CGFloat)lmargin R:(CGFloat)rmargin B:(CGFloat)bmargin toSuperView:(id)_ {
//    [self hgc_L:lmargin R:rmargin B:bmargin to:self.superview];
//}
//
//- (void)hgc_LRBto:(UIView *)view {
//    [self hgc_L:0 R:0 B:0 to:view];
//}
//
//- (void)hgc_L:(CGFloat)lmargin R:(CGFloat)rmargin B:(CGFloat)bmargin to:(UIView *)view {
//    [HGCMas view:self leftMargin:lmargin rightMargin:rmargin topMargin:0 bottomMargin:bmargin to:view];
//}
//
//#pragma mark - Top, Bottom and Left
//
//- (void)hgc_TBLtoSuperView {
//    [self hgc_T:0 B:0 L:0 to:self.superview];
//}
//
//- (void)hgc_T:(CGFloat)tmargin B:(CGFloat)bmargin L:(CGFloat)lmargin toSuperView:(id)_ {
//    [self hgc_T:tmargin B:bmargin L:lmargin to:self.superview];
//}
//
//- (void)hgc_TBLto:(UIView *)view {
//    [self hgc_T:0 B:0 L:0 to:view];
//}
//
//- (void)hgc_T:(CGFloat)tmargin B:(CGFloat)bmargin L:(CGFloat)lmargin to:(UIView *)view {
//    [HGCMas view:self topMargin:tmargin bottomMargin:bmargin to:view];
//    [HGCMas view:self leftMargin:lmargin to:view];
//}
//
//#pragma mark - Top, Bottom and Right
//
//- (void)hgc_TBRtoSuperView {
//    [self hgc_T:0 B:0 R:0 to:self.superview];
//}
//
//- (void)hgc_T:(CGFloat)tmargin B:(CGFloat)bmargin R:(CGFloat)rmargin toSuperView:(id)_ {
//    [self hgc_T:tmargin B:bmargin R:rmargin to:self.superview];
//}
//
//- (void)hgc_TBRto:(UIView *)view {
//    [self hgc_T:0 B:0 R:0 to:view];
//}
//
//- (void)hgc_T:(CGFloat)tmargin B:(CGFloat)bmargin R:(CGFloat)rmargin to:(UIView *)view {
//    [HGCMas view:self topMargin:tmargin bottomMargin:bmargin to:view];
//    [HGCMas view:self rightMargin:rmargin to:view];
//}
//
//#pragma mark - Left, Right, Top and Bottom
//
//- (void)hgc_LRTBtoSuperView {
//    [self hgc_L:0 R:0 T:0 B:0 to:self.superview];
//}
//
//- (void)hgc_L:(CGFloat)lmargin R:(CGFloat)rmargin T:(CGFloat)tmargin B:(CGFloat)bmargin toSuperView:(id)_
//{
//    [self hgc_L:lmargin R:rmargin T:tmargin B:rmargin to:self.superview];
//}
//
//- (void)hgc_LRTBto:(UIView *)view {
//    [self hgc_L:0 R:0 T:0 B:0 to:view];
//}
//
//- (void)hgc_L:(CGFloat)lmargin R:(CGFloat)rmargin T:(CGFloat)tmargin B:(CGFloat)bmargin to:(UIView *)view
//{
//    [HGCMas view:self leftMargin:lmargin rightMargin:rmargin topMargin:tmargin bottomMargin:bmargin to:view];
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////
//
//
//#pragma mark - Center
//
//- (void)hgc_XtoSuperView {
//    [self hgc_Xto:self.superview];
//}
//
//- (void)hgc_Xto:(UIView *)view {
//    [HGCMas view:self centerXAlignTo:view];
//}
//
//- (void)hgc_YtoSuperView {
//    [self hgc_Yto:self.superview];
//}
//
//- (void)hgc_Yto:(UIView *)view {
//    [HGCMas view:self centerYAlignTo:view];
//}
//
//- (void)hgc_XYtoSuperView {
//    [self hgc_XYto:self.superview];
//}
//
//- (void)hgc_XYto:(UIView *)view {
//    [HGCMas view:self centerAlignTo:view];
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////
//
//
//#pragma mark - Width
//
//- (void)hgc_WE:(CGFloat)width {
//    [HGCMas view:self width:width];
//}
//
//- (void)hgc_WGE:(CGFloat)width {
//    [HGCMas view:self widthGreaterThanOrEqualTo:width];
//}
//
//- (void)hgc_WLE:(CGFloat)width {
//    [HGCMas view:self widthLessThanOrEqualTo:width];
//}
//
//- (void)hgc_WESize:(CGSize)size {
//    [HGCMas view:self widthEqualToSize:size];
//}
//
//- (void)hgc_WEtoSuperView {
//    [self hgc_WEto:self.superview];
//}
//
//- (void)hgc_WEtoSuperViewAdd:(CGFloat)offset {
//    [self hgc_WEto:self.superview add:offset];
//}
//
//- (void)hgc_WEtoSuperViewScale:(CGFloat)scale {
//    [self hgc_WEto:self.superview scale:scale];
//}
//
//- (void)hgc_WEto:(UIView *)view {
//    [HGCMas view:self widthEqualTo:view];
//}
//
//- (void)hgc_WEto:(UIView *)view add:(CGFloat)offset {
//    [HGCMas view:self widthOffset:offset compareTo:view];
//}
//
//- (void)hgc_WEto:(UIView *)view scale:(CGFloat)scale {
//    [HGCMas view:self widthScaleBy:scale compareTo:view];
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////
//
//
//#pragma mark - Height
//
//- (void)hgc_HE:(CGFloat)height {
//    [HGCMas view:self height:height];
//}
//
//- (void)hgc_HGE:(CGFloat)height {
//    [HGCMas view:self heightGreaterThanOrEqualTo:height];
//}
//
//- (void)hgc_HLE:(CGFloat)height {
//    [HGCMas view:self heightLessThanOrEqualTo:height];
//}
//
//- (void)hgc_HESize:(CGSize)size {
//    [HGCMas view:self heightEqualToSize:size];
//}
//
//- (void)hgc_HEtoSuperView {
//    [self hgc_HEto:self.superview];
//}
//
//- (void)hgc_HEtoSuperViewAdd:(CGFloat)offset {
//    [self hgc_HEto:self.superview add:offset];
//}
//
//- (void)hgc_HEtoSuperViewScale:(CGFloat)scale {
//    [self hgc_HEto:self.superview scale:scale];
//}
//
//- (void)hgc_HEto:(UIView *)view {
//    [HGCMas view:self heightEqualTo:view];
//}
//
//- (void)hgc_HEto:(UIView *)view add:(CGFloat)offset {
//    [HGCMas view:self heightOffset:offset compareTo:view];
//}
//
//- (void)hgc_HEto:(UIView *)view scale:(CGFloat)scale {
//    [HGCMas view:self heightScaleBy:scale compareTo:view];
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////
//
//
//#pragma mark - Width and Height
//
//- (void)hgc_WE:(CGFloat)width HE:(CGFloat)height {
//    [HGCMas view:self width:width height:height];
//}
//
//- (void)hgc_WHEtoSize:(CGSize)size {
//    [HGCMas view:self size:size];
//}
//
//- (void)hgc_WHEtoSuperView {
//    [self hgc_WHEto:self.superview];
//}
//
//- (void)hgc_WHEto:(UIView *)view {
//    [HGCMas view:self sizeEqualTo:view];
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////
//
//
//#pragma mark - Leading
//
//- (void)hgc_LtoRof:(UIView *)view {
//    [self hgc_L:0 toRof:view];
//}
//
//- (void)hgc_L:(CGFloat)leading toRof:(UIView *)view {
//    [HGCMas view:self leading:leading toRightOf:view];
//}
//
//#pragma mark - Trailing
//
//- (void)hgc_RtoLof:(UIView *)view {
//    [self hgc_R:0 toLof:view];
//}
//
//- (void)hgc_R:(CGFloat)trailing toLof:(UIView *)view {
//    [HGCMas view:self trailing:trailing toLeftOf:view];
//}
//
//#pragma mark - Top Spacing to Bottom
//
//- (void)hgc_TtoBof:(UIView *)view {
//    [self hgc_T:0 toBof:view];
//}
//
//- (void)hgc_T:(CGFloat)spacing toBof:(UIView *)view {
//    [HGCMas view:self topSpacing:spacing toBottomOf:view];
//}
//
//#pragma mark - Bottom Spacing to Top
//
//- (void)hgc_BtoTof:(UIView *)view {
//    [self hgc_B:0 toTof:view];
//}
//
//- (void)hgc_B:(CGFloat)spacing toTof:(UIView *)view {
//    [HGCMas view:self bottomSpacing:spacing toTopOf:view];
//}

@end

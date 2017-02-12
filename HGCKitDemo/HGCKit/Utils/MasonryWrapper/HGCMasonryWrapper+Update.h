//
//  HGCMasonryWrapper+Update.h
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/8/27.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "HGCMasonryWrapper.h"

@interface HGCMasonryWrapper (Update)

/** Edges Align */
+ (void)updateView:(UIView *)srcView leftAligntTo:(UIView *)desView;
+ (void)updateView:(UIView *)srcView rightAligntTo:(UIView *)desView;
+ (void)updateView:(UIView *)srcView topAligntTo:(UIView *)desView;
+ (void)updateView:(UIView *)srcView bottomAligntTo:(UIView *)desView;
+ (void)updateView:(UIView *)srcView leftAndRightAlignTo:(UIView *)desView;
+ (void)updateView:(UIView *)srcView leftRightAndTopAlignTo:(UIView *)desView;
+ (void)updateView:(UIView *)srcView leftRightAndBottomAlignTo:(UIView *)desView;
+ (void)updateView:(UIView *)srcView topAndBottomAlignTo:(UIView *)desView;
+ (void)updateView:(UIView *)srcView edgesAlignTo:(UIView *)desView;

/** Center Align */
+ (void)updateView:(UIView *)srcView centerXAlignTo:(UIView *)desView;
+ (void)updateView:(UIView *)srcView centerYAlignTo:(UIView *)desView;
+ (void)updateView:(UIView *)srcView centerAlignTo:(UIView *)desView;

/** Center Offset */
+ (void)updateView:(UIView *)srcView centerXOffset:(CGFloat)offset to:(UIView *)desView;
+ (void)updateView:(UIView *)srcView centerYOffset:(CGFloat)offset to:(UIView *)desView;
+ (void)updateView:(UIView *)srcView centerXOffset:(CGFloat)xOffset centerYOffset:(CGFloat)yOffset to:(UIView *)desView;

/** Edges Margin */
+ (void)updateView:(UIView *)srcView leftMargin:(CGFloat)margin to:(UIView *)desView;
+ (void)updateView:(UIView *)srcView rightMargin:(CGFloat)margin to:(UIView *)desView;
+ (void)updateView:(UIView *)srcView leftMargin:(CGFloat)lMargin rightMargin:(CGFloat)rMargin to:(UIView *)desView;
+ (void)updateView:(UIView *)srcView topMargin:(CGFloat)margin to:(UIView *)desView;
+ (void)updateView:(UIView *)srcView bottomMargin:(CGFloat)margin to:(UIView *)desView;
+ (void)updateView:(UIView *)srcView topMargin:(CGFloat)tMargin bottomMargin:(CGFloat)bMargin to:(UIView *)desView;
+ (void)updateView:(UIView *)srcView edgeInsets:(UIEdgeInsets)insets to:(UIView *)desView;
+ (void)updateView:(UIView *)srcView leftMargin:(CGFloat)lMargin rightMargin:(CGFloat)rMargin topMargin:(CGFloat)tMargin bottomMargin:(CGFloat)bMargin to:(UIView *)desView;

/** Width */
+ (void)updateView:(UIView *)srcView width:(CGFloat)width;
+ (void)updateView:(UIView *)srcView widthGreaterThanOrEqualTo:(CGFloat)width;
+ (void)updateView:(UIView *)srcView widthLessThanOrEqualTo:(CGFloat)width;
+ (void)updateView:(UIView *)srcView widthOffset:(CGFloat)offset compareTo:(UIView *)desView;
+ (void)updateView:(UIView *)srcView widthScaleBy:(CGFloat)scale compareTo:(UIView *)desView;
+ (void)updateView:(UIView *)srcView widthEqualToSize:(CGSize)size;
+ (void)updateView:(UIView *)srcView widthEqualToView:(UIView *)desView;
+ (void)updateView:(UIView *)srcView widthGreaterThanOrEqualToView:(UIView *)desView;
+ (void)updateView:(UIView *)srcView widthLessThanOrEqualToView:(UIView *)desView;

/** Height */
+ (void)updateView:(UIView *)srcView height:(CGFloat)height;
+ (void)updateView:(UIView *)srcView heightGreaterThanOrEqualTo:(CGFloat)height;
+ (void)updateView:(UIView *)srcView heightLessThanOrEqualTo:(CGFloat)height;
+ (void)updateView:(UIView *)srcView heightOffset:(CGFloat)offset compareTo:(UIView *)desView;
+ (void)updateView:(UIView *)srcView heightScaleBy:(CGFloat)scale compareTo:(UIView *)desView;
+ (void)updateView:(UIView *)srcView heightEqualToSize:(CGSize)size;
+ (void)updateView:(UIView *)srcView heightEqualToView:(UIView *)desView;
+ (void)updateView:(UIView *)srcView heightGreaterThanOrEqualToView:(UIView *)desView;
+ (void)updateView:(UIView *)srcView heightLessThanOrEqualToView:(UIView *)desView;

/** Size */
+ (void)updateView:(UIView *)srcView width:(CGFloat)width height:(CGFloat)height;
+ (void)updateView:(UIView *)srcView sizeEqualTo:(UIView *)desView;
+ (void)updateView:(UIView *)srcView size:(CGSize)size;

/** Neighbour Align */
+ (void)updateView:(UIView *)srcView leadingToRightOf:(UIView *)desView;
+ (void)updateView:(UIView *)srcView trailingToLeftOf:(UIView *)desView;
+ (void)updateView:(UIView *)srcView topSpacingToBottomOf:(UIView *)desView;
+ (void)updateView:(UIView *)srcView bottomSpacingToTopOf:(UIView *)desView;

/** Neighbour Spacing */
+ (void)updateView:(UIView *)srcView leading:(CGFloat)leading toRightOf:(UIView *)desView;
+ (void)updateView:(UIView *)srcView trailing:(CGFloat)trailing toLeftOf:(UIView *)desView;
+ (void)updateView:(UIView *)srcView topSpacing:(CGFloat)topSpacing toBottomOf:(UIView *)desView;
+ (void)updateView:(UIView *)srcView bottomSpacing:(CGFloat)bottomSpacing toTopOf:(UIView *)desView;

@end

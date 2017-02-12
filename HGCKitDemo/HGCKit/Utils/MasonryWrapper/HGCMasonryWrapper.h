//
//  HGCMasonryWrapper.h
//  PetAirBnb
//
//  Created by Jymn_Chen on 15/12/14.
//  Copyright © 2015年 com.luedong. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef HGCMas
#undef HGCMas
#endif
#define HGCMas  HGCMasonryWrapper

#ifdef HGCMW_singleCheck
#undef HGCMW_singleCheck
#endif
#define HGCMW_singleCheck   \
    if (srcView == nil) {   \
        return;             \
    }

#ifdef HGCMW_doubleCheck
#undef HGCMW_doubleCheck
#endif
#define HGCMW_doubleCheck                   \
    if (srcView == nil || desView == nil) { \
        return;                             \
    }

@interface HGCMasonryWrapper : NSObject

/** Edges Align */
+ (void)view:(UIView *)srcView leftAligntTo:(UIView *)desView;
+ (void)view:(UIView *)srcView rightAligntTo:(UIView *)desView;
+ (void)view:(UIView *)srcView topAligntTo:(UIView *)desView;
+ (void)view:(UIView *)srcView bottomAligntTo:(UIView *)desView;
+ (void)view:(UIView *)srcView leftAndRightAlignTo:(UIView *)desView;
+ (void)view:(UIView *)srcView leftRightAndTopAlignTo:(UIView *)desView;
+ (void)view:(UIView *)srcView leftRightAndBottomAlignTo:(UIView *)desView;
+ (void)view:(UIView *)srcView topAndBottomAlignTo:(UIView *)desView;
+ (void)view:(UIView *)srcView edgesAlignTo:(UIView *)desView;

/** Center Align */
+ (void)view:(UIView *)srcView centerXAlignTo:(UIView *)desView;
+ (void)view:(UIView *)srcView centerYAlignTo:(UIView *)desView;
+ (void)view:(UIView *)srcView centerAlignTo:(UIView *)desView;

/** Center Offset */
+ (void)view:(UIView *)srcView centerXOffset:(CGFloat)offset to:(UIView *)desView;
+ (void)view:(UIView *)srcView centerYOffset:(CGFloat)offset to:(UIView *)desView;
+ (void)view:(UIView *)srcView centerXOffset:(CGFloat)xOffset centerYOffset:(CGFloat)yOffset to:(UIView *)desView;

/** Edges Margin */
+ (void)view:(UIView *)srcView leftMargin:(CGFloat)margin to:(UIView *)desView;
+ (void)view:(UIView *)srcView rightMargin:(CGFloat)margin to:(UIView *)desView;
+ (void)view:(UIView *)srcView leftMargin:(CGFloat)lMargin rightMargin:(CGFloat)rMargin to:(UIView *)desView;
+ (void)view:(UIView *)srcView topMargin:(CGFloat)margin to:(UIView *)desView;
+ (void)view:(UIView *)srcView bottomMargin:(CGFloat)margin to:(UIView *)desView;
+ (void)view:(UIView *)srcView topMargin:(CGFloat)tMargin bottomMargin:(CGFloat)bMargin to:(UIView *)desView;
+ (void)view:(UIView *)srcView edgeInsets:(UIEdgeInsets)insets to:(UIView *)desView;
+ (void)view:(UIView *)srcView leftMargin:(CGFloat)lMargin rightMargin:(CGFloat)rMargin topMargin:(CGFloat)tMargin bottomMargin:(CGFloat)bMargin to:(UIView *)desView;

/** Width */
+ (void)view:(UIView *)srcView width:(CGFloat)width;
+ (void)view:(UIView *)srcView widthGreaterThanOrEqualTo:(CGFloat)width;
+ (void)view:(UIView *)srcView widthLessThanOrEqualTo:(CGFloat)width;
+ (void)view:(UIView *)srcView widthOffset:(CGFloat)offset compareTo:(UIView *)desView;
+ (void)view:(UIView *)srcView widthScaleBy:(CGFloat)scale compareTo:(UIView *)desView;
+ (void)view:(UIView *)srcView widthEqualToSize:(CGSize)size;
+ (void)view:(UIView *)srcView widthEqualToView:(UIView *)desView;
+ (void)view:(UIView *)srcView widthGreaterThanOrEqualToView:(UIView *)desView;
+ (void)view:(UIView *)srcView widthLessThanOrEqualToView:(UIView *)desView;

/** Height */
+ (void)view:(UIView *)srcView height:(CGFloat)height;
+ (void)view:(UIView *)srcView heightGreaterThanOrEqualTo:(CGFloat)height;
+ (void)view:(UIView *)srcView heightLessThanOrEqualTo:(CGFloat)height;
+ (void)view:(UIView *)srcView heightOffset:(CGFloat)offset compareTo:(UIView *)desView;
+ (void)view:(UIView *)srcView heightScaleBy:(CGFloat)scale compareTo:(UIView *)desView;
+ (void)view:(UIView *)srcView heightEqualToSize:(CGSize)size;
+ (void)view:(UIView *)srcView heightEqualToView:(UIView *)desView;
+ (void)view:(UIView *)srcView heightGreaterThanOrEqualToView:(UIView *)desView;
+ (void)view:(UIView *)srcView heightLessThanOrEqualToView:(UIView *)desView;

/** Size */
+ (void)view:(UIView *)srcView width:(CGFloat)width height:(CGFloat)height;
+ (void)view:(UIView *)srcView sizeEqualTo:(UIView *)desView;
+ (void)view:(UIView *)srcView size:(CGSize)size;

/** Neighbour Align */
+ (void)view:(UIView *)srcView leadingToRightOf:(UIView *)desView;
+ (void)view:(UIView *)srcView trailingToLeftOf:(UIView *)desView;
+ (void)view:(UIView *)srcView topSpacingToBottomOf:(UIView *)desView;
+ (void)view:(UIView *)srcView bottomSpacingToTopOf:(UIView *)desView;

/** Neighbour Spacing */
+ (void)view:(UIView *)srcView leading:(CGFloat)leading toRightOf:(UIView *)desView;
+ (void)view:(UIView *)srcView trailing:(CGFloat)trailing toLeftOf:(UIView *)desView;
+ (void)view:(UIView *)srcView topSpacing:(CGFloat)topSpacing toBottomOf:(UIView *)desView;
+ (void)view:(UIView *)srcView bottomSpacing:(CGFloat)bottomSpacing toTopOf:(UIView *)desView;

@end

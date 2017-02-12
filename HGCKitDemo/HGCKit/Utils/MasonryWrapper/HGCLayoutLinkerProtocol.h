//
//  HGCLayoutLinkerProtocol.h
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/8/27.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class HGCLayoutLinker;

@protocol HGCLayoutLinkerProtocol <NSObject>

@required

/** Left */

- (HGCLayoutLinker * (^)())leftAlignToSuperView;
- (HGCLayoutLinker * (^)(CGFloat margin))leftToSuperView;
- (HGCLayoutLinker * (^)(UIView *view))leftAlignTo;
- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))leftTo;

/** Right */

- (HGCLayoutLinker * (^)())rightAlignToSuperView;
- (HGCLayoutLinker * (^)(CGFloat margin))rightToSuperView;
- (HGCLayoutLinker * (^)(UIView *view))rightAlignTo;
- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))rightTo;

/** Top */

- (HGCLayoutLinker * (^)())topAlignToSuperView;
- (HGCLayoutLinker * (^)(CGFloat margin))topToSuperView;
- (HGCLayoutLinker * (^)(UIView *view))topAlignTo;
- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))topTo;

/** Bottom */

- (HGCLayoutLinker * (^)())bottomAlignToSuperView;
- (HGCLayoutLinker * (^)(CGFloat margin))bottomToSuperView;
- (HGCLayoutLinker * (^)(UIView *view))bottomAlignTo;
- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))bottomTo;

/** Edges */

- (HGCLayoutLinker * (^)())edgeAlignToSuperView;
- (HGCLayoutLinker * (^)(UIEdgeInsets insets))edgeToSuperView;
- (HGCLayoutLinker * (^)(UIView *view))edgeAlignTo;
- (HGCLayoutLinker * (^)(UIView *view, UIEdgeInsets insets))edgeTo;

/** Center */

- (HGCLayoutLinker * (^)())centerXAlignToSuperView;
- (HGCLayoutLinker * (^)(UIView *view))centerXAlignTo;
- (HGCLayoutLinker * (^)(CGFloat margin))centerXToSuperView;
- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))centerXTo;

- (HGCLayoutLinker * (^)())centerYAlignToSuperView;
- (HGCLayoutLinker * (^)(UIView *view))centerYAlignTo;
- (HGCLayoutLinker * (^)(CGFloat margin))centerYToSuperView;
- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))centerYTo;

- (HGCLayoutLinker * (^)())centerAlignToSuperView;
- (HGCLayoutLinker * (^)(UIView *view))centerAlignTo;
- (HGCLayoutLinker * (^)(CGFloat xMargin, CGFloat yMargin))centerToSuperView;
- (HGCLayoutLinker * (^)(UIView *view, CGFloat xMargin, CGFloat yMargin))centerTo;

/** Width */

- (HGCLayoutLinker * (^)(CGFloat value))widthIs;
- (HGCLayoutLinker * (^)(CGFloat value))widthGreaterThanOrIs;
- (HGCLayoutLinker * (^)(CGFloat value))widthLessThanOrIs;

- (HGCLayoutLinker * (^)(CGSize size))widthEqualToSize;
- (HGCLayoutLinker * (^)(CGSize size))widthGreaterThanOrEqualToSize;
- (HGCLayoutLinker * (^)(CGSize size))widthLessThanOrEqualToSize;

- (HGCLayoutLinker * (^)())widthEqualToSuperview;
- (HGCLayoutLinker * (^)())widthGreaterThanOrEqualToSuperview;
- (HGCLayoutLinker * (^)())widthLessThanOrEqualToSuperview;
- (HGCLayoutLinker * (^)(CGFloat value))widthEqualToSuperViewAdd;
- (HGCLayoutLinker * (^)(CGFloat value))widthEqualToSuperViewScale;

- (HGCLayoutLinker * (^)(UIView *view))widthEqualTo;
- (HGCLayoutLinker * (^)(UIView *view))widthGreaterThanOrEqualTo;
- (HGCLayoutLinker * (^)(UIView *view))widthLessThanOrEqualTo;
- (HGCLayoutLinker * (^)(UIView *view, CGFloat value))widthEqualToAdd;
- (HGCLayoutLinker * (^)(UIView *view, CGFloat value))widthEqualToScale;

/** Height */

- (HGCLayoutLinker * (^)(CGFloat value))heightIs;
- (HGCLayoutLinker * (^)(CGFloat value))heightGreaterThanOrIs;
- (HGCLayoutLinker * (^)(CGFloat value))heightLessThanOrIs;

- (HGCLayoutLinker * (^)(CGSize size))heightEqualToSize;
- (HGCLayoutLinker * (^)(CGSize size))heightGreaterThanOrEqualToSize;
- (HGCLayoutLinker * (^)(CGSize size))heightLessThanOrEqualToSize;

- (HGCLayoutLinker * (^)())heightEqualToSuperview;
- (HGCLayoutLinker * (^)())heightGreaterThanOrEqualToSuperview;
- (HGCLayoutLinker * (^)())heightLessThanOrEqualToSuperview;
- (HGCLayoutLinker * (^)(CGFloat value))heightEqualToSuperViewAdd;
- (HGCLayoutLinker * (^)(CGFloat value))heightEqualToSuperViewScale;

- (HGCLayoutLinker * (^)(UIView *view))heightEqualTo;
- (HGCLayoutLinker * (^)(UIView *view))heightGreaterThanOrEqualTo;
- (HGCLayoutLinker * (^)(UIView *view))heightLessThanOrEqualTo;
- (HGCLayoutLinker * (^)(UIView *view, CGFloat value))heightEqualToAdd;
- (HGCLayoutLinker * (^)(UIView *view, CGFloat value))heightEqualToScale;

/** Size */

- (HGCLayoutLinker * (^)(CGSize size))sizeIs;
- (HGCLayoutLinker * (^)(CGSize size))sizeGreaterThanOrIs;
- (HGCLayoutLinker * (^)(CGSize size))sizeLessThanOrIs;

- (HGCLayoutLinker * (^)())sizeEqualToSuperView;
- (HGCLayoutLinker * (^)(UIView *view))sizeEqualTo;

/** Leading */

- (HGCLayoutLinker * (^)(UIView *view))leftAlignToRightOf;
- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))leadingToRightOf;

/** Trailing */

- (HGCLayoutLinker * (^)(UIView *view))rightAlignToLeftOf;
- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))trailingToLeftOf;

/** Top Spacing to Bottom */

- (HGCLayoutLinker * (^)(UIView *view))topAlignToBottomOf;
- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))topSpacingToBottomOf;

/** Bottom Spacing to Top */

- (HGCLayoutLinker * (^)(UIView *view))bottomAlignToTopOf;
- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))bottomSpacingToTopOf;

@end

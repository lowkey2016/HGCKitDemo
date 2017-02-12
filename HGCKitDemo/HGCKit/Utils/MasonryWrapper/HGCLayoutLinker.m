//
//  HGCLayoutLinker.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/8/27.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "HGCLayoutLinker.h"


///////////////////////////////////////////////////////////////////////////////////////////


#define _HGC_return_nil { return nil; }

@interface HGCLayoutLinker ()

@property (nonatomic, readwrite, strong) UIView *srcView;

@end

@implementation HGCLayoutLinker


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Init

+ (instancetype)linkerWithView:(UIView *)view {
    if (view == nil) {
        return nil;
    }
    
    // 注意这里必须用 [[self class] alloc] 而不是 [HGCLayoutLinker alloc]
    // 否则 [HGCMakeLayoutLinker linkerWithView:view] 调用时，这里调用的 class 还是 HGCLayoutLinker
    // 从而最终初始化出来的 linker 还是一个 HGCLayoutLinker
    return [[[self class] alloc] initWithView:view];
}

- (instancetype)initWithView:(UIView *)view {
    self = [super init];
    if (self) {
        _srcView = view;
    }
    return self;
}

- (instancetype)init {
    return [self initWithView:nil];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - HGCLayoutLinkerProtocol

/** Left */

- (HGCLayoutLinker * (^)())leftAlignToSuperView _HGC_return_nil
- (HGCLayoutLinker * (^)(CGFloat margin))leftToSuperView _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view))leftAlignTo _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))leftTo _HGC_return_nil

/** Right */

- (HGCLayoutLinker * (^)())rightAlignToSuperView _HGC_return_nil
- (HGCLayoutLinker * (^)(CGFloat margin))rightToSuperView _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view))rightAlignTo _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))rightTo _HGC_return_nil

/** Top */

- (HGCLayoutLinker * (^)())topAlignToSuperView _HGC_return_nil
- (HGCLayoutLinker * (^)(CGFloat margin))topToSuperView _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view))topAlignTo _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))topTo _HGC_return_nil

/** Bottom */

- (HGCLayoutLinker * (^)())bottomAlignToSuperView _HGC_return_nil
- (HGCLayoutLinker * (^)(CGFloat margin))bottomToSuperView _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view))bottomAlignTo _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))bottomTo _HGC_return_nil

/** Edges */

- (HGCLayoutLinker * (^)())edgeAlignToSuperView _HGC_return_nil
- (HGCLayoutLinker * (^)(UIEdgeInsets insets))edgeToSuperView _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view))edgeAlignTo _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view, UIEdgeInsets insets))edgeTo _HGC_return_nil

/** Center */

- (HGCLayoutLinker * (^)())centerXAlignToSuperView _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view))centerXAlignTo _HGC_return_nil
- (HGCLayoutLinker * (^)(CGFloat margin))centerXToSuperView _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))centerXTo _HGC_return_nil

- (HGCLayoutLinker * (^)())centerYAlignToSuperView _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view))centerYAlignTo _HGC_return_nil
- (HGCLayoutLinker * (^)(CGFloat margin))centerYToSuperView _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))centerYTo _HGC_return_nil

- (HGCLayoutLinker * (^)())centerAlignToSuperView _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view))centerAlignTo _HGC_return_nil
- (HGCLayoutLinker * (^)(CGFloat xMargin, CGFloat yMargin))centerToSuperView _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view, CGFloat xMargin, CGFloat yMargin))centerTo _HGC_return_nil

/** Width */

- (HGCLayoutLinker * (^)(CGFloat value))widthIs _HGC_return_nil
- (HGCLayoutLinker * (^)(CGFloat value))widthGreaterThanOrIs _HGC_return_nil
- (HGCLayoutLinker * (^)(CGFloat value))widthLessThanOrIs _HGC_return_nil

- (HGCLayoutLinker * (^)(CGSize size))widthEqualToSize _HGC_return_nil
- (HGCLayoutLinker * (^)(CGSize size))widthGreaterThanOrEqualToSize _HGC_return_nil
- (HGCLayoutLinker * (^)(CGSize size))widthLessThanOrEqualToSize _HGC_return_nil

- (HGCLayoutLinker * (^)())widthEqualToSuperview _HGC_return_nil
- (HGCLayoutLinker * (^)())widthGreaterThanOrEqualToSuperview _HGC_return_nil
- (HGCLayoutLinker * (^)())widthLessThanOrEqualToSuperview _HGC_return_nil
- (HGCLayoutLinker * (^)(CGFloat value))widthEqualToSuperViewAdd _HGC_return_nil
- (HGCLayoutLinker * (^)(CGFloat value))widthEqualToSuperViewScale _HGC_return_nil

- (HGCLayoutLinker * (^)(UIView *view))widthEqualTo _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view))widthGreaterThanOrEqualTo _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view))widthLessThanOrEqualTo _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view, CGFloat value))widthEqualToAdd _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view, CGFloat value))widthEqualToScale _HGC_return_nil

/** Height */

- (HGCLayoutLinker * (^)(CGFloat value))heightIs _HGC_return_nil
- (HGCLayoutLinker * (^)(CGFloat value))heightGreaterThanOrIs _HGC_return_nil
- (HGCLayoutLinker * (^)(CGFloat value))heightLessThanOrIs _HGC_return_nil

- (HGCLayoutLinker * (^)(CGSize size))heightEqualToSize _HGC_return_nil
- (HGCLayoutLinker * (^)(CGSize size))heightGreaterThanOrEqualToSize _HGC_return_nil
- (HGCLayoutLinker * (^)(CGSize size))heightLessThanOrEqualToSize _HGC_return_nil

- (HGCLayoutLinker * (^)())heightEqualToSuperview _HGC_return_nil
- (HGCLayoutLinker * (^)())heightGreaterThanOrEqualToSuperview _HGC_return_nil
- (HGCLayoutLinker * (^)())heightLessThanOrEqualToSuperview _HGC_return_nil
- (HGCLayoutLinker * (^)(CGFloat value))heightEqualToSuperViewAdd _HGC_return_nil
- (HGCLayoutLinker * (^)(CGFloat value))heightEqualToSuperViewScale _HGC_return_nil

- (HGCLayoutLinker * (^)(UIView *view))heightEqualTo _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view))heightGreaterThanOrEqualTo _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view))heightLessThanOrEqualTo _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view, CGFloat value))heightEqualToAdd _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view, CGFloat value))heightEqualToScale _HGC_return_nil

/** Size */

- (HGCLayoutLinker * (^)(CGSize size))sizeIs _HGC_return_nil
- (HGCLayoutLinker * (^)(CGSize size))sizeGreaterThanOrIs _HGC_return_nil
- (HGCLayoutLinker * (^)(CGSize size))sizeLessThanOrIs _HGC_return_nil

- (HGCLayoutLinker * (^)())sizeEqualToSuperView _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view))sizeEqualTo _HGC_return_nil

/** Leading */

- (HGCLayoutLinker * (^)(UIView *view))leftAlignToRightOf _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))leadingToRightOf _HGC_return_nil

/** Trailing */

- (HGCLayoutLinker * (^)(UIView *view))rightAlignToLeftOf _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))trailingToLeftOf _HGC_return_nil

/** Top Spacing to Bottom */

- (HGCLayoutLinker * (^)(UIView *view))topAlignToBottomOf _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))topSpacingToBottomOf _HGC_return_nil

/** Bottom Spacing to Top */

- (HGCLayoutLinker * (^)(UIView *view))bottomAlignToTopOf _HGC_return_nil
- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))bottomSpacingToTopOf _HGC_return_nil

@end

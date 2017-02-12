//
//  HGCUpdateLayoutLinker.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/8/27.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "HGCUpdateLayoutLinker.h"
#import "HGCMasonryWrapper+Update.h"


///////////////////////////////////////////////////////////////////////////////////////////


@interface HGCUpdateLayoutLinker ()

@end

@implementation HGCUpdateLayoutLinker


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Left

- (HGCLayoutLinker * (^)())leftAlignToSuperView {
    return ^HGCLayoutLinker *() {
        return self.leftTo(self.srcView.superview, 0);
    };
}

- (HGCLayoutLinker * (^)(CGFloat margin))leftToSuperView {
    return ^HGCLayoutLinker *(CGFloat margin) {
        return self.leftTo(self.srcView.superview, margin);
    };
}

- (HGCLayoutLinker * (^)(UIView *view))leftAlignTo {
    return ^HGCLayoutLinker *(UIView *view) {
        return self.leftTo(view, 0);
    };
}

- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))leftTo {
    return ^HGCLayoutLinker *(UIView *view, CGFloat margin) {
        [HGCMas updateView:self.srcView leftMargin:margin to:view];
        return self;
    };
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Right

- (HGCLayoutLinker * (^)())rightAlignToSuperView {
    return ^HGCLayoutLinker *() {
        return self.rightTo(self.srcView.superview, 0);
    };
}

- (HGCLayoutLinker * (^)(CGFloat margin))rightToSuperView {
    return ^HGCLayoutLinker *(CGFloat margin) {
        return self.rightTo(self.srcView.superview, margin);
    };
}

- (HGCLayoutLinker * (^)(UIView *view))rightAlignTo {
    return ^HGCLayoutLinker *(UIView *view) {
        return self.rightTo(view, 0);
    };
}

- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))rightTo {
    return ^HGCLayoutLinker *(UIView *view, CGFloat margin) {
        [HGCMas updateView:self.srcView rightMargin:margin to:view];
        return self;
    };
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Top

- (HGCLayoutLinker * (^)())topAlignToSuperView {
    return ^HGCLayoutLinker *() {
        return self.topTo(self.srcView.superview, 0);
    };
}

- (HGCLayoutLinker * (^)(CGFloat margin))topToSuperView {
    return ^HGCLayoutLinker *(CGFloat margin) {
        return self.topTo(self.srcView.superview, margin);
    };
}

- (HGCLayoutLinker * (^)(UIView *view))topAlignTo {
    return ^HGCLayoutLinker *(UIView *view) {
        return self.topTo(view, 0);
    };
}

- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))topTo {
    return ^HGCLayoutLinker *(UIView *view, CGFloat margin) {
        [HGCMas updateView:self.srcView topMargin:margin to:view];
        return self;
    };
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Bottom

- (HGCLayoutLinker * (^)())bottomAlignToSuperView {
    return ^HGCLayoutLinker *() {
        return self.bottomTo(self.srcView.superview, 0);
    };
}

- (HGCLayoutLinker * (^)(CGFloat margin))bottomToSuperView {
    return ^HGCLayoutLinker *(CGFloat margin) {
        return self.bottomTo(self.srcView.superview, margin);
    };
}

- (HGCLayoutLinker * (^)(UIView *view))bottomAlignTo {
    return ^HGCLayoutLinker *(UIView *view) {
        return self.bottomTo(view, 0);
    };
}

- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))bottomTo {
    return ^HGCLayoutLinker *(UIView *view, CGFloat margin) {
        [HGCMas updateView:self.srcView bottomMargin:margin to:view];
        return self;
    };
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Edges

- (HGCLayoutLinker * (^)())edgeAlignToSuperView {
    return ^HGCLayoutLinker *() {
        return self.edgeTo(self.srcView.superview, UIEdgeInsetsZero);
    };
}

- (HGCLayoutLinker * (^)(UIEdgeInsets insets))edgeToSuperView {
    return ^HGCLayoutLinker *(UIEdgeInsets insets) {
        return self.edgeTo(self.srcView.superview, insets);
    };
}

- (HGCLayoutLinker * (^)(UIView *view))edgeAlignTo {
    return ^HGCLayoutLinker *(UIView *view) {
        return self.edgeTo(view, UIEdgeInsetsZero);
    };
}

- (HGCLayoutLinker * (^)(UIView *view, UIEdgeInsets insets))edgeTo {
    return ^HGCLayoutLinker *(UIView *view, UIEdgeInsets insets) {
        [HGCMas updateView:self.srcView edgeInsets:insets to:view];
        return self;
    };
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - CenterX

- (HGCLayoutLinker * (^)())centerXAlignToSuperView {
    return ^HGCLayoutLinker *() {
        return self.centerXAlignTo(self.srcView.superview);
    };
}

- (HGCLayoutLinker * (^)(UIView *view))centerXAlignTo {
    return ^HGCLayoutLinker *(UIView *view) {
        [HGCMas updateView:self.srcView centerXAlignTo:view];
        return self;
    };
}

- (HGCLayoutLinker * (^)(CGFloat margin))centerXToSuperView {
    return ^HGCLayoutLinker *(CGFloat margin) {
        return self.centerTo(self.srcView.superview, margin, 0);
    };
}

- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))centerXTo {
    return ^HGCLayoutLinker *(UIView *view, CGFloat margin) {
        return self.centerTo(view, margin, 0);
    };
}

#pragma mark - CenterY

- (HGCLayoutLinker * (^)())centerYAlignToSuperView {
    return ^HGCLayoutLinker *() {
        return self.centerYAlignTo(self.srcView.superview);
    };
}

- (HGCLayoutLinker * (^)(UIView *view))centerYAlignTo {
    return ^HGCLayoutLinker *(UIView *view) {
        [HGCMas updateView:self.srcView centerYAlignTo:view];
        return self;
    };
}

- (HGCLayoutLinker * (^)(CGFloat margin))centerYToSuperView {
    return ^HGCLayoutLinker *(CGFloat margin) {
        return self.centerTo(self.srcView.superview, 0, margin);
    };
}

- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))centerYTo {
    return ^HGCLayoutLinker *(UIView *view, CGFloat margin) {
        return self.centerTo(view, 0, margin);
    };
}

#pragma mark - Center

- (HGCLayoutLinker * (^)())centerAlignToSuperView {
    return ^HGCLayoutLinker *() {
        return self.centerAlignTo(self.srcView.superview);
    };
}

- (HGCLayoutLinker * (^)(UIView *view))centerAlignTo {
    return ^HGCLayoutLinker *(UIView *view) {
        [HGCMas updateView:self.srcView centerAlignTo:view];
        return self;
    };
}

- (HGCLayoutLinker * (^)(CGFloat xMargin, CGFloat yMargin))centerToSuperView {
    return ^HGCLayoutLinker *(CGFloat xMargin, CGFloat yMargin) {
        return self.centerTo(self.srcView.superview, xMargin, yMargin);
    };
}

- (HGCLayoutLinker * (^)(UIView *view, CGFloat xMargin, CGFloat yMargin))centerTo {
    return ^HGCLayoutLinker *(UIView *view, CGFloat xMargin, CGFloat yMargin) {
        [HGCMas updateView:self.srcView centerXOffset:xMargin centerYOffset:yMargin to:view];
        return self;
    };
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark -  Width

/** Relation */

- (HGCLayoutLinker * (^)(CGFloat value))widthIs {
    return ^HGCLayoutLinker *(CGFloat value) {
        [HGCMas updateView:self.srcView width:value];
        return self;
    };
}

- (HGCLayoutLinker * (^)(CGFloat value))widthGreaterThanOrIs {
    return ^HGCLayoutLinker *(CGFloat value) {
        [HGCMas updateView:self.srcView widthGreaterThanOrEqualTo:value];
        return self;
    };
}

- (HGCLayoutLinker * (^)(CGFloat value))widthLessThanOrIs {
    return ^HGCLayoutLinker *(CGFloat value) {
        [HGCMas updateView:self.srcView widthLessThanOrEqualTo:value];
        return self;
    };
}

- (HGCLayoutLinker * (^)(CGSize size))widthEqualToSize {
    return ^HGCLayoutLinker *(CGSize size) {
        return self.widthIs(size.width);
    };
}

- (HGCLayoutLinker * (^)(CGSize size))widthGreaterThanOrEqualToSize {
    return ^HGCLayoutLinker *(CGSize size) {
        return self.widthGreaterThanOrIs(size.width);
    };
}

- (HGCLayoutLinker * (^)(CGSize size))widthLessThanOrEqualToSize {
    return ^HGCLayoutLinker *(CGSize size) {
        return self.widthLessThanOrIs(size.width);
    };
}

/** To SuperView */

- (HGCLayoutLinker * (^)())widthEqualToSuperview {
    return ^HGCLayoutLinker *() {
        return self.widthEqualTo(self.srcView.superview);
    };
}

- (HGCLayoutLinker * (^)())widthGreaterThanOrEqualToSuperview {
    return ^HGCLayoutLinker *() {
        return self.widthGreaterThanOrEqualTo(self.srcView.superview);
    };
}

- (HGCLayoutLinker * (^)())widthLessThanOrEqualToSuperview {
    return ^HGCLayoutLinker *() {
        return self.widthLessThanOrEqualTo(self.srcView.superview);
    };
}

- (HGCLayoutLinker * (^)(CGFloat value))widthEqualToSuperViewAdd {
    return ^HGCLayoutLinker *(CGFloat value) {
        return self.widthEqualToAdd(self.srcView.superview, value);
    };
}

- (HGCLayoutLinker * (^)(CGFloat value))widthEqualToSuperViewScale {
    return ^HGCLayoutLinker *(CGFloat value) {
        return self.widthEqualToScale(self.srcView.superview, value);
    };
}

/** To View */

- (HGCLayoutLinker * (^)(UIView *view))widthEqualTo {
    return ^HGCLayoutLinker *(UIView *view) {
        [HGCMas updateView:self.srcView widthEqualToView:view];
        return self;
    };
}

- (HGCLayoutLinker * (^)(UIView *view))widthGreaterThanOrEqualTo {
    return ^HGCLayoutLinker *(UIView *view) {
        [HGCMas updateView:self.srcView widthGreaterThanOrEqualToView:view];
        return self;
    };
}

- (HGCLayoutLinker * (^)(UIView *view))widthLessThanOrEqualTo {
    return ^HGCLayoutLinker *(UIView *view) {
        [HGCMas updateView:self.srcView widthLessThanOrEqualToView:view];
        return self;
    };
}

- (HGCLayoutLinker * (^)(UIView *view, CGFloat value))widthEqualToAdd {
    return ^HGCLayoutLinker *(UIView *view, CGFloat value) {
        [HGCMas updateView:self.srcView widthOffset:value compareTo:view];
        return self;
    };
}

- (HGCLayoutLinker * (^)(UIView *view, CGFloat value))widthEqualToScale {
    return ^HGCLayoutLinker *(UIView *view, CGFloat value) {
        [HGCMas updateView:self.srcView widthScaleBy:value compareTo:view];
        return self;
    };
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark -  Height

/** Relation */

- (HGCLayoutLinker * (^)(CGFloat value))heightIs {
    return ^HGCLayoutLinker *(CGFloat value) {
        [HGCMas updateView:self.srcView height:value];
        return self;
    };
}

- (HGCLayoutLinker * (^)(CGFloat value))heightGreaterThanOrIs {
    return ^HGCLayoutLinker *(CGFloat value) {
        [HGCMas updateView:self.srcView heightGreaterThanOrEqualTo:value];
        return self;
    };
}

- (HGCLayoutLinker * (^)(CGFloat value))heightLessThanOrIs {
    return ^HGCLayoutLinker *(CGFloat value) {
        [HGCMas updateView:self.srcView heightLessThanOrEqualTo:value];
        return self;
    };
}

- (HGCLayoutLinker * (^)(CGSize size))heightEqualToSize {
    return ^HGCLayoutLinker *(CGSize size) {
        return self.heightIs(size.height);
    };
}

- (HGCLayoutLinker * (^)(CGSize size))heightGreaterThanOrEqualToSize {
    return ^HGCLayoutLinker *(CGSize size) {
        return self.heightGreaterThanOrIs(size.height);
    };
}

- (HGCLayoutLinker * (^)(CGSize size))heightLessThanOrEqualToSize {
    return ^HGCLayoutLinker *(CGSize size) {
        return self.heightLessThanOrIs(size.height);
    };
}

/** To SuperView */

- (HGCLayoutLinker * (^)())heightEqualToSuperview {
    return ^HGCLayoutLinker *() {
        return self.heightEqualTo(self.srcView.superview);
    };
}

- (HGCLayoutLinker * (^)())heightGreaterThanOrEqualToSuperview {
    return ^HGCLayoutLinker *() {
        return self.heightGreaterThanOrEqualTo(self.srcView.superview);
    };
}

- (HGCLayoutLinker * (^)())heightLessThanOrEqualToSuperview {
    return ^HGCLayoutLinker *() {
        return self.heightLessThanOrEqualTo(self.srcView.superview);
    };
}

- (HGCLayoutLinker * (^)(CGFloat value))heightEqualToSuperViewAdd {
    return ^HGCLayoutLinker *(CGFloat value) {
        return self.heightEqualToAdd(self.srcView.superview, value);
    };
}

- (HGCLayoutLinker * (^)(CGFloat value))heightEqualToSuperViewScale {
    return ^HGCLayoutLinker *(CGFloat value) {
        return self.heightEqualToScale(self.srcView.superview, value);
    };
}

/** To View */

- (HGCLayoutLinker * (^)(UIView *view))heightEqualTo {
    return ^HGCLayoutLinker *(UIView *view) {
        [HGCMas updateView:self.srcView heightEqualToView:view];
        return self;
    };
}

- (HGCLayoutLinker * (^)(UIView *view))heightGreaterThanOrEqualTo {
    return ^HGCLayoutLinker *(UIView *view) {
        [HGCMas updateView:self.srcView heightGreaterThanOrEqualToView:view];
        return self;
    };
}

- (HGCLayoutLinker * (^)(UIView *view))heightLessThanOrEqualTo {
    return ^HGCLayoutLinker *(UIView *view) {
        [HGCMas updateView:self.srcView heightLessThanOrEqualToView:view];
        return self;
    };
}

- (HGCLayoutLinker * (^)(UIView *view, CGFloat value))heightEqualToAdd {
    return ^HGCLayoutLinker *(UIView *view, CGFloat value) {
        [HGCMas updateView:self.srcView heightOffset:value compareTo:view];
        return self;
    };
}

- (HGCLayoutLinker * (^)(UIView *view, CGFloat value))heightEqualToScale {
    return ^HGCLayoutLinker *(UIView *view, CGFloat value) {
        [HGCMas updateView:self.srcView heightScaleBy:value compareTo:view];
        return self;
    };
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark -  Size

- (HGCLayoutLinker * (^)(CGSize size))sizeIs {
    return ^HGCLayoutLinker *(CGSize size) {
        [HGCMas updateView:self.srcView size:size];
        return self;
    };
}

- (HGCLayoutLinker * (^)(CGSize size))sizeGreaterThanOrIs {
    return ^HGCLayoutLinker *(CGSize size) {
        self.widthGreaterThanOrIs(size.width);
        self.heightGreaterThanOrIs(size.height);
        return self;
    };
}

- (HGCLayoutLinker * (^)(CGSize size))sizeLessThanOrIs {
    return ^HGCLayoutLinker *(CGSize size) {
        self.widthLessThanOrIs(size.width);
        self.heightLessThanOrIs(size.height);
        return self;
    };
}

- (HGCLayoutLinker * (^)())sizeEqualToSuperView {
    return ^HGCLayoutLinker *() {
        return self.sizeEqualTo(self.srcView.superview);
    };
}

- (HGCLayoutLinker * (^)(UIView *view))sizeEqualTo {
    return ^HGCLayoutLinker *(UIView *view) {
        [HGCMas updateView:self.srcView sizeEqualTo:view];
        return self;
    };
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark -  Leading

- (HGCLayoutLinker * (^)(UIView *view))leftAlignToRightOf {
    return ^HGCLayoutLinker *(UIView *view) {
        return self.leadingToRightOf(view, 0);
    };
}

- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))leadingToRightOf {
    return ^HGCLayoutLinker *(UIView *view, CGFloat margin) {
        [HGCMas updateView:self.srcView leading:margin toRightOf:view];
        return self;
    };
}

#pragma mark -  Trailing

- (HGCLayoutLinker * (^)(UIView *view))rightAlignToLeftOf {
    return ^HGCLayoutLinker *(UIView *view) {
        return self.trailingToLeftOf(view, 0);
    };
}

- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))trailingToLeftOf {
    return ^HGCLayoutLinker *(UIView *view, CGFloat margin) {
        [HGCMas updateView:self.srcView trailing:margin toLeftOf:view];
        return self;
    };
}

#pragma mark -  Top Spacing to Bottom

- (HGCLayoutLinker * (^)(UIView *view))topAlignToBottomOf {
    return ^HGCLayoutLinker *(UIView *view) {
        return self.topSpacingToBottomOf(view, 0);
    };
}

- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))topSpacingToBottomOf {
    return ^HGCLayoutLinker *(UIView *view, CGFloat margin) {
        [HGCMas updateView:self.srcView topSpacing:margin toBottomOf:view];
        return self;
    };
}

#pragma mark -  Bottom Spacing to Top

- (HGCLayoutLinker * (^)(UIView *view))bottomAlignToTopOf {
    return ^HGCLayoutLinker *(UIView *view) {
        return self.bottomSpacingToTopOf(view, 0);
    };
}

- (HGCLayoutLinker * (^)(UIView *view, CGFloat margin))bottomSpacingToTopOf {
    return ^HGCLayoutLinker *(UIView *view, CGFloat margin) {
        [HGCMas updateView:self.srcView bottomSpacing:margin toTopOf:view];
        return self;
    };
}

@end

//
//  HGCMasonryWrapper+Update.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/8/27.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "HGCMasonryWrapper+Update.h"
#import "Masonry.h"

@implementation HGCMasonryWrapper (Update)


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Edges Align

+ (void)updateView:(UIView *)srcView leftAligntTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(desView);
    }];
}

+ (void)updateView:(UIView *)srcView rightAligntTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(desView);
    }];
}

+ (void)updateView:(UIView *)srcView topAligntTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(desView);
    }];
}

+ (void)updateView:(UIView *)srcView bottomAligntTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(desView);
    }];
}

+ (void)updateView:(UIView *)srcView leftAndRightAlignTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(desView);
    }];
}

+ (void)updateView:(UIView *)srcView leftRightAndTopAlignTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.top.equalTo(desView);
    }];
}

+ (void)updateView:(UIView *)srcView leftRightAndBottomAlignTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.bottom.equalTo(desView);
    }];
}

+ (void)updateView:(UIView *)srcView topAndBottomAlignTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.equalTo(desView);
    }];
}

+ (void)updateView:(UIView *)srcView edgesAlignTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(desView);
    }];
}

#pragma mark - Center Align

+ (void)updateView:(UIView *)srcView centerXAlignTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(desView);
    }];
}

+ (void)updateView:(UIView *)srcView centerYAlignTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(desView);
    }];
}

+ (void)updateView:(UIView *)srcView centerAlignTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(desView);
    }];
}

#pragma mark - Center Offset

+ (void)updateView:(UIView *)srcView centerXOffset:(CGFloat)offset to:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(desView).offset(offset);
    }];
}

+ (void)updateView:(UIView *)srcView centerYOffset:(CGFloat)offset to:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(desView).offset(offset);
    }];
}

+ (void)updateView:(UIView *)srcView centerXOffset:(CGFloat)xOffset centerYOffset:(CGFloat)yOffset to:(UIView *)desView
{
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(desView).offset(xOffset);
        make.centerY.equalTo(desView).offset(yOffset);
    }];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Edges Margin

+ (void)updateView:(UIView *)srcView leftMargin:(CGFloat)margin to:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(desView).offset(margin);
    }];
}

+ (void)updateView:(UIView *)srcView rightMargin:(CGFloat)margin to:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(desView).offset(-margin);
    }];
}

+ (void)updateView:(UIView *)srcView leftMargin:(CGFloat)lMargin rightMargin:(CGFloat)rMargin to:(UIView *)desView
{
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(desView).offset(lMargin);
        make.right.equalTo(desView).offset(-rMargin);
    }];
}

+ (void)updateView:(UIView *)srcView topMargin:(CGFloat)margin to:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(desView).offset(margin);
    }];
}

+ (void)updateView:(UIView *)srcView bottomMargin:(CGFloat)margin to:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(desView).offset(-margin);
    }];
}

+ (void)updateView:(UIView *)srcView topMargin:(CGFloat)tMargin bottomMargin:(CGFloat)bMargin to:(UIView *)desView
{
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(desView).offset(tMargin);
        make.bottom.equalTo(desView).offset(-bMargin);
    }];
}

+ (void)updateView:(UIView *)srcView edgeInsets:(UIEdgeInsets)insets to:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(desView).insets(insets);
    }];
}

+ (void)updateView:(UIView *)srcView leftMargin:(CGFloat)lMargin rightMargin:(CGFloat)rMargin topMargin:(CGFloat)tMargin bottomMargin:(CGFloat)bMargin to:(UIView *)desView
{
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(desView).insets(UIEdgeInsetsMake(tMargin, lMargin, bMargin, rMargin));
    }];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Width

+ (void)updateView:(UIView *)srcView width:(CGFloat)width {
    HGCMW_singleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(width);
    }];
}

+ (void)updateView:(UIView *)srcView widthGreaterThanOrEqualTo:(CGFloat)width {
    HGCMW_singleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.width.greaterThanOrEqualTo(width);
    }];
}

+ (void)updateView:(UIView *)srcView widthLessThanOrEqualTo:(CGFloat)width {
    HGCMW_singleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.width.lessThanOrEqualTo(width);
    }];
}

+ (void)updateView:(UIView *)srcView widthOffset:(CGFloat)offset compareTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(desView).offset(offset);
    }];
}

+ (void)updateView:(UIView *)srcView widthScaleBy:(CGFloat)scale compareTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(desView).multipliedBy(scale);
    }];
}

+ (void)updateView:(UIView *)srcView widthEqualToSize:(CGSize)size {
    HGCMW_singleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(size.width);
    }];
}

+ (void)updateView:(UIView *)srcView widthEqualToView:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(desView);
    }];
}

+ (void)updateView:(UIView *)srcView widthGreaterThanOrEqualToView:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.width.greaterThanOrEqualTo(desView);
    }];
}

+ (void)updateView:(UIView *)srcView widthLessThanOrEqualToView:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.width.lessThanOrEqualTo(desView);
    }];
}

#pragma mark - Height

+ (void)updateView:(UIView *)srcView height:(CGFloat)height {
    HGCMW_singleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(height);
    }];
}

+ (void)updateView:(UIView *)srcView heightGreaterThanOrEqualTo:(CGFloat)height {
    HGCMW_singleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.height.greaterThanOrEqualTo(height);
    }];
}

+ (void)updateView:(UIView *)srcView heightLessThanOrEqualTo:(CGFloat)height {
    HGCMW_singleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.height.lessThanOrEqualTo(height);
    }];
}

+ (void)updateView:(UIView *)srcView heightOffset:(CGFloat)offset compareTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(desView).offset(offset);
    }];
}

+ (void)updateView:(UIView *)srcView heightScaleBy:(CGFloat)scale compareTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(desView).multipliedBy(scale);
    }];
}

+ (void)updateView:(UIView *)srcView heightEqualToSize:(CGSize)size {
    HGCMW_singleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(size.height);
    }];
}

+ (void)updateView:(UIView *)srcView heightEqualToView:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(desView);
    }];
}

+ (void)updateView:(UIView *)srcView heightGreaterThanOrEqualToView:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.height.greaterThanOrEqualTo(desView);
    }];
}

+ (void)updateView:(UIView *)srcView heightLessThanOrEqualToView:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.height.lessThanOrEqualTo(desView);
    }];
}

#pragma mark - Size

+ (void)updateView:(UIView *)srcView width:(CGFloat)width height:(CGFloat)height {
    HGCMW_singleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(width, height));
    }];
}

+ (void)updateView:(UIView *)srcView sizeEqualTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(desView);
    }];
}

+ (void)updateView:(UIView *)srcView size:(CGSize)size {
    HGCMW_singleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(size);
    }];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Neighbour Align

+ (void)updateView:(UIView *)srcView leadingToRightOf:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(desView.right);
    }];
}

+ (void)updateView:(UIView *)srcView trailingToLeftOf:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(desView.left);
    }];
}

+ (void)updateView:(UIView *)srcView topSpacingToBottomOf:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(desView.bottom);
    }];
}

+ (void)updateView:(UIView *)srcView bottomSpacingToTopOf:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(desView.top);
    }];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Neighbour Spacing

+ (void)updateView:(UIView *)srcView leading:(CGFloat)leading toRightOf:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(desView.right).offset(leading);
    }];
}

+ (void)updateView:(UIView *)srcView trailing:(CGFloat)trailing toLeftOf:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(desView.left).offset(-trailing);
    }];
}

+ (void)updateView:(UIView *)srcView topSpacing:(CGFloat)topSpacing toBottomOf:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(desView.bottom).offset(topSpacing);
    }];
}

+ (void)updateView:(UIView *)srcView bottomSpacing:(CGFloat)bottomSpacing toTopOf:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(desView.top).offset(-bottomSpacing);
    }];
}

@end

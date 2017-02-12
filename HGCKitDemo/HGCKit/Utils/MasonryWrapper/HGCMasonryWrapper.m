//
//  HGCMasonryWrapper.m
//  PetAirBnb
//
//  Created by Jymn_Chen on 15/12/14.
//  Copyright © 2015年 com.luedong. All rights reserved.
//

#import "HGCMasonryWrapper.h"
#import "Masonry.h"

@implementation HGCMasonryWrapper


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Edges Align

+ (void)view:(UIView *)srcView leftAligntTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(desView);
    }];
}

+ (void)view:(UIView *)srcView rightAligntTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(desView);
    }];
}

+ (void)view:(UIView *)srcView topAligntTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(desView);
    }];
}

+ (void)view:(UIView *)srcView bottomAligntTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(desView);
    }];
}

+ (void)view:(UIView *)srcView leftAndRightAlignTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(desView);
    }];
}

+ (void)view:(UIView *)srcView leftRightAndTopAlignTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.top.equalTo(desView);
    }];
}

+ (void)view:(UIView *)srcView leftRightAndBottomAlignTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.and.bottom.equalTo(desView);
    }];
}

+ (void)view:(UIView *)srcView topAndBottomAlignTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.equalTo(desView);
    }];
}

+ (void)view:(UIView *)srcView edgesAlignTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(desView);
    }];
}

#pragma mark - Center Align

+ (void)view:(UIView *)srcView centerXAlignTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(desView);
    }];
}

+ (void)view:(UIView *)srcView centerYAlignTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(desView);
    }];
}

+ (void)view:(UIView *)srcView centerAlignTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(desView);
    }];
}

#pragma mark - Center Offset

+ (void)view:(UIView *)srcView centerXOffset:(CGFloat)offset to:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(desView).offset(offset);
    }];
}

+ (void)view:(UIView *)srcView centerYOffset:(CGFloat)offset to:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(desView).offset(offset);
    }];
}

+ (void)view:(UIView *)srcView centerXOffset:(CGFloat)xOffset centerYOffset:(CGFloat)yOffset to:(UIView *)desView
{
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(desView).offset(xOffset);
        make.centerY.equalTo(desView).offset(yOffset);
    }];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Edges Margin

+ (void)view:(UIView *)srcView leftMargin:(CGFloat)margin to:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(desView).offset(margin);
    }];
}

+ (void)view:(UIView *)srcView rightMargin:(CGFloat)margin to:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(desView).offset(-margin);
    }];
}

+ (void)view:(UIView *)srcView leftMargin:(CGFloat)lMargin rightMargin:(CGFloat)rMargin to:(UIView *)desView
{
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(desView).offset(lMargin);
        make.right.equalTo(desView).offset(-rMargin);
    }];
}

+ (void)view:(UIView *)srcView topMargin:(CGFloat)margin to:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(desView).offset(margin);
    }];
}

+ (void)view:(UIView *)srcView bottomMargin:(CGFloat)margin to:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(desView).offset(-margin);
    }];
}

+ (void)view:(UIView *)srcView topMargin:(CGFloat)tMargin bottomMargin:(CGFloat)bMargin to:(UIView *)desView
{
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(desView).offset(tMargin);
        make.bottom.equalTo(desView).offset(-bMargin);
    }];
}

+ (void)view:(UIView *)srcView edgeInsets:(UIEdgeInsets)insets to:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(desView).insets(insets);
    }];
}

+ (void)view:(UIView *)srcView leftMargin:(CGFloat)lMargin rightMargin:(CGFloat)rMargin topMargin:(CGFloat)tMargin bottomMargin:(CGFloat)bMargin to:(UIView *)desView
{
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(desView).insets(UIEdgeInsetsMake(tMargin, lMargin, bMargin, rMargin));
    }];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Width

+ (void)view:(UIView *)srcView width:(CGFloat)width {
    HGCMW_singleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(width);
    }];
}

+ (void)view:(UIView *)srcView widthGreaterThanOrEqualTo:(CGFloat)width {
    HGCMW_singleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.width.greaterThanOrEqualTo(width);
    }];
}

+ (void)view:(UIView *)srcView widthLessThanOrEqualTo:(CGFloat)width {
    HGCMW_singleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.width.lessThanOrEqualTo(width);
    }];
}

+ (void)view:(UIView *)srcView widthOffset:(CGFloat)offset compareTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(desView).offset(offset);
    }];
}

+ (void)view:(UIView *)srcView widthScaleBy:(CGFloat)scale compareTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(desView).multipliedBy(scale);
    }];
}

+ (void)view:(UIView *)srcView widthEqualToSize:(CGSize)size {
    HGCMW_singleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(size.width);
    }];
}

+ (void)view:(UIView *)srcView widthEqualToView:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(desView);
    }];
}

+ (void)view:(UIView *)srcView widthGreaterThanOrEqualToView:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.width.greaterThanOrEqualTo(desView);
    }];
}

+ (void)view:(UIView *)srcView widthLessThanOrEqualToView:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.width.lessThanOrEqualTo(desView);
    }];
}

#pragma mark - Height

+ (void)view:(UIView *)srcView height:(CGFloat)height {
    HGCMW_singleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(height);
    }];
}

+ (void)view:(UIView *)srcView heightGreaterThanOrEqualTo:(CGFloat)height {
    HGCMW_singleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.height.greaterThanOrEqualTo(height);
    }];
}

+ (void)view:(UIView *)srcView heightLessThanOrEqualTo:(CGFloat)height {
    HGCMW_singleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.height.lessThanOrEqualTo(height);
    }];
}

+ (void)view:(UIView *)srcView heightOffset:(CGFloat)offset compareTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(desView).offset(offset);
    }];
}

+ (void)view:(UIView *)srcView heightScaleBy:(CGFloat)scale compareTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(desView).multipliedBy(scale);
    }];
}

+ (void)view:(UIView *)srcView heightEqualToSize:(CGSize)size {
    HGCMW_singleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(size.height);
    }];
}

+ (void)view:(UIView *)srcView heightEqualToView:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(desView);
    }];
}

+ (void)view:(UIView *)srcView heightGreaterThanOrEqualToView:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.height.greaterThanOrEqualTo(desView);
    }];
}

+ (void)view:(UIView *)srcView heightLessThanOrEqualToView:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.height.lessThanOrEqualTo(desView);
    }];
}

#pragma mark - Size

+ (void)view:(UIView *)srcView width:(CGFloat)width height:(CGFloat)height {
    HGCMW_singleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(width, height));
    }];
}

+ (void)view:(UIView *)srcView sizeEqualTo:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(desView);
    }];
}

+ (void)view:(UIView *)srcView size:(CGSize)size {
    HGCMW_singleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(size);
    }];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Neighbour Align

+ (void)view:(UIView *)srcView leadingToRightOf:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(desView.right);
    }];
}

+ (void)view:(UIView *)srcView trailingToLeftOf:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(desView.left);
    }];
}

+ (void)view:(UIView *)srcView topSpacingToBottomOf:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(desView.bottom);
    }];
}

+ (void)view:(UIView *)srcView bottomSpacingToTopOf:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(desView.top);
    }];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Neighbour Spacing

+ (void)view:(UIView *)srcView leading:(CGFloat)leading toRightOf:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(desView.right).offset(leading);
    }];
}

+ (void)view:(UIView *)srcView trailing:(CGFloat)trailing toLeftOf:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(desView.left).offset(-trailing);
    }];
}

+ (void)view:(UIView *)srcView topSpacing:(CGFloat)topSpacing toBottomOf:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(desView.bottom).offset(topSpacing);
    }];
}

+ (void)view:(UIView *)srcView bottomSpacing:(CGFloat)bottomSpacing toTopOf:(UIView *)desView {
    HGCMW_doubleCheck
    [srcView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(desView.top).offset(-bottomSpacing);
    }];
}

@end

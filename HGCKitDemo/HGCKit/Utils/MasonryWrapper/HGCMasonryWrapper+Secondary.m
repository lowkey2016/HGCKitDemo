////
////  HGCMasonryWrapper+Secondary.m
////  PetAirBnb
////
////  Created by Jymn_Chen on 15/12/14.
////  Copyright © 2015年 com.luedong. All rights reserved.
////
//
//#import "HGCMasonryWrapper+Secondary.h"
//
//@implementation HGCMasonryWrapper (Secondary)
//
//
/////////////////////////////////////////////////////////////////////////////////////////////
//
//
//#pragma mark - Combine
//
//+ (void)sec_view:(UIView *)srcView leftRightAndTopAlignTo:(UIView *)desView height:(CGFloat)height {
//    [self view:srcView leftRightAndTopAlignTo:desView];
//    [self view:srcView height:height];
//}
//
//+ (void)sec_view:(UIView *)srcView leftRightAndBottomAlignTo:(UIView *)desView height:(CGFloat)height {
//    [self view:srcView leftRightAndBottomAlignTo:desView];
//    [self view:srcView height:height];
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////
//
//
//#pragma mark - Line
//
//+ (UIView *)sec_view:(UIView *)srcView addTopLineWithColor:(UIColor *)color height:(CGFloat)height {
//    if (srcView == nil) {
//        return nil;
//    }
//    UIView *line = [UIView new];
//    line.backgroundColor = color;
//    [srcView addSubview:line];
//    [line makeConstraints:^(MASConstraintMaker *make) {
//        make.left.and.right.equalTo(srcView);
//        make.top.equalTo(srcView);
//        make.height.equalTo(height);
//    }];
//    
//    return line;
//}
//
//+ (UIView *)sec_view:(UIView *)srcView addBottomLineWithColor:(UIColor *)color height:(CGFloat)height {
//    if (srcView == nil) {
//        return nil;
//    }
//    UIView *line = [UIView new];
//    line.backgroundColor = color;
//    [srcView addSubview:line];
//    [line makeConstraints:^(MASConstraintMaker *make) {
//        make.left.and.right.equalTo(srcView);
//        make.bottom.equalTo(srcView).offset(-height);
//        make.height.equalTo(height);
//    }];
//    
//    return line;
//}
//
//
/////////////////////////////////////////////////////////////////////////////////////////////
//
//
//#pragma mark - ContentView of ScrollView
//
//+ (UIView *)sec_addContentViewEdgesAlignToScrollView:(UIScrollView *)desScrollView {
//    return [self sec_addContentViewToScrollView:desScrollView leftMargin:0 rightMargin:0 topMargin:0 bottomMargin:0];
//}
//
//+ (UIView *)sec_addContentViewToScrollView:(UIScrollView *)desScrollView leftMargin:(CGFloat)lMargin rightMargin:(CGFloat)rMargin topMargin:(CGFloat)tMargin bottomMargin:(CGFloat)bMargin
//{
//    if (desScrollView == nil || [desScrollView isKindOfClass:[UIScrollView class]] == NO) {
//        return nil;
//    }
//    UIView *contentView = [UIView new];
//    [desScrollView addSubview:contentView];
//    [contentView makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(desScrollView).insets(UIEdgeInsetsMake(tMargin, lMargin, bMargin, rMargin));
//        make.width.equalTo(desScrollView).offset(-(lMargin + rMargin));
//    }];
//    
//    return contentView;
//}
//
//+ (void)sec_endContentView:(UIView *)srcView bottomAlignTo:(UIView *)desView {
//    if (srcView == nil || desView == nil) { // 注：desView 不是 srcView 的父 View，不要用 doubleCheck 来判断
//        return;
//    }
//    
//    [srcView makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(desView);
//    }];
//}
//
//@end

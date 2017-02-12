//
//  HGCButton.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/8/11.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import "HGCButton.h"
#import "NSString+HGCCategory.h"
#import "UIColor+HGCUtil.h"


///////////////////////////////////////////////////////////////////////////////////////////


@interface HGCButton ()

@end

@implementation HGCButton


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Init

/** 1.1.0 */

+ (instancetype)button {
    return [HGCButton buttonWithType:UIButtonTypeCustom];
}

+ (instancetype)buttonWithTitle:(NSString *)title
                       fontSize:(CGFloat)fontSize
                       fontType:(HGCFontType)fontType
{
    HGCButton *btn = [HGCButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    UIFont *font = [HGCFontFactory fontWithType:fontType size:fontSize];
    btn.titleLabel.font = font;
    [btn setNormalTitleColor:[UIColor whiteColor] highlightedTitleColor:[UIColor lightTextColor]];
    btn.titleLabel.shadowColor = [UIColor whiteColor];
    return btn;
}

+ (instancetype)buttonWithNormalImage:(UIImage *)normalImg
                      highlightedImag:(UIImage *)highlightedImg
{
    HGCButton *btn = [HGCButton buttonWithType:UIButtonTypeCustom];
    [btn setNormalTitle:nil];
    [btn setNormalImage:normalImg highlightedImage:highlightedImg];
    return btn;
}

+ (instancetype)buttonWithNormalImageColor:(UIColor *)normalColor
                      highlightedImagColor:(UIColor *)highlightedColor
{
    HGCButton *btn = [HGCButton buttonWithType:UIButtonTypeCustom];
    [btn setNormalTitle:nil];
    [btn setNormalImageWithColor:normalColor highlightedImageWithColor:highlightedColor];
    return btn;
}

/** 1.0.0 */

- (instancetype)initWithTitle:(NSString *)title
                         font:(UIFont *)font
              backgroundImage:(UIImage *)bgImage
             highlightedImage:(UIImage *)hlImage
                        frame:(CGRect)frame
                         type:(HGCButtonType)type
{
    self = [HGCButton buttonWithType:UIButtonTypeCustom];
    if (type == HGCButtonTypeText || type == HGCButtonTypeTextAndImage) {
        if (title && [title hgc_isNotEmpty]) {
            [self setTitle:title forState:UIControlStateNormal];
            self.titleLabel.font = font;
            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self setTitleColor:[UIColor lightTextColor] forState:UIControlStateHighlighted];
            self.titleLabel.shadowColor = [UIColor whiteColor];
        }
    }
    
    if (type == HGCButtonTypeImage || type == HGCButtonTypeTextAndImage) {
        if (bgImage) {
            [self setBackgroundImage:bgImage forState:UIControlStateNormal];
        }
        if (hlImage) {
            [self setBackgroundImage:hlImage forState:UIControlStateHighlighted];
        }
    }
    
    self.frame = frame;
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                     fontSize:(CGFloat)fontSize
                     fontType:(HGCFontType)fontType
              backgroundImage:(UIImage *)bgImage
             highlightedImage:(UIImage *)hlImage
                        frame:(CGRect)frame
                         type:(HGCButtonType)type
{
    UIFont *font = [HGCFontFactory fontWithType:fontType size:fontSize];
    return [self initWithTitle:title font:font backgroundImage:bgImage highlightedImage:hlImage frame:frame type:type];
}

- (instancetype)initWithTitle:(NSString *)title
                     fontSize:(CGFloat)fontSize
                   isBoldFont:(BOOL)isBold
              backgroundImage:(UIImage *)bgImage
             highlightedImage:(UIImage *)hlImage
                        frame:(CGRect)frame
                         type:(HGCButtonType)type
{
    UIFont *font;
    if (isBold) {
        font = [UIFont boldSystemFontOfSize:fontSize];
    }
    else {
        font = [UIFont systemFontOfSize:fontSize];
    }
    return [self initWithTitle:title font:font backgroundImage:bgImage highlightedImage:hlImage frame:frame type:type];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Quick Methods

/** Action */

- (void)addTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)removeTarget:(id)target action:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

/** Title */

- (void)setNormalTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)setNormalTitleColor:(UIColor *)normalColor highlightedTitleColor:(UIColor *)highlightedColor
{
    [self setTitleColor:normalColor forState:UIControlStateNormal];
    [self setTitleColor:highlightedColor forState:UIControlStateHighlighted];
}

- (void)setDisabledTitleColor:(UIColor *)disabledColor {
    [self setTitleColor:disabledColor forState:UIControlStateDisabled];
}

/** FG Img */

- (void)setNormalImage:(UIImage *)normalImg highlightedImage:(UIImage *)highlightedImg {
    [self setImage:normalImg forState:UIControlStateNormal];
    [self setImage:highlightedImg forState:UIControlStateHighlighted];
}

- (void)setNormalImageWithColor:(UIColor *)normalImgColor highlightedImageWithColor:(UIColor *)highlightedImgColor
{
    UIImage *normalImg = [UIColor hgc_imageWithColor:normalImgColor];
    UIImage *highlightedImg = [UIColor hgc_imageWithColor:highlightedImgColor];
    [self setNormalImage:normalImg highlightedImage:highlightedImg];
}

- (void)setDisabledImage:(UIImage *)disabledImg {
    [self setImage:disabledImg forState:UIControlStateDisabled];
}

- (void)setDisabledImageWithColor:(UIColor *)disabledImgColor {
    UIImage *disabledImg = [UIColor hgc_imageWithColor:disabledImgColor];
    [self setImage:disabledImg forState:UIControlStateDisabled];
}

/** BG Img */

- (void)setNormalBackgroundImage:(UIImage *)normalBGImg highlightedBackgroundImage:(UIImage *)highlightedBGImg
{
    [self setBackgroundImage:normalBGImg forState:UIControlStateNormal];
    [self setBackgroundImage:highlightedBGImg forState:UIControlStateHighlighted];
}

- (void)setNormalBackgroundImageWithColor:(UIColor *)normalBGImgColor highlightedBackgroundImageWithColor:(UIColor *)highlightedBGImgColor
{
    UIImage *normalImg = [UIColor hgc_imageWithColor:normalBGImgColor];
    UIImage *highlightedImg = [UIColor hgc_imageWithColor:highlightedBGImgColor];
    [self setNormalBackgroundImage:normalImg highlightedBackgroundImage:highlightedImg];
}

- (void)setDisabledBackgroundImage:(UIImage *)disabledImg {
    [self setBackgroundImage:disabledImg forState:UIControlStateDisabled];
}

- (void)setDisabledBackgroundImageWithColor:(UIColor *)disabledBGImgColor {
    UIImage *disabledImg = [UIColor hgc_imageWithColor:disabledBGImgColor];
    [self setBackgroundImage:disabledImg forState:UIControlStateDisabled];
}

@end

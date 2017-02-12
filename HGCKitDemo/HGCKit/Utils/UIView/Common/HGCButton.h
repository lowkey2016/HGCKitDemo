//
//  HGCButton.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/8/11.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HGCFontFactory.h"

typedef NS_ENUM(NSUInteger, HGCButtonType) {
    HGCButtonTypeText,
    HGCButtonTypeImage,
    HGCButtonTypeTextAndImage,
};

@interface HGCButton : UIButton

#pragma mark - Init

/** 1.1.0 */

+ (instancetype)button;
+ (instancetype)buttonWithTitle:(NSString *)title
                       fontSize:(CGFloat)fontSize
                       fontType:(HGCFontType)fontType;
+ (instancetype)buttonWithNormalImage:(UIImage *)normalImg
                      highlightedImag:(UIImage *)highlightedImg;
+ (instancetype)buttonWithNormalImageColor:(UIColor *)normalColor
                      highlightedImagColor:(UIColor *)highlightedColor;

/** 1.0.0 */

- (instancetype)initWithTitle:(NSString *)title
                     fontSize:(CGFloat)fontSize
                     fontType:(HGCFontType)fontType
              backgroundImage:(UIImage *)bgImage
             highlightedImage:(UIImage *)hlImage
                        frame:(CGRect)frame
                         type:(HGCButtonType)type;

- (instancetype)initWithTitle:(NSString *)title
                     fontSize:(CGFloat)fontSize
                   isBoldFont:(BOOL)isBold
              backgroundImage:(UIImage *)bgImage
             highlightedImage:(UIImage *)hlImage
                        frame:(CGRect)frame
                         type:(HGCButtonType)type;

#pragma mark - Quick Methods

// default control events: UIControlEventTouchUpInside
- (void)addTarget:(id)target action:(SEL)action;
- (void)removeTarget:(id)target action:(SEL)action;

// title
- (void)setNormalTitle:(NSString *)title;
- (void)setNormalTitleColor:(UIColor *)normalColor highlightedTitleColor:(UIColor *)highlightedColor;
- (void)setDisabledTitleColor:(UIColor *)disabledColor;

// fg img
- (void)setNormalImage:(UIImage *)normalImg highlightedImage:(UIImage *)highlightedImg;
- (void)setNormalImageWithColor:(UIColor *)normalImgColor highlightedImageWithColor:(UIColor *)highlightedImgColor;
- (void)setDisabledImage:(UIImage *)disabledImg;
- (void)setDisabledImageWithColor:(UIColor *)disabledImgColor;

// bg img
- (void)setNormalBackgroundImage:(UIImage *)normalBGImg highlightedBackgroundImage:(UIImage *)highlightedBGImg;
- (void)setNormalBackgroundImageWithColor:(UIColor *)normalBGImgColor highlightedBackgroundImageWithColor:(UIColor *)highlightedBGImgColor;
- (void)setDisabledBackgroundImage:(UIImage *)disabledImg;
- (void)setDisabledBackgroundImageWithColor:(UIColor *)disabledBGImgColor;

@end

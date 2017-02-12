//
//  HGCTextField.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/8/26.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HGCFontFactory.h"

@interface HGCTextField : UITextField

+ (instancetype)textFieldWithPlaceHolder:(NSString *)placeHolder
                                delegate:(id<UITextFieldDelegate>)aDelegate
                                fontSize:(CGFloat)fontSize
                                fontType:(HGCFontType)fontType
                               textColor:(UIColor *)color;

+ (instancetype)textFieldWithPlaceHolder:(NSString *)placeHolder
                        placeHolderColor:(UIColor *)placeHolderColor
                                delegate:(id<UITextFieldDelegate>)aDelegate
                                fontSize:(CGFloat)fontSize
                                fontType:(HGCFontType)fontType
                               textColor:(UIColor *)color;

+ (instancetype)securyTextFieldWithPlaceHolder:(NSString *)placeHolder
                                      delegate:(id<UITextFieldDelegate>)aDelegate
                                      fontSize:(CGFloat)fontSize
                                      fontType:(HGCFontType)fontType
                                     textColor:(UIColor *)color;

+ (instancetype)securyTextFieldWithPlaceHolder:(NSString *)placeHolder
                              placeHolderColor:(UIColor *)placeHolderColor
                                      delegate:(id<UITextFieldDelegate>)aDelegate
                                      fontSize:(CGFloat)fontSize
                                      fontType:(HGCFontType)fontType
                                     textColor:(UIColor *)color;

- (void)setPlaceholder:(NSString *)placeholder textColor:(UIColor *)color;

@end

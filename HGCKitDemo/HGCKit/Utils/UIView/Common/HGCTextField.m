//
//  HGCTextField.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/8/26.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import "HGCTextField.h"


///////////////////////////////////////////////////////////////////////////////////////////


@interface HGCTextField ()

@end

@implementation HGCTextField


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Private Init

- (instancetype)initWithPlaceHolder:(NSString *)placeHolder
                   placeHolderColor:(UIColor *)placeHolderColor
                           delegate:(id<UITextFieldDelegate>)aDelegate
                               font:(UIFont *)font
                          textColor:(UIColor *)textColor
                        secureEntry:(BOOL)isSecure
{
    self = [super init];
    if (self) {
        if (placeHolderColor) {
            self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:(placeHolder ?: @"") attributes:@{NSForegroundColorAttributeName : placeHolderColor}];
        }
        else {
            self.placeholder = placeHolder;
        }
        self.delegate = aDelegate;
        self.font = font;
        self.textColor = textColor;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.secureTextEntry = isSecure;
        self.autocorrectionType = UITextAutocorrectionTypeNo;
        self.autocapitalizationType = UITextAutocapitalizationTypeNone;
    }
    return self;
}

#pragma mark - Init

+ (instancetype)textFieldWithPlaceHolder:(NSString *)placeHolder
                                delegate:(id<UITextFieldDelegate>)aDelegate
                                fontSize:(CGFloat)fontSize
                                fontType:(HGCFontType)fontType
                               textColor:(UIColor *)color
{
    return [HGCTextField textFieldWithPlaceHolder:placeHolder
                                 placeHolderColor:nil
                                         delegate:aDelegate
                                         fontSize:fontSize
                                         fontType:fontType
                                        textColor:color];
}

+ (instancetype)textFieldWithPlaceHolder:(NSString *)placeHolder
                        placeHolderColor:(UIColor *)placeHolderColor
                                delegate:(id<UITextFieldDelegate>)aDelegate
                                fontSize:(CGFloat)fontSize
                                fontType:(HGCFontType)fontType
                               textColor:(UIColor *)color
{
    UIFont *font = [HGCFontFactory fontWithType:fontType size:fontSize];
    return [[HGCTextField alloc] initWithPlaceHolder:placeHolder
                                    placeHolderColor:placeHolderColor
                                            delegate:aDelegate
                                                font:font
                                           textColor:color
                                         secureEntry:NO];
}

+ (instancetype)securyTextFieldWithPlaceHolder:(NSString *)placeHolder
                                      delegate:(id<UITextFieldDelegate>)aDelegate
                                      fontSize:(CGFloat)fontSize
                                      fontType:(HGCFontType)fontType
                                     textColor:(UIColor *)color
{
    return [HGCTextField securyTextFieldWithPlaceHolder:placeHolder
                                       placeHolderColor:nil
                                               delegate:aDelegate
                                               fontSize:fontSize
                                               fontType:fontType
                                              textColor:color];
}

+ (instancetype)securyTextFieldWithPlaceHolder:(NSString *)placeHolder
                              placeHolderColor:(UIColor *)placeHolderColor
                                      delegate:(id<UITextFieldDelegate>)aDelegate
                                      fontSize:(CGFloat)fontSize
                                      fontType:(HGCFontType)fontType
                                     textColor:(UIColor *)color
{
    
    UIFont *font = [HGCFontFactory fontWithType:fontType size:fontSize];
    return [[HGCTextField alloc] initWithPlaceHolder:placeHolder
                                    placeHolderColor:placeHolderColor
                                            delegate:aDelegate
                                                font:font
                                           textColor:color
                                         secureEntry:YES];
}

- (void)setPlaceholder:(NSString *)placeholder textColor:(UIColor *)color {
    if (color) {
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:(placeholder ?: @"") attributes:@{NSForegroundColorAttributeName : color}];
    }
    else {
        self.placeholder = placeholder;
    }
}

@end

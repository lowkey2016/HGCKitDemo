//
//  HGCLabel.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/8/25.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HGCFontFactory.h"

@interface HGCLabel : UILabel

/** 1.1.0 */

+ (instancetype)leftAlignRegularLabelWithText:(NSString *)text
                                    textColor:(UIColor *)color
                                     fontSize:(CGFloat)fontSize;
+ (instancetype)leftAlignBoldLabelWithText:(NSString *)text
                                 textColor:(UIColor *)color
                                  fontSize:(CGFloat)fontSize;
+ (instancetype)leftAlignLightLabelWithText:(NSString *)text
                                  textColor:(UIColor *)color
                                   fontSize:(CGFloat)fontSize;

+ (instancetype)centerAlignRegularLabelWithText:(NSString *)text
                                      textColor:(UIColor *)color
                                       fontSize:(CGFloat)fontSize;
+ (instancetype)centerAlignBoldLabelWithText:(NSString *)text
                                   textColor:(UIColor *)color
                                    fontSize:(CGFloat)fontSize;
+ (instancetype)centerAlignLightLabelWithText:(NSString *)text
                                    textColor:(UIColor *)color
                                     fontSize:(CGFloat)fontSize;

+ (instancetype)rightAlignRegularLabelWithText:(NSString *)text
                                     textColor:(UIColor *)color
                                      fontSize:(CGFloat)fontSize;
+ (instancetype)rightAlignBoldLabelWithText:(NSString *)text
                                  textColor:(UIColor *)color
                                   fontSize:(CGFloat)fontSize;
+ (instancetype)rightAlignLightLabelWithText:(NSString *)text
                                   textColor:(UIColor *)color
                                    fontSize:(CGFloat)fontSize;

/** 1.0.0 */

- (instancetype)initWithTextColor:(UIColor *)color
                         fontSize:(CGFloat)fontSize
                       isBoldFont:(BOOL)isBold
                    textAlignment:(NSTextAlignment)alignment;

- (instancetype)initWithText:(NSString *)text
                   textColor:(UIColor *)color
                    fontSize:(CGFloat)fontSize
                    fontType:(HGCFontType)fontType
               textAlignment:(NSTextAlignment)alignment;

@end

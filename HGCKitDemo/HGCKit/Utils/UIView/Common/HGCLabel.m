//
//  HGCLabel.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/8/25.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import "HGCLabel.h"


///////////////////////////////////////////////////////////////////////////////////////////


@interface HGCLabel ()

@end

@implementation HGCLabel


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Init

/** 1.1.0 */

+ (instancetype)leftAlignRegularLabelWithText:(NSString *)text
                                    textColor:(UIColor *)color
                                     fontSize:(CGFloat)fontSize
{
    return [[HGCLabel alloc] initWithText:text textColor:color fontSize:fontSize fontType:HGCFontTypeRegular textAlignment:NSTextAlignmentLeft];
}

+ (instancetype)leftAlignBoldLabelWithText:(NSString *)text
                                 textColor:(UIColor *)color
                                  fontSize:(CGFloat)fontSize
{
    return [[HGCLabel alloc] initWithText:text textColor:color fontSize:fontSize fontType:HGCFontTypeBold textAlignment:NSTextAlignmentLeft];
}

+ (instancetype)leftAlignLightLabelWithText:(NSString *)text
                                  textColor:(UIColor *)color
                                   fontSize:(CGFloat)fontSize
{
    return [[HGCLabel alloc] initWithText:text textColor:color fontSize:fontSize fontType:HGCFontTypeLight textAlignment:NSTextAlignmentLeft];
}

+ (instancetype)centerAlignRegularLabelWithText:(NSString *)text
                                      textColor:(UIColor *)color
                                       fontSize:(CGFloat)fontSize
{
    return [[HGCLabel alloc] initWithText:text textColor:color fontSize:fontSize fontType:HGCFontTypeRegular textAlignment:NSTextAlignmentCenter];
}

+ (instancetype)centerAlignBoldLabelWithText:(NSString *)text
                                   textColor:(UIColor *)color
                                    fontSize:(CGFloat)fontSize
{
    return [[HGCLabel alloc] initWithText:text textColor:color fontSize:fontSize fontType:HGCFontTypeBold textAlignment:NSTextAlignmentCenter];
}

+ (instancetype)centerAlignLightLabelWithText:(NSString *)text
                                    textColor:(UIColor *)color
                                     fontSize:(CGFloat)fontSize
{
    return [[HGCLabel alloc] initWithText:text textColor:color fontSize:fontSize fontType:HGCFontTypeLight textAlignment:NSTextAlignmentCenter];
}

+ (instancetype)rightAlignRegularLabelWithText:(NSString *)text
                                     textColor:(UIColor *)color
                                      fontSize:(CGFloat)fontSize
{
    return [[HGCLabel alloc] initWithText:text textColor:color fontSize:fontSize fontType:HGCFontTypeRegular textAlignment:NSTextAlignmentRight];
}

+ (instancetype)rightAlignBoldLabelWithText:(NSString *)text
                                  textColor:(UIColor *)color
                                   fontSize:(CGFloat)fontSize
{
    return [[HGCLabel alloc] initWithText:text textColor:color fontSize:fontSize fontType:HGCFontTypeBold textAlignment:NSTextAlignmentRight];
}

+ (instancetype)rightAlignLightLabelWithText:(NSString *)text
                                   textColor:(UIColor *)color
                                    fontSize:(CGFloat)fontSize
{
    return [[HGCLabel alloc] initWithText:text textColor:color fontSize:fontSize fontType:HGCFontTypeLight textAlignment:NSTextAlignmentRight];
}

/** 1.0.0 */

- (instancetype)initWithTextColor:(UIColor *)color
                         fontSize:(CGFloat)fontSize
                       isBoldFont:(BOOL)isBold
                    textAlignment:(NSTextAlignment)alignment
{
    self = [super init];
    if (self) {
        self.textColor = color;
        if (isBold) {
            self.font = [UIFont boldSystemFontOfSize:fontSize];
        }
        else {
            self.font = [UIFont systemFontOfSize:fontSize];
        }
        self.textAlignment = alignment;
    }
    return self;
}

- (instancetype)initWithText:(NSString *)text
                   textColor:(UIColor *)color
                    fontSize:(CGFloat)fontSize
                    fontType:(HGCFontType)fontType
               textAlignment:(NSTextAlignment)alignment
{
    self = [super init];
    if (self) {
        self.text = text;
        self.textColor = color;
        self.font = [HGCFontFactory fontWithType:fontType size:fontSize];
        self.textAlignment = alignment;
    }
    return self;
}

@end

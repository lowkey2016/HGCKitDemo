//
//  HGCFontFactory.m
//  label
//
//  Created by Jymn_Chen on 16/3/11.
//  Copyright © 2016年 com.jymnchen. All rights reserved.
//

#import "HGCFontFactory.h"

//static NSString * const kHGCSystemFontFamilyName_iOS_7_8 = @".Helvetica Neue Interface";
//static NSString * const kHGCSystemFontFamilyName_iOS_9 = @".SF UI Text";

@implementation HGCFontFactory

+ (UIFont *)fontWithType:(HGCFontType)type size:(CGFloat)size {
    UIFontDescriptor *fontDesc;
    switch (type) {
        case HGCFontTypeLight: {
            fontDesc = [self lightFontDescriptor];
            break;
        }
        case HGCFontTypeRegular: {
            fontDesc = [self regularFontDescriptor];
            break;
        }
        case HGCFontTypeBold: {
            fontDesc = [self boldFontDescriptor];
            break;
        }
    }
    
    UIFont *font = [UIFont fontWithDescriptor:fontDesc size:size];
    if (font == nil) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFontDescriptor *)lightFontDescriptor {
    static UIFontDescriptor *_sharedLightFontDesc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIFont *font = [UIFont systemFontOfSize:10];
        NSString *fontFamilyName = [font.familyName stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSString *lightFontName = [fontFamilyName stringByAppendingString:@"-Light"];
        font = [UIFont fontWithName:lightFontName size:2] ?: [UIFont systemFontOfSize:2];
        _sharedLightFontDesc = font.fontDescriptor;
    });
    return _sharedLightFontDesc;
}

+ (UIFontDescriptor *)regularFontDescriptor {
    static UIFontDescriptor *_sharedRegularFontDesc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIFont *font = [UIFont systemFontOfSize:2];
        _sharedRegularFontDesc = font.fontDescriptor;
    });
    return _sharedRegularFontDesc;
}

+ (UIFontDescriptor *)boldFontDescriptor {
    static UIFontDescriptor *_sharedBoldFontDesc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIFont *font = [UIFont boldSystemFontOfSize:2];
        _sharedBoldFontDesc = font.fontDescriptor;
    });
    return _sharedBoldFontDesc;
}

@end

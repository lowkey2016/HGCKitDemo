//
//  UIColor+HGCUtil.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/7/24.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HGCRGBHexColor(rgb)                [UIColor hgc_colorWithRGBHexValue:rgb alpha:1.0f]
#define HGCRGBHexAlphaColor(rgb, aph)      [UIColor hgc_colorWithRGBHexValue:rgb alpha:(CGFloat)aph]

#define HGC_UITextFieldPlaceHolderTextColor     HGCRGBHexColor(0xC7C7CD)
#define HGC_UISystemTintColor                   HGCRGBHexColor(0x007AFF)
#define HGC_UITableViewCellSeparatorLineColor   HGCRGBHexColor(0xE4E4E4)

@interface UIColor (HGCUtil)

+ (UIColor *)hgc_colorWithRGBHexValue:(NSInteger)rgb alpha:(CGFloat)alpha;

+ (UIImage *)hgc_imageWithColor:(UIColor *)color;

@end

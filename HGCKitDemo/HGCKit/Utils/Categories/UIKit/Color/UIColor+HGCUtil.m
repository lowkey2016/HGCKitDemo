//
//  UIColor+HGCUtil.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/7/24.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import "UIColor+HGCUtil.h"

@implementation UIColor (HGCUtil)

+ (UIColor *)hgc_colorWithRGBHexValue:(NSInteger)rgb alpha:(CGFloat)alpha {
    if (rgb > 0xffffff || rgb < 0x0) {
        return [UIColor clearColor];
    }
    
    NSInteger r = rgb & 0xff0000;
    r >>= 16;
    NSInteger g = rgb & 0x00ff00;
    g >>= 8;
    NSInteger b = rgb & 0x0000ff;
    
    return [UIColor colorWithRed:(r / 255.0f) green:(g / 255.0f) blue:(b / 255.0f) alpha:alpha];
}

+ (UIImage *)hgc_imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end

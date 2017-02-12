//
//  UIImage+SCTBlurEffects.h
//  BlurDemo
//
//  Created by Jymn_Chen on 15/8/13.
//  Copyright (c) 2015年 Steinlogic Consulting and Training Pte Ltd. All rights reserved.
//

@import UIKit;

/**
 *  Example:
 *
 *  UIImage *image;
 *  image = [image sct_applyBlurWithRadius:50.0f tintColor:[UIColor colorWithRed:0 green:1 blue:0 alpha:0.1]  saturationDeltaFactor:2.0f maskImage:nil];
 */

@interface UIImage (SCTBlurEffects)

- (UIImage *)sct_applyLightEffect;
- (UIImage *)sct_applyExtraLightEffect;
- (UIImage *)sct_applyDarkEffect;
- (UIImage *)sct_applyTintEffectWithColor:(UIColor *)tintColor;

- (UIImage *)sct_applyBlurWithRadius:(CGFloat)blurRadius
                           tintColor:(UIColor *)tintColor
               saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                           maskImage:(UIImage *)maskImage;

- (UIImage *)hgc_boxBlurImageWithBlur:(CGFloat)blur;

@end

//
//  UINavigationBar+LTOverlay.h
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/7/26.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (LTOverlay)

- (void)lt_setBackgroundColor:(UIColor *)backgroundColor;
- (void)lt_setElementsAlpha:(CGFloat)alpha;
- (void)lt_setTranslationY:(CGFloat)translationY;
- (void)lt_reset;

@end

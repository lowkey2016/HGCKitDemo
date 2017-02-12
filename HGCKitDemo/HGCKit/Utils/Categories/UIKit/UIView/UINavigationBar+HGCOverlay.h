//
//  UINavigationBar+HGCOverlay.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/8/18.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (HGCOverlay)

- (void)hgc_setBackgroundColors:(NSArray *)colors;
- (void)hgc_setAlpha:(CGFloat)alpha;
- (void)hgc_reset;

@end

//
//  HGCGradientNavigationBar.h
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/1/28.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HGCGradientNavigationBar : UINavigationBar

- (void)setBarTintGradientColors:(NSArray *)barTintGradientColors;

- (void)showGradientLayer;
- (void)hideGradientLayer;

@end

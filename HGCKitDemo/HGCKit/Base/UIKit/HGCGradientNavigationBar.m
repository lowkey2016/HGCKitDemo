//
//  HGCGradientNavigationBar.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/1/28.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "HGCGradientNavigationBar.h"
#import <QuartzCore/QuartzCore.h>

@interface HGCGradientNavigationBar ()

@property (nonatomic, copy) NSArray *gradientColors;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation HGCGradientNavigationBar

//static CGFloat const kDefaultOpacity = 0.5f;

- (void)setBarTintGradientColors:(NSArray *)barTintGradientColors {
//    if (HGC_SYSTEM_VERSION_LESS_THAN(@"8.0")) {
//        // http://stackoverflow.com/questions/18883301/ios-7-disable-uinavigationbar-translucency-for-entire-app
//        [self setTranslucent:NO];
//    }
    
    self.gradientColors = barTintGradientColors;
    
    // create the gradient layer
    if (self.gradientLayer == nil) {
        self.gradientLayer = [CAGradientLayer layer];
        self.gradientLayer.opacity = 1.0f;
    }
    
    NSMutableArray * colors = nil;
    if (barTintGradientColors) {
        colors = [NSMutableArray arrayWithCapacity:[barTintGradientColors count]];
        
        [barTintGradientColors enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([obj isKindOfClass:[UIColor class]]) {
                [colors addObject:(id)[obj CGColor]];
            }
            else if (CFGetTypeID((__bridge void *)obj) == CGColorGetTypeID()) {
                [colors addObject:obj];
            }
            else {
                @throw [NSException exceptionWithName:@"BarTintGraidentColorsError" reason:@"object in barTintGradientColors array is not a UIColor or CGColorRef" userInfo:nil];
            }
        }];
        
        if ( [self respondsToSelector:@selector(setBarTintColor:)] ) {
            // iOS 7
            self.barTintColor = [UIColor clearColor];
        }
        else {
            // iOS 6
            self.tintColor = [UIColor clearColor];
            // stops the gradient on iOS 6 UINavigationBar
            [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        }
    }
    
    self.gradientLayer.colors = colors;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.gradientLayer) {
        [self.gradientLayer removeFromSuperlayer];
        
        if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
            // iOS 7
            CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
            self.gradientLayer.frame = CGRectMake(0, 0 - statusBarHeight, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + statusBarHeight);
        }
        else {
            // iOS 6
            self.gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        }
        
        // make sure the graident layer is at position 1
        [self.layer insertSublayer:self.gradientLayer atIndex:1];
    }
}

- (void)showGradientLayer {
    _gradientLayer.hidden = NO;
}

- (void)hideGradientLayer {
    _gradientLayer.hidden = YES;
}

@end

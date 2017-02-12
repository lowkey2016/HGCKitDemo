//
//  UINavigationBar+HGCOverlay.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/8/18.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import "UINavigationBar+HGCOverlay.h"
#import <objc/runtime.h>

@implementation UINavigationBar (HGCOverlay)


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Accessors

- (UIView *)overlay {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setOverlay:(UIView *)overlay {
    objc_setAssociatedObject(self, @selector(overlay), overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CAGradientLayer *)layerOfOverlay {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLayerOfOverlay:(CAGradientLayer *)layer {
    objc_setAssociatedObject(self, @selector(layerOfOverlay), layer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setupOverlayAndGradientLayer {
    if (self.overlay == nil || self.layerOfOverlay == nil) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, CGRectGetHeight(self.bounds) + 20)];
        self.overlay.userInteractionEnabled = NO;
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.overlay.backgroundColor = [UIColor clearColor];
        self.overlay.opaque = NO;
        self.overlay.layer.masksToBounds = YES;
        [self insertSubview:self.overlay atIndex:0];
        
        self.layerOfOverlay = [CAGradientLayer layer];
        self.layerOfOverlay.opacity = 1.0f;
        self.layerOfOverlay.frame = self.overlay.bounds;
        self.layerOfOverlay.startPoint = CGPointMake(0, 0);
        self.layerOfOverlay.endPoint = CGPointMake(0, 1);
        [self.overlay.layer insertSublayer:self.layerOfOverlay atIndex:0];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Public Methods

- (void)hgc_setBackgroundColors:(NSArray *)colors {
    [self setupOverlayAndGradientLayer];
    if (colors == nil) {
        self.overlay.hidden = YES;
        
        return;
    }
    self.overlay.hidden = NO;
    
    NSMutableArray *tmpColors = [NSMutableArray arrayWithCapacity:[colors count]];
    [colors enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UIColor class]]) {
            [tmpColors addObject:(id)[obj CGColor]];
        }
        else if (CFGetTypeID((__bridge void *)obj) == CGColorGetTypeID()) {
            [tmpColors addObject:obj];
        }
        else {
            @throw [NSException exceptionWithName:@"GraidentColorsError" reason:@"object in GradientColors array is not a UIColor or CGColorRef" userInfo:nil];
        }
    }];
    
    self.layerOfOverlay.colors = [tmpColors copy];
}

- (void)hgc_setAlpha:(CGFloat)alpha {
    [self setupOverlayAndGradientLayer];
    
    self.overlay.alpha = alpha;
}

- (void)hgc_reset {
//    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];    
    [self.overlay removeFromSuperview];
    self.overlay = nil;
    self.layerOfOverlay = nil;
}

@end

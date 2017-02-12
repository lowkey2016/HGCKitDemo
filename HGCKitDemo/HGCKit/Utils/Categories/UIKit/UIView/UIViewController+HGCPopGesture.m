//
//  UIViewController+HGCPopGesture.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/9/20.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "UIViewController+HGCPopGesture.h"
#import <objc/runtime.h>

typedef void (^_HGCViewControllerWillAppearInjectBlock)(UIViewController *viewController, BOOL animated);


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - _HGCPopGestureRecognizerDelegate

@interface _HGCPopGestureRecognizerDelegate : NSObject <UIGestureRecognizerDelegate>

@property (nonatomic, weak) UINavigationController *navigationController;

@end

@implementation _HGCPopGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    // Ignore when no view controller is pushed into the navigation stack.
    if (self.navigationController.viewControllers.count <= 1) {
        return NO;
    }
    
    // Disable when the active view controller doesn't allow interactive pop.
    UIViewController *topViewController = self.navigationController.viewControllers.lastObject;
    if (topViewController.hgc_interactivePopDisabled) {
        return NO;
    }
    
    // Ignore pan gesture when the navigation controller is currently in transition.
    if ([[self.navigationController valueForKey:@"_isTransitioning"] boolValue]) {
        return NO;
    }
    
    return YES;
}

@end


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - UIViewController + HGCPopGesturePrivate

@interface UIViewController (HGCPopGesturePrivate)

@property (nonatomic, copy) _HGCViewControllerWillAppearInjectBlock hgc_willAppearInjectBlock;

@end

@implementation UIViewController (HGCPopGesturePrivate)

+ (void)load {
    Method originalMethod = class_getInstanceMethod(self, @selector(viewWillAppear:));
    Method swizzledMethod = class_getInstanceMethod(self, @selector(hgc_viewWillAppear:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

- (void)hgc_viewWillAppear:(BOOL)animated {
    // Forward to primary implementation.
    [self hgc_viewWillAppear:animated];
    
    if (self.hgc_willAppearInjectBlock) {
        self.hgc_willAppearInjectBlock(self, animated);
    }
}

- (_HGCViewControllerWillAppearInjectBlock)hgc_willAppearInjectBlock {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setHgc_willAppearInjectBlock:(_HGCViewControllerWillAppearInjectBlock)block {
    objc_setAssociatedObject(self, @selector(hgc_willAppearInjectBlock), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - UINavigationController + HGCPopGesture

@interface UINavigationController (HGCPopGesture)

@end

@implementation UINavigationController (HGCPopGesture)

+ (void)load {
    // Inject "-pushViewController:animated:"
    Method originalMethod = class_getInstanceMethod(self, @selector(pushViewController:animated:));
    Method swizzledMethod = class_getInstanceMethod(self, @selector(hgc_pushViewController:animated:));
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

- (void)hgc_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    self.interactivePopGestureRecognizer.delegate = self.hgc_popGestureRecognizerDelegate;
    self.interactivePopGestureRecognizer.enabled = YES;
    
    // Handle perferred navigation bar appearance.
    [self hgc_setupViewControllerBasedNavigationBarAppearanceIfNeeded:viewController];
    
    // Forward to primary implementation.
    [self hgc_pushViewController:viewController animated:animated];
}

- (void)hgc_setupViewControllerBasedNavigationBarAppearanceIfNeeded:(UIViewController *)appearingViewController
{
    __weak typeof(self) weakSelf = self;
    _HGCViewControllerWillAppearInjectBlock block = ^(UIViewController *viewController, BOOL animated) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf) {
            [strongSelf setNavigationBarHidden:viewController.hgc_prefersNavigationBarHidden animated:animated];
        }
    };
    
    // Setup will appear inject block to appearing view controller.
    // Setup disappearing view controller as well, because not every view controller is added into
    // stack by pushing, maybe by "-setViewControllers:".
    appearingViewController.hgc_willAppearInjectBlock = block;
    UIViewController *disappearingViewController = self.viewControllers.lastObject;
    if (disappearingViewController && !disappearingViewController.hgc_willAppearInjectBlock) {
        disappearingViewController.hgc_willAppearInjectBlock = block;
    }
}

- (_HGCPopGestureRecognizerDelegate *)hgc_popGestureRecognizerDelegate {
    _HGCPopGestureRecognizerDelegate *delegate = objc_getAssociatedObject(self, _cmd);
    
    if (!delegate) {
        delegate = [[_HGCPopGestureRecognizerDelegate alloc] init];
        delegate.navigationController = self;
        
        objc_setAssociatedObject(self, _cmd, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return delegate;
}

@end


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - UIViewController + HGCPopGesture

@implementation UIViewController (HGCPopGesture)

- (BOOL)hgc_interactivePopDisabled {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setHgc_interactivePopDisabled:(BOOL)disabled {
    objc_setAssociatedObject(self, @selector(hgc_interactivePopDisabled), @(disabled), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)hgc_prefersNavigationBarHidden {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setHgc_prefersNavigationBarHidden:(BOOL)hidden {
    objc_setAssociatedObject(self, @selector(hgc_prefersNavigationBarHidden), @(hidden), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

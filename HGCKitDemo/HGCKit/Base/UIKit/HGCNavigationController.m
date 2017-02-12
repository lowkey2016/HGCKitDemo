//
//  HGCNavigationController.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/1/28.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "HGCNavigationController.h"

@interface HGCNavigationController () <UINavigationControllerDelegate>

@end

@implementation HGCNavigationController

#pragma mark - Init

- (instancetype)init {
    return [self initWithRootViewController:nil navigationBarClass:nil toolBarClass:nil];
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    return [self initWithRootViewController:rootViewController navigationBarClass:[UINavigationBar class] toolBarClass:nil];
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
                        navigationBarClass:(Class)naviBarClass
                              toolBarClass:(Class)toolBarClass
{
    self = [super initWithNavigationBarClass:naviBarClass toolbarClass:toolBarClass];
    if (self) {
        self.viewControllers = @[rootViewController];
        self.delegate = self;
        self.navigationBar.translucent = NO; // 防止色差
    }
    return self;
}

#pragma mark - Memory

- (void)dealloc {
    self.delegate = nil;
}

#pragma mark - StatusBar

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - Rotate

- (BOOL)shouldAutorotate {
    return self.topViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.topViewController.supportedInterfaceOrientations;
}

#pragma mark - Override Methods

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
    
    self.navigationBar.userInteractionEnabled = NO;
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    self.navigationBar.userInteractionEnabled = YES;
}

@end

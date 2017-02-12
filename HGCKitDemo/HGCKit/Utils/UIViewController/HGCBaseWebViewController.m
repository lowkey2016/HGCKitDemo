//
//  HGCBaseWebViewController.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/12/9.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "HGCBaseWebViewController.h"
#import "HGCConstants.h"
#import "NSString+HGCCategory.h"
#import "UIColor+HGCUtil.h"

#import "HGCNavigationTitleView.h"


///////////////////////////////////////////////////////////////////////////////////////////


@interface HGCBaseWebViewController ()

@end

@implementation HGCBaseWebViewController


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - View

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupBaseWebViewController];
}

- (void)setupBaseWebViewController {
    [self base_setupData];
    [self base_setupNavigationItems];
    [self base_setupMainView];
}

- (void)base_setupData {
    
}

- (void)base_setupNavigationItems {
    self.title = @"";
    self.titleView = [[HGCNavigationTitleView alloc] initWithFrame:CGRectMake(0, 0, HGCScreenWidth - 100, 36) title:_webTitle textColor:nil font:nil logo:nil];
    self.navigationItem.titleView = self.titleView;
    
    self.leftItemType = HGCBaseLeftItemTypePop;
}

- (void)base_setupMainView {
    self.view.backgroundColor = HGCRGBHexColor(0xE3E4E8);
    
    NSString *encodedURLString = [_loadingURL.absoluteString hgc_urlLeaveEncodeString];
    self.loadingURL = [NSURL URLWithString:encodedURLString];
    
    if (HGC_USE_WKWEBVIEW) {
        self.baseWKWebView = [[HGCWKWebView alloc] initWithDefaultSettings];
        _baseWKWebView.backgroundColor = HGCRGBHexColor(0xE3E4E8);
        [self.view addSubview:_baseWKWebView];
        [_baseWKWebView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        
        _baseUIWebView = nil;
    }
    else {
        self.baseUIWebView = [[HGCWebView alloc] initWithDefaultSettings];
        _baseUIWebView.backgroundColor = HGCRGBHexColor(0xE3E4E8);
        [self.view addSubview:_baseUIWebView];
        [_baseUIWebView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        
        _baseWKWebView = nil;
    }
}

#pragma mark - iVars Accessors

- (void)setCustomUAObject:(NSString *)customUAObject {
    if (_customUAObject != customUAObject) {
        _customUAObject = [customUAObject copy];
        if (_baseWKWebView) {
            [_baseWKWebView setUserAgentAndWriteObject:_customUAObject];
        }
        else if (_baseUIWebView) {
            [_baseUIWebView setUserAgentAndWriteObject:_customUAObject];
        }
    }
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Memory

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    if (_baseWKWebView) {
        [_baseWKWebView destroyInstance];
        _baseWKWebView = nil;
    }
    if (_baseUIWebView) {
        [_baseUIWebView destroyInstance];
        _baseUIWebView = nil;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Style

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

#pragma mark - Rotate

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return (UIInterfaceOrientationMaskPortrait);
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Public Methods

- (void)setWebViewBounces:(BOOL)bounces supportBackForwardNavigationGestures:(BOOL)supportGestures {
    if (_baseWKWebView) {
        [_baseWKWebView setScrollViewBounces:bounces];
        [_baseWKWebView setSupportBackForwardNavigationGestures:supportGestures];
    }
    else if (_baseUIWebView) {
        [_baseUIWebView setScrollViewBounces:bounces];
        [_baseUIWebView setSupportBackForwardNavigationGestures:supportGestures];
    }
}

- (UIScrollView *)scrollViewInWebView {
    if (_baseWKWebView) {
        return _baseWKWebView.scrollView;
    }
    else if (_baseUIWebView) {
        return _baseUIWebView.scrollView;
    }
    
    return nil;
}

- (BOOL)isWebViewLoading {
    if (_baseWKWebView) {
        return [_baseWKWebView isLoading];
    }
    else if (_baseUIWebView) {
        return [_baseUIWebView isLoading];
    }
    
    return NO;
}

- (void)loadOriginRequest {
    NSURLRequest *request = [NSURLRequest requestWithURL:_loadingURL cachePolicy:_cachePolicy timeoutInterval:HGCWebViewRequestTimeoutInterval];
    if (_baseWKWebView) {
        [_baseWKWebView loadRequest:request];
    }
    else if (_baseUIWebView) {
        [_baseUIWebView loadRequest:request];
    }
}

- (void)reloadOriginRequest {
    [self loadOriginRequest];
}

- (void)destroyWebViewManaully {
    if (_baseWKWebView) {
        [_baseWKWebView destroyInstance];
        _baseWKWebView = nil;
    }
    if (_baseUIWebView) {
        [_baseUIWebView destroyInstance];
        _baseUIWebView = nil;
    }
}

@end

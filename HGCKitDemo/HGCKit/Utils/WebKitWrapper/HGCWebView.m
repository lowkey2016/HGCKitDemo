//
//  HGCWebView.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/9/7.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import "HGCWebView.h"
#import "YMUNetworkToolKit.h"


///////////////////////////////////////////////////////////////////////////////////////////


@interface HGCWebView () <UIWebViewDelegate>

@property (nonatomic, strong) UILongPressGestureRecognizer *longPressGesture;
@property (nonatomic, assign) BOOL canPerformAction;

@end

@implementation HGCWebView


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Init

- (instancetype)initWithDefaultSettings {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.scalesPageToFit = YES;
        self.dataDetectorTypes = UIDataDetectorTypeNone;
        self.clipsToBounds = YES;
        self.scrollView.bounces = NO;
        self.scrollView.scrollEnabled = YES;
        CGFloat zoomScale = 1.0f;
        self.scrollView.minimumZoomScale = zoomScale;
        self.scrollView.maximumZoomScale = zoomScale;
        self.scrollView.bouncesZoom = NO;
        self.delegate = self;
        
        _canPerformAction = YES;
    }
    return self;
}

- (void)dealloc {
    
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - UA and Window Object

- (void)setUserAgentAndWriteObject:(NSString *)customObject {
    [YMUNetworkToolKit setUserAgentAppendix:customObject];
    NSLog(@"[INFO] User Agent = %@", [YMUNetworkToolKit getUserAgent]);
    
    NSString *js = [NSString stringWithFormat:@"window.%@ = {}", customObject];
    [self stringByEvaluatingJavaScriptFromString:js];
}

#pragma mark - Disable Selection

- (void)disableUserSelectionAndCallout {
    // [self stringByEvaluatingJavaScriptFromString:@"window.getSelection().removeAllRanges();"];
    
    // Disable user selection
    [self stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitUserSelect='none';"];
    // Disable callout
    [self stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout='none';"];
    
    // disable long press callout
    if (_longPressGesture == nil) {
        self.longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:nil action:NULL];
        _longPressGesture.minimumPressDuration = 0.2;
        [self addGestureRecognizer:_longPressGesture];
    }
    
    self.canPerformAction = NO;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return _canPerformAction;
}

#pragma mark - Attributes

- (void)setScrollViewBounces:(BOOL)bounces {
    self.scrollView.bounces = bounces;
}

- (void)setSupportBackForwardNavigationGestures:(BOOL)support {
    
}

#pragma mark - Destroy

- (void)destroyInstance {
    [self loadHTMLString:@"ok" baseURL:nil];
    self.delegate = nil;
    self.hgcDelegate = nil;
    [self removeGestureRecognizer:_longPressGesture];
    _longPressGesture = nil;
    [self removeFromSuperview];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"[INFO] HGCWebView should start load, url = %@", request.URL);
    if (_hgcDelegate && [_hgcDelegate respondsToSelector:@selector(hgc_webView:shouldStartLoadWithRequest:navigationType:)]) {
        return [_hgcDelegate hgc_webView:self shouldStartLoadWithRequest:request navigationType:navigationType];
    }
    else {
        return YES;
    }
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"[INFO] HGCWebView did start load");
    if (_hgcDelegate && [_hgcDelegate respondsToSelector:@selector(hgc_webViewDidStartLoad:)]) {
        [_hgcDelegate hgc_webViewDidStartLoad:self];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"[INFO] HGCWebView did finish load");
    if (_hgcDelegate && [_hgcDelegate respondsToSelector:@selector(hgc_webViewDidFinishLoad:)]) {
        [_hgcDelegate hgc_webViewDidFinishLoad:self];
    }
    
    // 用于释放部分 UIWebView 占用的内存，实测没什么用
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"WebKitCacheModelPreferenceKey"];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"[ERROR] HGCWebView did fail load, error = %@", error);
    if (_hgcDelegate && [_hgcDelegate respondsToSelector:@selector(hgc_webView:didFailLoadWithError:)]) {
        [_hgcDelegate hgc_webView:self didFailLoadWithError:error];
    }
    
    // 用于释放部分 UIWebView 占用的内存，实测没什么用
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"WebKitCacheModelPreferenceKey"];
}

@end

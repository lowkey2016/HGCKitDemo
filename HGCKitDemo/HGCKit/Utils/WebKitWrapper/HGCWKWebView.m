//
//  HGCWKWebView.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/12/8.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "HGCWKWebView.h"

#ifdef HGC_WEBKIT_ENABLE

#import "HGCWKDelegatesAdaptor.h"
#import "YMUNetworkToolKit.h"


///////////////////////////////////////////////////////////////////////////////////////////


@interface HGCWKWebView ()

@property (nonatomic, strong) HGCWKDelegatesAdaptor *wkDelegateAdaptor;
@property (nonatomic, strong) UILongPressGestureRecognizer *longPressGesture;
@property (nonatomic, assign) BOOL canPerformAction;
@property (nonatomic, copy) NSDictionary<NSString *, id> *HTTPHeaders;
@property (nonatomic, strong) NSMutableArray<NSString *> *scriptMessageHandlerNames;

@end

@implementation HGCWKWebView


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Init

- (instancetype)initWithDefaultSettings {
    WKWebViewConfiguration *webConfig = [WKWebViewConfiguration new];
    
    WKUserContentController *userContentController = [WKUserContentController new];
    webConfig.userContentController = userContentController;
    
    if (HGC_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"9.0")) {
        WKWebsiteDataStore *store = [WKWebsiteDataStore defaultDataStore];
        webConfig.websiteDataStore = store;
    }
    
    self = [super initWithFrame:CGRectZero configuration:webConfig];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = YES;
        self.scrollView.bounces = NO;
        self.scrollView.scrollEnabled = YES;
        CGFloat zoomScale = 1.0f;
        self.scrollView.minimumZoomScale = zoomScale;
        self.scrollView.maximumZoomScale = zoomScale;
        self.scrollView.bouncesZoom = NO;
        
        _wkDelegateAdaptor = [HGCWKDelegatesAdaptor new];
        self.UIDelegate = _wkDelegateAdaptor;
        self.navigationDelegate = _wkDelegateAdaptor;
        self.allowsBackForwardNavigationGestures = NO;
        
        _canPerformAction = YES;
        
        _scriptMessageHandlerNames = [NSMutableArray arrayWithCapacity:0];
    }
    return self;
}

- (void)dealloc {
    _hgcDelegate = nil;
    _wkDelegateAdaptor = nil;
}

#pragma mark - Override Methods

- (WKNavigation *)loadRequest:(NSURLRequest *)request {
    if (request && _HTTPHeaders.count > 0) {
        NSMutableURLRequest *tmpRequest = request.mutableCopy;
        [_HTTPHeaders enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [tmpRequest setValue:obj forHTTPHeaderField:key];
        }];
        NSLog(@"[INFO] HTTP Headers = %@", tmpRequest.allHTTPHeaderFields);
        return [super loadRequest:tmpRequest.copy];
    }
    else {
        return [super loadRequest:request];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - UA and Window Object

// 关于 UIWebView/WKWebView UserAgent 的一些结论：
// 1. 如果 WKWebView 指定了 customUserAgent，那么 navigator.userAgent 读到的就是 Custom UA
// 2. 如果 WKWebView 没有指定 customUserAgent，那么 navigator.userAgent 读到的是全局的 UA，也就是 NSUserDefaults 中 @"UserAgent" 存储的值，貌似无法直接在磁盘文件中看到
// 3. UIWebView 用 navigator.userAgent 读到的 UA 是全局的 UA
// 4. 修改 NSUserDefaults 中的 @"UserAgent"，将影响到全局的 UA，此时 WKWebView（没有指定 customUserAgent） 和 UIWebView 读到的 UA 是一样的
- (void)setUserAgentAndWriteObject:(NSString *)customObject {
    [YMUNetworkToolKit setUserAgentAppendix:customObject];
    NSLog(@"[INFO] User Agent = %@", [YMUNetworkToolKit getUserAgent]);
    
    NSString *js = [NSString stringWithFormat:@"window.%@ = {}", customObject];
    [self evaluateJavaScript:js completionHandler:nil];
}

#pragma mark - HTTP Headers

- (void)setValue:(id)value forHTTPHeaderField:(nonnull NSString *)field {
    if (_HTTPHeaders == nil) {
        self.HTTPHeaders = @{};
    }
    
    NSMutableDictionary *headers = _HTTPHeaders.mutableCopy;
    headers[field] = value;
    self.HTTPHeaders = headers.copy;
}

#pragma mark - Disable Selection

- (void)disableUserSelectionAndCallout {
    // [self stringByEvaluatingJavaScriptFromString:@"window.getSelection().removeAllRanges();"];
    
    // Disable user selection
    [self evaluateJavaScript:@"document.documentElement.style.webkitUserSelect='none';" completionHandler:nil];
    // Disable callout
    [self evaluateJavaScript:@"document.documentElement.style.webkitTouchCallout='none';" completionHandler:nil];
    
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
    self.allowsBackForwardNavigationGestures = support;
}

#pragma mark - Destroy

- (void)destroyInstance {
    [self loadHTMLString:@"ok" baseURL:nil];
    
    self.navigationDelegate = nil;
    self.UIDelegate = nil;
    self.hgcDelegate = nil;
    self.wkDelegateAdaptor = nil;
    
    [self removeGestureRecognizer:_longPressGesture];
    _longPressGesture = nil;
    
    [self removeAllInjectedJavascripts];
    [_scriptMessageHandlerNames enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.configuration.userContentController removeScriptMessageHandlerForName:obj];
    }];
    [_scriptMessageHandlerNames removeAllObjects];
    
    [self removeFromSuperview];
}

#pragma mark - JS-OC

- (void)injectJavascript:(NSString *)js
                  atTime:(WKUserScriptInjectionTime)time
        forMainFrameOnly:(BOOL)forMainFrame
{
    if (js == nil || [[js stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        return;
    }
    
    WKUserScript *userScript = [[WKUserScript alloc] initWithSource:js injectionTime:time forMainFrameOnly:forMainFrame];
    [self.configuration.userContentController addUserScript:userScript];
}

- (void)removeAllInjectedJavascripts {
    [self.configuration.userContentController removeAllUserScripts];
}

- (void)addScriptMessageHandlerWithName:(NSString *)name callback:(HGCWKScriptMessageHandlerCallback)block
{
    if (name == nil || [[name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        return;
    }
    
    HGCWKScriptMessageHandler *handler = [HGCWKScriptMessageHandler new];
    handler.callbackBlock = block;
    [self.configuration.userContentController addScriptMessageHandler:handler name:name];
    [_scriptMessageHandlerNames addObject:name];
}

- (void)addScriptMessageHandler:(id<WKScriptMessageHandler>)scriptMessageHandler name:(NSString *)name {
    if (name == nil || [[name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        return;
    }
    if (scriptMessageHandler == nil) {
        return;
    }
    
    [self.configuration.userContentController addScriptMessageHandler:scriptMessageHandler name:name];
    [_scriptMessageHandlerNames addObject:name];
}

- (void)removeScriptMessageHandlerForName:(NSString *)name {
    if (name == nil || [[name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        return;
    }
    
    [self.configuration.userContentController removeScriptMessageHandlerForName:name];
    
    __block NSInteger indexToRemove = -1;
    [_scriptMessageHandlerNames enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqualToString:name]) {
            indexToRemove = idx;
            *stop = YES;
        }
    }];
    if (indexToRemove >= 0 && indexToRemove < _scriptMessageHandlerNames.count) {
        [_scriptMessageHandlerNames removeObjectAtIndex:indexToRemove];
    }
}

@end

#endif

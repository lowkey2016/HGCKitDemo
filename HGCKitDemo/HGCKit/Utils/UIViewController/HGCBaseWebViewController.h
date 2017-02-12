//
//  HGCBaseWebViewController.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/12/9.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "HGCBaseViewController.h"
#import "HGCWebKitWrapper.h"

#define HGC_USE_WKWEBVIEW HGC_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")

@interface HGCBaseWebViewController : HGCBaseViewController

@property (nonatomic, copy) NSString *webTitle;
@property (nonatomic, strong) NSURL *loadingURL;
@property (nonatomic, assign) NSURLRequestCachePolicy cachePolicy;
@property (nonatomic, copy) NSString *customUAObject;

#ifdef HGC_WEBKIT_ENABLE
@property (nonatomic, strong) HGCWKWebView *baseWKWebView;
#endif
@property (nonatomic, strong) HGCWebView *baseUIWebView;

- (void)setupBaseWebViewController;

- (void)setWebViewBounces:(BOOL)bounces supportBackForwardNavigationGestures:(BOOL)supportGestures;
- (UIScrollView *)scrollViewInWebView;
- (BOOL)isWebViewLoading;
- (void)loadOriginRequest;
- (void)reloadOriginRequest;
- (void)destroyWebViewManaully;

@end

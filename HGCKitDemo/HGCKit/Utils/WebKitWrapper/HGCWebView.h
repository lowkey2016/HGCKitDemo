//
//  HGCWebView.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/9/7.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HGCWebView;
@protocol HGCWebViewDelegate <NSObject>
@required
- (BOOL)hgc_webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
- (void)hgc_webViewDidStartLoad:(HGCWebView *)webView;
- (void)hgc_webViewDidFinishLoad:(HGCWebView *)webView;
- (void)hgc_webView:(HGCWebView *)webView didFailLoadWithError:(NSError *)error;
@end

@interface HGCWebView : UIWebView

#pragma mark - Init and Destroy

- (instancetype)initWithDefaultSettings;
- (void)setUserAgentAndWriteObject:(NSString *)customObject;
- (void)destroyInstance;

#pragma mark - WebView Attributes

- (void)disableUserSelectionAndCallout;
- (void)setScrollViewBounces:(BOOL)bounces; // default: NO
- (void)setSupportBackForwardNavigationGestures:(BOOL)support; // unimplemented

#pragma mark - Delegate

@property (nonatomic, weak) id<HGCWebViewDelegate> hgcDelegate;

@end

//
//  HGCWKWebViewDelegate.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/12/8.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "HGCWKCommon.h"

#ifdef HGC_WEBKIT_ENABLE

NS_ASSUME_NONNULL_BEGIN

@class HGCWKWebView;

@protocol HGCWKWebViewDelegate <NSObject>

@optional

/** WKNavigationDelegate */
- (WKNavigationActionPolicy)hgc_decisionPolicyForNavigationAction:(WKNavigationAction *)navigationAction;
- (void)hgc_wkWebViewDidStartProvisionalNavigation:(WKNavigation *)navigation;
- (void)hgc_wkWebViewDidCommitNavigation:(WKNavigation *)navigation;
- (void)hgc_wkWebViewDidReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation;
- (WKNavigationResponsePolicy)hgc_decisionPolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse;
- (void)hgc_wkWebViewDidFinishNavigation:(WKNavigation *)navigation;
- (void)hgc_wkWebViewDidFailProvisionalNavigation:(WKNavigation *)navigation error:(NSError *)error;

/** WKUIDelegate */
- (nullable HGCWKWebView *)hgc_createWebViewWithConfiguration:(WKWebViewConfiguration *)config forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures;
- (void)hgc_wkWebViewDidClose;
- (void)hgc_wkWebViewRunJSAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler;
- (void)hgc_wkWebViewRunJSConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler;
- (void)hgc_wkWebViewRunJSTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * __nullable result))completionHandler;

@end

NS_ASSUME_NONNULL_END

#endif

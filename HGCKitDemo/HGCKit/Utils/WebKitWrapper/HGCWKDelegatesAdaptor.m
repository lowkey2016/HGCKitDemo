//
//  HGCWKDelegatesAdaptor.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/12/8.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "HGCWKDelegatesAdaptor.h"
#import "UIAlertView+SBNCBlockConfig.h"

#ifdef HGC_WEBKIT_ENABLE

#import "HGCWKWebView.h"

#define HGCWKRespond2Delegate(webView, selector)    \
(webView && [webView isKindOfClass:[HGCWKWebView class]] && webView.hgcDelegate && [webView.hgcDelegate respondsToSelector:selector])

// ##
// http://blog.csdn.net/dotphoenix/article/details/4345174

// objc_msgSend
// http://stackoverflow.com/questions/2573805/using-objc-msgsend-to-call-a-objective-c-function-with-named-arguments
// http://stackoverflow.com/questions/12488166/call-instance-method-with-objc-msgsend
//
// 坑太多了...
//
//#define HGCMsgSend(target, selector, ...) \
//((void (*)(id, SEL, ...))objc_msgSend)(target, selector, ##__VA_ARGS__)
//
//#define HGCMsgSendReturnObj(target, selector, ...) \
//((id (*)(id, SEL, ...))objc_msgSend)(target, selector, ##__VA_ARGS__)
//
//#define HGCMsgSendReturnInteger(target, selector, ...) \
//((NSInteger (*)(id, SEL, ...))objc_msgSend)(target, selector, ##__VA_ARGS__)
//
//#define HGCWKDelegateMsgSendSafely(webView, selector, ...)                      \
//if (webView && [webView isKindOfClass:[HGCWKWebView class]] &&                  \
//    webView.hgcDelegate && [webView.hgcDelegate respondsToSelector:selector])   \
//{                                                                               \
//    ((void (*)(id, SEL, ...))objc_msgSend)(webView.hgcDelegate, selector, ##__VA_ARGS__); \
//}

@implementation HGCWKDelegatesAdaptor


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - WKNavigationDelegate

/**
 *  在发送请求之前，决定是否跳转
 */
- (void)webView:(HGCWKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    NSLog(@"[INFO] WKWebView ** Make Decision for Navigation Action: %@", navigationAction.request);
    WKNavigationActionPolicy policy = WKNavigationActionPolicyAllow;
    if (HGCWKRespond2Delegate(webView, @selector(hgc_decisionPolicyForNavigationAction:))) {
        policy = [webView.hgcDelegate hgc_decisionPolicyForNavigationAction:navigationAction];
    }
    decisionHandler(policy);
}

/**
 *  页面开始加载时调用
 */
- (void)webView:(HGCWKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"[INFO] WKWebView ** Provisional Navigation Did Start");
    if (HGCWKRespond2Delegate(webView, @selector(hgc_wkWebViewDidStartProvisionalNavigation:))) {
        [webView.hgcDelegate hgc_wkWebViewDidStartProvisionalNavigation:navigation];
    }
}

/**
 *  当内容开始返回时调用
 */
- (void)webView:(HGCWKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    NSLog(@"[INFO] WKWebView ** Navigation Did Commit");
    if (HGCWKRespond2Delegate(webView, @selector(hgc_wkWebViewDidCommitNavigation:))) {
        [webView.hgcDelegate hgc_wkWebViewDidCommitNavigation:navigation];
    }
}

/**
 *  接收到服务器跳转请求之后调用
 */
- (void)webView:(HGCWKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation
{
    NSLog(@"[INFO] WKWebView ** Receive Sever Redirect for Provisional Navigation");
    if (HGCWKRespond2Delegate(webView, @selector(hgc_wkWebViewDidReceiveServerRedirectForProvisionalNavigation:))) {
        [webView.hgcDelegate hgc_wkWebViewDidReceiveServerRedirectForProvisionalNavigation:navigation];
    }
}

/**
 *  在收到响应后，决定是否跳转
 */
- (void)webView:(HGCWKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler
{
    NSLog(@"[INFO] WKWebView ** Make decision for Navigation Response: %@", navigationResponse.response);
    
    WKNavigationResponsePolicy policy = WKNavigationResponsePolicyAllow;
    if (HGCWKRespond2Delegate(webView, @selector(hgc_decisionPolicyForNavigationResponse:))) {
        policy = [webView.hgcDelegate hgc_decisionPolicyForNavigationResponse:navigationResponse];
    }
    decisionHandler(policy);
}

/**
 *  页面加载完成之后调用
 */
- (void)webView:(HGCWKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"[INFO] WKWebView ** Navigation Did Finish");
    if (HGCWKRespond2Delegate(webView, @selector(hgc_wkWebViewDidFinishNavigation:))) {
        [webView.hgcDelegate hgc_wkWebViewDidFinishNavigation:navigation];
    }
}

/**
 *  加载失败时调用
 */
- (void)webView:(HGCWKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    NSLog(@"[ERROR] WKWebView ** Provisional Navigation Did Fail, error = %@", error);
    if (HGCWKRespond2Delegate(webView, @selector(hgc_wkWebViewDidFailProvisionalNavigation:error:))) {
        [webView.hgcDelegate hgc_wkWebViewDidFailProvisionalNavigation:navigation error:error];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - WKUIDelegate

- (nullable HGCWKWebView *)webView:(HGCWKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures
{
    NSLog(@"[INFO] WKWebView ** Create WebView for navigation action: %@", navigationAction.request);
    if (HGCWKRespond2Delegate(webView, @selector(hgc_createWebViewWithConfiguration:forNavigationAction:windowFeatures:))) {
        HGCWKWebView *createdWebView = [webView.hgcDelegate hgc_createWebViewWithConfiguration:configuration forNavigationAction:navigationAction windowFeatures:windowFeatures];
        
        return createdWebView;
    }
    else {
        WKFrameInfo *frameInfo = navigationAction.targetFrame;
        if ([frameInfo isMainFrame] == NO) {
            [webView loadRequest:navigationAction.request];
        }
        return nil;
    }
}

#ifdef HGC_iOS9_API_AVAILABLE
- (void)webViewDidClose:(HGCWKWebView *)webView {
    NSLog(@"[INFO] WKWebView ** WebView Did Close");
    if (HGCWKRespond2Delegate(webView, @selector(hgc_wkWebViewDidClose))) {
        [webView.hgcDelegate hgc_wkWebViewDidClose];
    }
}
#endif

- (void)webView:(HGCWKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler
{
    NSLog(@"[INFO] WKWebView ** Run JS Alert Panel: message = %@", message);
    if (HGCWKRespond2Delegate(webView, @selector(hgc_wkWebViewRunJSAlertPanelWithMessage:initiatedByFrame:completionHandler:))) {
        [webView.hgcDelegate hgc_wkWebViewRunJSAlertPanelWithMessage:message
                                                    initiatedByFrame:frame
                                                   completionHandler:completionHandler];
    }
    else {
        SBNCAlertViewItem *confirmItem = [[SBNCAlertViewItem alloc] initWithTitle:@"确定" action:^{
            completionHandler();
        } isCancelItem:YES];
        [[[UIAlertView alloc] initWithTitle:nil message:message items:@[confirmItem]] show];
    }
}

- (void)webView:(HGCWKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler
{
    NSLog(@"[INFO] WKWebView ** Run JS Confirm Panel: message = %@", message);
    if (HGCWKRespond2Delegate(webView, @selector(hgc_wkWebViewRunJSConfirmPanelWithMessage:initiatedByFrame:completionHandler:))) {
        [webView.hgcDelegate hgc_wkWebViewRunJSConfirmPanelWithMessage:message
                                                      initiatedByFrame:frame
                                                     completionHandler:completionHandler];
    }
    else {
        SBNCAlertViewItem *confirmItem = [[SBNCAlertViewItem alloc] initWithTitle:@"确定" action:^{
            completionHandler(YES);
        }];
        SBNCAlertViewItem *cancelItem = [[SBNCAlertViewItem alloc] initWithTitle:@"取消" action:^{
            completionHandler(NO);
        } isCancelItem:YES];
        [[[UIAlertView alloc] initWithTitle:nil message:message items:@[confirmItem, cancelItem]] show];
    }
}

- (void)webView:(HGCWKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * __nullable result))completionHandler
{
    NSLog(@"[INFO] WKWebView ** Run JS Text Input Panel: prompt = %@, defaultText = %@", prompt, defaultText);
    if (HGCWKRespond2Delegate(webView, @selector(hgc_wkWebViewRunJSTextInputPanelWithPrompt:defaultText:initiatedByFrame:completionHandler:))) {
        [webView.hgcDelegate hgc_wkWebViewRunJSTextInputPanelWithPrompt:prompt
                                                            defaultText:defaultText
                                                       initiatedByFrame:frame
                                                      completionHandler:completionHandler];
    }
    else {
        completionHandler(@"");
    }
}

@end

#endif

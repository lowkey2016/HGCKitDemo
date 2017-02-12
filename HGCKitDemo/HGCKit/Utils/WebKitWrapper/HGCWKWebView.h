//
//  HGCWKWebView.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/12/8.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "HGCWKCommon.h"

#ifdef HGC_WEBKIT_ENABLE

#import "HGCWKWebViewDelegate.h"
#import "HGCWKScriptMessageHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface HGCWKWebView : WKWebView

#pragma mark - Init and Destroy

- (instancetype)initWithDefaultSettings;
- (void)setUserAgentAndWriteObject:(NSString *)customObject;
- (void)setValue:(id)value forHTTPHeaderField:(nonnull NSString *)field;
- (void)destroyInstance;

#pragma mark - WebView Attributes

- (void)disableUserSelectionAndCallout;
- (void)setScrollViewBounces:(BOOL)bounces; // default: NO
- (void)setSupportBackForwardNavigationGestures:(BOOL)support; // default: NO

#pragma mark - JS-OC

- (void)injectJavascript:(NSString *)js
                  atTime:(WKUserScriptInjectionTime)time
        forMainFrameOnly:(BOOL)forMainFrame;
- (void)removeAllInjectedJavascripts;

- (void)addScriptMessageHandlerWithName:(NSString *)name
                               callback:(HGCWKScriptMessageHandlerCallback)block;
- (void)addScriptMessageHandler:(id <WKScriptMessageHandler>)scriptMessageHandler
                           name:(NSString *)name;
- (void)removeScriptMessageHandlerForName:(NSString *)name;

#pragma mark - Delegate

@property (nonatomic, weak, nullable) id<HGCWKWebViewDelegate> hgcDelegate;

@end

NS_ASSUME_NONNULL_END

#endif

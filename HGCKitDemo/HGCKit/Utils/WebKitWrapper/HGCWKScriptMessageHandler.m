//
//  HGCWKScriptMessageHandler.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/12/8.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "HGCWKScriptMessageHandler.h"

#ifdef HGC_WEBKIT_ENABLE

@implementation HGCWKScriptMessageHandler

#pragma mark - WKScriptMessageHandler

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    NSLog(@"[INFO] Did Receive Script Message: message = %@", [message description]);
    
    !_callbackBlock ?: _callbackBlock(userContentController, message);
}

@end

#endif

//
//  HGCWKScriptMessageHandler.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/12/8.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "HGCWKCommon.h"

#ifdef HGC_WEBKIT_ENABLE

typedef void(^HGCWKScriptMessageHandlerCallback)(WKUserContentController *userContentController, WKScriptMessage *message);

@interface HGCWKScriptMessageHandler : NSObject <WKScriptMessageHandler>

@property (nonatomic, copy) HGCWKScriptMessageHandlerCallback callbackBlock;

@end

#endif

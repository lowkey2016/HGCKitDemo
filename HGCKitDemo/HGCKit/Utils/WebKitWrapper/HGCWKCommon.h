//
//  HGCWKCommon.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/12/8.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#ifndef HGCWKCommon_h
#define HGCWKCommon_h

#import "HGCMacros.h"
#import <objc/message.h>

#ifdef HGC_iOS8_API_AVAILABLE
    @import WebKit;
    #define HGC_WEBKIT_ENABLE   1
#else
    #undef  HGC_WEBKIT_ENABLE
#endif

#endif /* HGCWKCommon_h */

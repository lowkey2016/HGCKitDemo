//
//  HGCMacros.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/7/24.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#ifndef H5GameCenter_HGCMacros_h
#define H5GameCenter_HGCMacros_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


///////////////////////////////////////////////////////////////////////////////////////////


/**
 *  Log的宏，摘自YMUSDKit
 */
//#ifdef HGC_DEBUG_MODE
//
//#define HGCLog(format, ...)                                                             \
//do {                                                                                    \
//    if (mHGCAppConfigure.appConfig && mHGCAppConfigure.appConfig.enableLog) {           \
//        (NSLog)(@"-------------------- 4566 --------------------\n");                   \
//        if (mHGCAppConfigure.appConfig && mHGCAppConfigure.appConfig.enableCodeLog) {   \
//            (NSLog)(@"<%s : %d> %s\n", [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __func__);                       \
//        }                                                               \
//        (NSLog)((format), ##__VA_ARGS__);                               \
//        (NSLog)(@"-------------------- End ---------------------\n");   \
//    }                                                                   \
//} while (0)
//
//#else
//
//#define HGCLog(format, ...) do { \
//} while (0)
//
//#endif


///////////////////////////////////////////////////////////////////////////////////////////


/**
 *  UI相关宏
 */
#define HGCScreenWidth     [UIScreen mainScreen].bounds.size.width
#define HGCScreenHeight    [UIScreen mainScreen].bounds.size.height
#define HGCScreenBounds    [UIScreen mainScreen].bounds
#define HGCStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
#define HGCNavigationBarHeight 44.0f
#define HGCTabBarHeight        49.0f
#define HGCNormalContentHeight (HGCScreenHeight - HGCStatusBarHeight - HGCNavigationBarHeight - HGCTabBarHeight)
#define HGCApplicationWindow    ((UIResponder<UIApplicationDelegate> *)([UIApplication sharedApplication].delegate)).window

#define HGCIsSizeZero(size)     CGSizeEqualToSize(size, CGSizeZero)
#define HGCIsViewSizeZero(view) CGSizeEqualToSize(self.bounds.size, CGSizeZero)

/**
 *  写界面时调整比例用到的宏
 */
#define HGCWidthScaleFactor  ((CGFloat)HGCScreenWidth / (CGFloat)640.0f)
#define HGCHeightScaleFactor ((CGFloat)HGCScreenHeight / (CGFloat)1136.0f)

#define HGCWidth(w)      w * HGCWidthScaleFactor
#define HGCHeight(h)     h * HGCHeightScaleFactor

#define HGCWidth_6401136(w)  w / 2
#define HGCHeight_6401136(h) h / 2

#define HGC_IS_iPhone_4_4S    HGCScreenHeight < 500.0f

/**
 *  系统版本相关宏
 */
#define HGC_SYSTEM_VERSION  [[UIDevice currentDevice] systemVersion]
#define HGC_SYSTEM_VERSION_EQUAL_TO(v) ([HGC_SYSTEM_VERSION compare:v options:NSNumericSearch] == NSOrderedSame)
#define HGC_SYSTEM_VERSION_GREATER_THAN(v) ([HGC_SYSTEM_VERSION compare:v options:NSNumericSearch] == NSOrderedDescending)
#define HGC_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([HGC_SYSTEM_VERSION compare:v options:NSNumericSearch] != NSOrderedAscending)
#define HGC_SYSTEM_VERSION_LESS_THAN(v) ([HGC_SYSTEM_VERSION compare:v options:NSNumericSearch] == NSOrderedAscending)
#define HGC_SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([HGC_SYSTEM_VERSION compare:v options:NSNumericSearch] != NSOrderedDescending)

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
    #define HGC_iOS7_API_AVAILABLE
    #if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
        #define HGC_iOS8_API_AVAILABLE
        #if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0
            #define HGC_iOS9_API_AVAILABLE
        #endif
    #endif
#endif

/**
 *  Bundle相关宏
 */
#define HGCRESOURCES_BUNDLE [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"HGCResources" ofType:@"bundle"]]
#define HGCRESOURCES_BUNDLE_GET_IMAGE(imageName) [UIImage imageWithContentsOfFile:[HGCRESOURCES_BUNDLE pathForResource:imageName ofType:nil]]
#define HGCLocalizedString(text) NSLocalizedStringFromTableInBundle(text, @"HGCLocalizable", HGCRESOURCES_BUNDLE, @"")

/**
 *  GCD相关宏
 */
//#define hgc_dispatch_main_sync_safe(block)\
//    if ([NSThread isMainThread]) {\
//        block();\
//    } else {\
//        dispatch_sync(dispatch_get_main_queue(), block);\
//    }

#define hgc_dispatch_main_async_safe(block)\
    if ([NSThread isMainThread]) {\
        block();\
    } else {\
        dispatch_async(dispatch_get_main_queue(), block);\
    }

//#define hgc_dispatch_background_sync(block)\
//    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);

#define hgc_dispatch_background_async(block)\
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);


/**
 *  编译器相关宏
 */

// 去掉编译器的 perform selector leaks 警告
#define HGCPerformSelectorLeakWarning(Stuff) \
do { \
    _Pragma("clang diagnostic push") \
    _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
    Stuff; \
    _Pragma("clang diagnostic pop") \
} while (0)

// TODO宏
// 转成字符串
#define STRINGIFY(S) #S
// 需要解两次才解开的宏
#define DEFER_STRINGIFY(S) STRINGIFY(S)
#define PRAGMA_MESSAGE(MSG) _Pragma(STRINGIFY(message(MSG)))
// 为warning增加更多信息
#define FORMATTED_MESSAGE(MSG) "[TODO-" DEFER_STRINGIFY(__COUNTER__) "] " MSG " \n" DEFER_STRINGIFY(__FILE__) " line " DEFER_STRINGIFY(__LINE__)
// 最终使用的宏
#define HGCTODO(MSG) PRAGMA_MESSAGE(FORMATTED_MESSAGE(MSG))


///////////////////////////////////////////////////////////////////////////////////////////


/**
 *  判断真机或模拟器的宏
 */
#if TARGET_IPHONE_SIMULATOR
#define HGC_IPHONE_SIMULATOR 1
#else
#define HGC_OS_IPHONE    1
#endif

#endif

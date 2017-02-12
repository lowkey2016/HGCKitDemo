//
//  YMUBaseInfoManager.h
//  YMUSDKit
//
//  Created by Jymn_Chen on 15/10/20.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef struct _ymubaseinfo {
    // private open UDID
    NSString *(*getPrivateOpenUniDID)(void);
    // idfa
    BOOL (*getIsAdvIDOpen)(void);
    NSString *(*getAdvID)(void);
    // idfv
    NSString *(*getVenID)(void);
    
    // device model ex. iPhone 5,2
    NSString *(*getDeviceMod)(void);
    // username ex. Enzo Yang
    NSString *(*getUsername)(void);
    // OS version   ex. iOS 9.0.0
    NSString *(*getOSVer)(void);
    
    // Country Code ex. CN
    NSString *(*getCntCode)(void);
    // Language ex. zh
    NSString *(*getLan)(void);
    
    // access point name    ex. wifi, GPRS|3G
    NSString *(*getAsseccPointName)(void);
    // 1：移动，中国移动，CHINA MOBILE 2：联通，中国联通，China Unicom 3：电信，中国电信
    NSString *(*getCarrName)(void);
    
    // 是否越狱
    BOOL (*getJailBreakStatus)(void);
    // 开机时间
    NSString *(*getSystemLaunchTime)(void);
    
    // 屏幕宽高
    double (*getScreenWidth)(void);
    double (*getScreenHeight)(void);
    
    // SSID
    id (*getSSID)(void);
    // BSSID
    NSString *(*getBSSID)(void);
    
    // 占位的无用函数
    int (*lastDayTime)(int);
    int (*tomorrowTime)(double);
    int (*curTime)(void);
} YMUBaseInfoManager_t;

#define mYMUBaseInfoManager [YMUBaseInfoManager sharedInstance]

@interface YMUBaseInfoManager : NSObject

+ (YMUBaseInfoManager_t *)sharedInstance;

@end

//
//  YMUBaseInfoManager.m
//  YMUSDKit
//
//  Created by Jymn_Chen on 15/10/20.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "YMUBaseInfoManager.h"
#import <sys/socket.h>
#import <sys/utsname.h>
#import <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import <AdSupport/AdSupport.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <Security/Security.h>
#import <SystemConfiguration/CaptiveNetwork.h>

#import "YMUKeychain.h"
#import "YMUReachability.h"


////////////////////////////////////////////////////////////////////////////////////////////////////////////


typedef NS_ENUM(NSUInteger, YMUCarrCode) {
    YMUCarrCodeCNMOBILE   = 1,
    YMUCarrCodeCNUnicom   = 2,
    YMUCarrCodeCNTelecom  = 3,
};

@implementation YMUBaseInfoManager


////////////////////////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Singleton

+ (YMUBaseInfoManager_t *)sharedInstance {
    static YMUBaseInfoManager_t *util = NULL;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        util = malloc(sizeof(YMUBaseInfoManager_t));
        
        util->getPrivateOpenUniDID = getPrivateOpenUniDID;
        util->getIsAdvIDOpen = getIsAdvIDOpen;
        util->getAdvID = getAdvID;
        util->getVenID = getVenID;
        
        util->getDeviceMod = getDeviceMod;
        util->getUsername = getUsername;
        util->getOSVer = getOSVer;
        
        util->getCntCode = getCntCode;
        util->getLan = getLan;
        
        util->getAsseccPointName = getAsseccPointName;
        util->getCarrName = getCarrName;
        
        util->getJailBreakStatus = getJailBreakStatus;
        util->getSystemLaunchTime = getSystemLaunchTime;
        
        util->getScreenWidth = getScreenWidth;
        util->getScreenHeight = getScreenHeight;
        
        util->getSSID = getSSID;
        util->getBSSID = getBSSID;
        
        util->lastDayTime = lastDayTime;
        util->tomorrowTime = tomorrowTime;
        util->curTime = curTime;
    });
    return util;
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - ID

// private open UDID
static NSString *getPrivateOpenUniDID() {
    NSString *bid = [[NSBundle mainBundle] bundleIdentifier];
    bid = [NSString stringWithFormat:@"%@.ymusdk", bid];
    NSString *udidStr = [YMUKeychain loadValueForKey:bid];
    if (udidStr == nil || [udidStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]])
    {
        NSUUID *UUID = [NSUUID UUID];
        udidStr = [[[UUID UUIDString] stringByReplacingOccurrencesOfString:@"-" withString:@""] lowercaseString];
        [YMUKeychain saveValue:udidStr forKey:bid];
    }
    return (udidStr ?: @"");
}

// idfa
static BOOL getIsAdvIDOpen() {
    return [[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled];
}
static NSString *getAdvID() {
    NSUUID *ifa = [[ASIdentifierManager sharedManager] advertisingIdentifier];
    return [[[ifa UUIDString] stringByReplacingOccurrencesOfString:@"-" withString:@""] lowercaseString];
}

// idfv
static NSString *getVenID() {
    NSUUID *ifv = [[UIDevice currentDevice] identifierForVendor];
    return [[[ifv UUIDString] stringByReplacingOccurrencesOfString:@"-" withString:@""] lowercaseString];
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Device

// device model ex. iPhone 5,2
static NSString *getDeviceMod() {
    char *typeSpecifier = "hw.machine";
    size_t size;
    sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);
    char *answer = malloc(size);
    sysctlbyname(typeSpecifier, answer, &size, NULL, 0);
    NSString *results = [NSString stringWithUTF8String:answer];
    free(answer);
    
    return (results ?: @"");
}

// username ex. Enzo Yang
static NSString *getUsername() {
    NSString *username = [[UIDevice currentDevice] name];
    return (username ?: @"");
}

// OS version   ex. iOS 9.0.0
static NSString *getOSVer() {
    return [NSString stringWithFormat:@"%@ %@", [[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion]];
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Locale

// Country Code ex. CN
static NSString *getCntCode() {
    NSString *countryCode = [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];
    return (countryCode ?: @"");
}

// Language ex. zh
static NSString *getLan() {
    NSString *language;
    if ([[NSLocale preferredLanguages] count] > 0) {
        language = [[NSLocale preferredLanguages] objectAtIndex:0];
    }
    else {
        language = [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode];
    }
    
    return (language ?: @"");
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Carrier

// access point name    ex. wifi, GPRS|3G
static NSString *getAsseccPointName() {
    YMUReachability *reachability = [YMUReachability reachabilityWithHostname:@"www.baidu.com"];
    YMUNetworkStatus status = [reachability currentReachabilityStatus];
    NSString *name = @"";
    switch (status) {
        case YMUNotReachable:
            name = @"None";
            break;
        case YMUReachableViaWWAN:
            name = @"GPRS|3G";
            break;
        case YMUReachableViaWiFi:
            name = @"WiFi";
            break;
        default:
            name = @"None";
            break;
    }
    return name;
}

// 1：移动，中国移动，CHINA MOBILE 2：联通，中国联通，China Unicom 3：电信，中国电信
static NSString *getCarrName() {
    CTTelephonyNetworkInfo *info = [CTTelephonyNetworkInfo new];
    CTCarrier *carrier = [info subscriberCellularProvider];
    NSString *result = @"";
    if (carrier) {
        NSString *carrierName = [carrier carrierName];
        result = carrierName ?: @"";
        if ([carrierName isEqualToString:@"移动"] ||
            [carrierName isEqualToString:@"中国移动"] ||
            [carrierName isEqualToString:@"CHINA MOBILE"])
        {
            result = [NSString stringWithFormat:@"%zd", YMUCarrCodeCNMOBILE];
        }
        else if ([carrierName isEqualToString:@"联通"] ||
                 [carrierName isEqualToString:@"中国联通"] ||
                 [carrierName isEqualToString:@"China Unicom"])
        {
            result = [NSString stringWithFormat:@"%zd", YMUCarrCodeCNUnicom];
        }
        else if ([carrierName isEqualToString:@"电信"] ||
                 [carrierName isEqualToString:@"中国电信"] ||
                 [carrierName isEqualToString:@"China Telecom"])
        {
            result = [NSString stringWithFormat:@"%zd", YMUCarrCodeCNTelecom];
        }
    }
    
    return (result ?: @"");
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Attributes

// 是否越狱
static BOOL getJailBreakStatus() {
#if TARGET_IPHONE_SIMULATOR
    return NO;
#else
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://"]]) {
        return YES;
    }
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/User/Applications/"]) {
        return YES;
    }
    
    BOOL isJailbroken = NO;
    FILE *f = fopen("/bin/bash", "r");
    if (!(errno == ENOENT)) {
        isJailbroken = YES;
    }
    fclose(f);
    return isJailbroken;
#endif
}

// 开机时间
static NSString *getSystemLaunchTime() {
    NSTimeInterval systemUptime = [NSProcessInfo processInfo].systemUptime;
    NSDate *currentDate = [NSDate new];
    
    NSDate *startTime = [currentDate dateByAddingTimeInterval:(-systemUptime)];
    NSTimeInterval timestamp = [startTime timeIntervalSince1970];
    
    long long lltimestamp = (long long)timestamp;
    NSString *timestampString = [NSString stringWithFormat:@"%lld", lltimestamp] ?: @"";
    
    return (timestampString ?: @"");
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - UI

// 屏幕宽高
static double getScreenWidth() {
    CGRect bounds = [UIScreen mainScreen].bounds;
    CGFloat scale = [[UIScreen mainScreen] scale];
    return CGRectGetWidth(bounds) * scale;
}
static double getScreenHeight() {
    CGRect bounds = [UIScreen mainScreen].bounds;
    CGFloat scale = [[UIScreen mainScreen] scale];
    return CGRectGetHeight(bounds) * scale;
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Network

// SSID
static id getSSID() {
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    id info = nil;
    for (NSInteger i = 0; i < ifs.count; i++) {
        NSString *ifnam = ifs[i];
        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info && [info count]) {
            break;
        }
    }
    
    return info;
}

// BSSID
static NSString *getBSSID() {
    NSDictionary *ssidInfo = getSSID();
    NSString *BSSID = @"";
    if (ssidInfo) {
        BSSID = [[ssidInfo objectForKey:@"BSSID"] stringByReplacingOccurrencesOfString:@":" withString:@""] ?: @"";
    }
    
    return BSSID;
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Unused Functions

static int lastDayTime(int i) {
    return i;
}

static int tomorrowTime(double d) {
    return d;
}

static int curTime() {
    return 0;
}

@end

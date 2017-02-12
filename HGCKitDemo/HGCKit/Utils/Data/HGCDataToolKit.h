//
//  HGCDataToolKit.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/8/19.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HGCDataToolKit : NSObject

+ (NSString*)md5HexDigest:(NSString *)input;

+ (NSString *)base64StringFromString:(NSString *)str;
+ (NSString *)base64StringFromData:(NSData *)data;

+ (NSString *)decodedStringFromBase64String:(NSString *)bstr;
+ (NSString *)decodedStringFromBase64Data:(NSData *)data;

+ (NSData *)decodedDataFromBase64String:(NSString *)bstr;
+ (NSData *)decodedDataFromBase64Data:(NSData *)data;

@end

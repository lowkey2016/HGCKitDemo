//
//  HGCDataToolKit.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/8/19.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import "HGCDataToolKit.h"
#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonDigest.h>

#include <string>
#include "HGCBase64.h"

@implementation HGCDataToolKit

#pragma mark -

//生成一串16进制的摘要
+ (NSString*)md5HexDigest:(NSString*)input {
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (unsigned int)strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

#pragma mark - Base64 Encode

+ (NSString *)base64StringFromString:(NSString *)str {
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    return [self base64StringFromData:data];
}

+ (NSString *)base64StringFromData:(NSData *)data {
    if (data == nil) {
        return @"";
    }
    
    std::string dst;
    std::string src(reinterpret_cast<char const *>(data.bytes), data.length);
    hgc_base64_encode(dst, src);
    
    return [NSString stringWithUTF8String:dst.c_str()];
}

#pragma mark - Base64 Decode

+ (NSString *)decodedStringFromBase64String:(NSString *)bstr {
    if (bstr == nil) {
        return @"";
    }
    
    std::string dst;
    std::string src([bstr UTF8String]);
    hgc_base64_decode(dst, src);
    
    return [NSString stringWithUTF8String:dst.c_str()];
}

+ (NSString *)decodedStringFromBase64Data:(NSData *)data {
    if (data == nil) {
        return @"";
    }
    
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return [self decodedStringFromBase64String:str];
}

+ (NSData *)decodedDataFromBase64String:(NSString *)bstr {
    if (bstr == nil) {
        return nil;
    }
    
    std::string dst;
    std::string src([bstr UTF8String]);
    hgc_base64_decode(dst, src);
    
    // 解码后的字符串dst，就是图片的字节数据对应的字符串
    return [NSData dataWithBytes:dst.c_str() length:dst.length()];
}

+ (NSData *)decodedDataFromBase64Data:(NSData *)data {
    if (data == nil) {
        return nil;
    }
    
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return [self decodedDataFromBase64String:str];
}

@end

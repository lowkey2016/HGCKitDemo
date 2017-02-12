//
//  NSString+HGCCategory.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/7/24.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import "NSString+HGCCategory.h"
#import "HGCMacros.h"

@implementation NSString (HGCCategory)

- (instancetype)hgc_urlLeaveEncodeString {
    NSString *encodedString = (NSString *) \
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)self,
                                                              (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                              NULL,
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
}

- (instancetype)hgc_urlencodedStringWithEncodeSet:(NSString *)set {
    NSString *encodedString = (NSString *) \
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)self,
                                                              NULL,
                                                              (CFStringRef)set,
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
}

- (instancetype)hgc_urlencodedString {
    NSString *encodedString = (NSString *) \
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)self,
                                                              NULL,
                                                              (CFStringRef)@"!$&'()*+,-./:;=@_~%#[]",
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
}

- (instancetype)hgc_urldecodedString {
    NSMutableString *outputStr = [NSMutableString stringWithString:self];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@""
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0, [outputStr length])];
    
    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (BOOL)hgc_isEmpty {
    return [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""];
}

- (BOOL)hgc_isNotEmpty {
    BOOL isEmpty = [self hgc_isEmpty];
    BOOL isNotEmpty = !isEmpty;
    
    return isNotEmpty;
}

- (BOOL)hgc_containsString:(NSString *)s {
    if (HGC_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")) {
        return [self containsString:s];
    }
    else {
        NSRange range = [self rangeOfString:s];
        return (range.location != NSNotFound);
    }
}

- (instancetype)hgc_trimEmptyCharacters {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (instancetype)hgc_removeWhitespaceCharacters {
    NSString *des = self;
    des = [des stringByReplacingOccurrencesOfString:@" " withString:@""];
    des = [des stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    return des;
}

- (instancetype)hgc_removeNewlineCharacters {
    NSString *des = self;
    des = [des stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    des = [des stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return des;
}

- (instancetype)hgc_removeWhitespaceAndNewlineCharacters {
    NSString *des = self;
    des = [des hgc_removeWhitespaceCharacters];
    des = [des hgc_removeNewlineCharacters];
    return des;
}

- (instancetype)hgc_stringValue {
    return self;
}

+ (instancetype)hgc_uuid {
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    return (__bridge_transfer NSString *)uuidStringRef;
}

+ (instancetype)hgc_randomWithLength:(NSInteger)length {
    // TODO - 需要改进的算法
    NSString *alphabet  = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXZY0123456789/=+";
    NSMutableString *s = [NSMutableString stringWithCapacity:length];
    for (NSUInteger i = 0; i < length; i++) {
        u_int32_t r = arc4random() % [alphabet length];
        unichar c = [alphabet characterAtIndex:r];
        [s appendFormat:@"%C", c];
    }
    return s;
}

#pragma mark - JSON

- (id)hgc_jsonArrayOrDictionary {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
    if (err) {
        NSLog(@"JSON to Array/Dictionary fail: err = %@", err);
        return nil;
    }
    if (json == nil ||
        ([json isKindOfClass:[NSDictionary class]] == NO &&
         [json isKindOfClass:[NSArray class]] == NO)
        )
    {
        NSLog(@"JSON to Array/Dictionary fail: json is not array or dictionary");
        return nil;
    }
    return json;
}

- (NSArray *)hgc_jsonArray {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
    if (err) {
        NSLog(@"JSON to Array fail: err = %@", err);
        return nil;
    }
    if (json == nil || [json isKindOfClass:[NSArray class]] == NO) {
        NSLog(@"JSON to Array fail: json is not array");
        return nil;
    }
    return (NSArray *)json;
}

- (NSDictionary *)hgc_jsonDictionary {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
    if (err) {
        NSLog(@"JSON to Dictionary fail: err = %@", err);
        return nil;
    }
    if (json == nil || [json isKindOfClass:[NSDictionary class]] == NO) {
        NSLog(@"JSON to Dictionary fail: json is not dictionary");
        return nil;
    }
    return (NSDictionary *)json;
}

#pragma mark - YY

- (NSString *)hgc_yy_stringByURLEncode {
    if ([self respondsToSelector:@selector(stringByAddingPercentEncodingWithAllowedCharacters:)]) {
        /**
         AFNetworking/AFURLRequestSerialization.m
         
         Returns a percent-escaped string following RFC 3986 for a query string key or value.
         RFC 3986 states that the following characters are "reserved" characters.
         - General Delimiters: ":", "#", "[", "]", "@", "?", "/"
         - Sub-Delimiters: "!", "$", "&", "'", "(", ")", "*", "+", ",", ";", "="
         In RFC 3986 - Section 3.4, it states that the "?" and "/" characters should not be escaped to allow
         query strings to include a URL. Therefore, all "reserved" characters with the exception of "?" and "/"
         should be percent-escaped in the query string.
         - parameter string: The string to be percent-escaped.
         - returns: The percent-escaped string.
         */
        static NSString * const kAFCharactersGeneralDelimitersToEncode = @":#[]@"; // does not include "?" or "/" due to RFC 3986 - Section 3.4
        static NSString * const kAFCharactersSubDelimitersToEncode = @"!$&'()*+,;=";
        
        NSMutableCharacterSet * allowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
        [allowedCharacterSet removeCharactersInString:[kAFCharactersGeneralDelimitersToEncode stringByAppendingString:kAFCharactersSubDelimitersToEncode]];
        static NSUInteger const batchSize = 50;
        
        NSUInteger index = 0;
        NSMutableString *escaped = @"".mutableCopy;
        
        while (index < self.length) {
            NSUInteger length = MIN(self.length - index, batchSize);
            NSRange range = NSMakeRange(index, length);
            // To avoid breaking up character sequences such as 👴🏻👮🏽
            range = [self rangeOfComposedCharacterSequencesForRange:range];
            NSString *substring = [self substringWithRange:range];
            NSString *encoded = [substring stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet];
            [escaped appendString:encoded];
            
            index += range.length;
        }
        return escaped;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CFStringEncoding cfEncoding = CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding);
        NSString *encoded = (__bridge_transfer NSString *)
        CFURLCreateStringByAddingPercentEscapes(
                                                kCFAllocatorDefault,
                                                (__bridge CFStringRef)self,
                                                NULL,
                                                CFSTR("!#$&'()*+,/:;=?@[]"),
                                                cfEncoding);
        return encoded;
#pragma clang diagnostic pop
    }
}

- (NSString *)hgc_yy_stringByURLDecode {
    if ([self respondsToSelector:@selector(stringByRemovingPercentEncoding)]) {
        return [self stringByRemovingPercentEncoding];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CFStringEncoding en = CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding);
        NSString *decoded = [self stringByReplacingOccurrencesOfString:@"+"
                                                            withString:@" "];
        decoded = (__bridge_transfer NSString *)
        CFURLCreateStringByReplacingPercentEscapesUsingEncoding(
                                                                NULL,
                                                                (__bridge CFStringRef)decoded,
                                                                CFSTR(""),
                                                                en);
        return decoded;
#pragma clang diagnostic pop
    }
}

@end

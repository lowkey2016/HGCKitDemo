//
//  HGCURLQueryParser.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/12/2.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "HGCURLQueryParser.h"


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - HGCQueryString Pair

@interface HGCQueryStringPair : NSObject

@property (readwrite, nonatomic, strong) id field;
@property (readwrite, nonatomic, strong) id value;

- (instancetype)initWithField:(id)field value:(id)value;
- (NSString *)URLEncodedStringValue;

@end


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - C Functions

// FOUNDATION_EXPORT
// http://stackoverflow.com/questions/10953221/foundation-export-vs-extern
// 如果不用 FOUNDATION_EXPORT 声明，下面的相互之间的C函数调用会报错
FOUNDATION_EXPORT NSArray * HGCQueryStringPairsFromDictionary(NSDictionary *dictionary);
FOUNDATION_EXPORT NSArray * HGCQueryStringPairsFromKeyAndValue(NSString *key, id value);

static NSString * HGCQueryStringFromParameters(NSDictionary *parameters) {
    NSMutableArray *mutablePairs = [NSMutableArray array];
    for (HGCQueryStringPair *pair in HGCQueryStringPairsFromDictionary(parameters)) {
        [mutablePairs addObject:[pair URLEncodedStringValue]];
    }
    
    return [mutablePairs componentsJoinedByString:@"&"];
}

NSArray * HGCQueryStringPairsFromDictionary(NSDictionary *dictionary) {
    return HGCQueryStringPairsFromKeyAndValue(nil, dictionary);
}

NSArray * HGCQueryStringPairsFromKeyAndValue(NSString *key, id value) {
    NSMutableArray *mutableQueryStringComponents = [NSMutableArray array];
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"description" ascending:YES selector:@selector(compare:)];
    
    if ([value isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dictionary = value;
        // Sort dictionary keys to ensure consistent ordering in query string, which is important when deserializing potentially ambiguous sequences, such as an array of dictionaries
        for (id nestedKey in [dictionary.allKeys sortedArrayUsingDescriptors:@[ sortDescriptor ]]) {
            id nestedValue = dictionary[nestedKey];
            if (nestedValue) {
                [mutableQueryStringComponents addObjectsFromArray:HGCQueryStringPairsFromKeyAndValue((key ? [NSString stringWithFormat:@"%@[%@]", key, nestedKey] : nestedKey), nestedValue)];
            }
        }
    }
    else if ([value isKindOfClass:[NSArray class]]) {
        NSArray *array = value;
        for (id nestedValue in array) {
            [mutableQueryStringComponents addObjectsFromArray:HGCQueryStringPairsFromKeyAndValue([NSString stringWithFormat:@"%@[]", key], nestedValue)];
        }
    }
    else if ([value isKindOfClass:[NSSet class]]) {
        NSSet *set = value;
        for (id obj in [set sortedArrayUsingDescriptors:@[ sortDescriptor ]]) {
            [mutableQueryStringComponents addObjectsFromArray:HGCQueryStringPairsFromKeyAndValue(key, obj)];
        }
    }
    else {
        [mutableQueryStringComponents addObject:[[HGCQueryStringPair alloc] initWithField:key value:value]];
    }
    
    return mutableQueryStringComponents;
}

/**
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
static NSString * HGCPercentEscapedStringFromString(NSString *string) {
    static NSString * const kAFCharactersGeneralDelimitersToEncode = @":#[]@"; // does not include "?" or "/" due to RFC 3986 - Section 3.4
    static NSString * const kAFCharactersSubDelimitersToEncode = @"!$&'()*+,;=";
    
    NSMutableCharacterSet * allowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
    [allowedCharacterSet removeCharactersInString:[kAFCharactersGeneralDelimitersToEncode stringByAppendingString:kAFCharactersSubDelimitersToEncode]];
    
    // FIXME: https://github.com/AFNetworking/AFNetworking/pull/3028
    // return [string stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet];
    
    static NSUInteger const batchSize = 50;
    
    NSInteger index = 0;
    NSMutableString *escaped = @"".mutableCopy;
    
    while (index < string.length) {
        NSUInteger length = MIN(string.length - index, batchSize);
        NSRange range = NSMakeRange(index, length);
        
        // To avoid breaking up character sequences such as 👴🏻👮🏽
        range = [string rangeOfComposedCharacterSequencesForRange:range];
        
        NSString *substring = [string substringWithRange:range];
        NSString *encoded = [substring stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet];
        [escaped appendString:encoded];
        
        index += range.length;
    }
    
    return escaped;
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - HGCQueryStringPair

@implementation HGCQueryStringPair

- (instancetype)initWithField:(id)field value:(id)value {
    self = [super init];
    if (self) {
        _field = field;
        _value = value;
    }
    return self;
}

- (NSString *)URLEncodedStringValue {
    if (self.value == nil || [self.value isEqual:[NSNull null]]) {
        return HGCPercentEscapedStringFromString([self.field description]);
    }
    else {
        return [NSString stringWithFormat:@"%@=%@", HGCPercentEscapedStringFromString([self.field description]), HGCPercentEscapedStringFromString([self.value description])];
    }
}

@end


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - HGCQueryParser

@implementation HGCURLQueryParser

+ (NSString *)queryFromParameters:(id)parameters {
    NSString *query = HGCQueryStringFromParameters(parameters) ?: @"";
    return query;
}

@end

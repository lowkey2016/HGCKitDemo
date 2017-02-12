//
//  NSString+HGCCategory.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/7/24.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HGCStringCategory_returnNilIfStringIsEmpty(_str_)   \
    if (_str_ == nil || [_str_ hgc_isEmpty]) {  \
        return nil;                             \
    }

#define HGCStringCategory_returnVoidIfStringIsEmpty(_str_)   \
    if (_str_ == nil || [_str_ hgc_isEmpty]) {  \
        return;                                 \
    }

@interface NSString (HGCCategory)

- (instancetype)hgc_urlLeaveEncodeString;
- (instancetype)hgc_urlencodedStringWithEncodeSet:(NSString *)set;
- (instancetype)hgc_urlencodedString;
- (instancetype)hgc_urldecodedString;

- (NSString *)hgc_yy_stringByURLEncode;
- (NSString *)hgc_yy_stringByURLDecode;

- (BOOL)hgc_isEmpty;
- (BOOL)hgc_isNotEmpty;
- (BOOL)hgc_containsString:(NSString *)s;

- (instancetype)hgc_trimEmptyCharacters;
- (instancetype)hgc_removeWhitespaceCharacters;
- (instancetype)hgc_removeNewlineCharacters;
- (instancetype)hgc_removeWhitespaceAndNewlineCharacters;

- (instancetype)hgc_stringValue;
+ (instancetype)hgc_uuid;
+ (instancetype)hgc_randomWithLength:(NSInteger)length;

- (id)hgc_jsonArrayOrDictionary;
- (NSArray *)hgc_jsonArray;
- (NSDictionary *)hgc_jsonDictionary;

@end

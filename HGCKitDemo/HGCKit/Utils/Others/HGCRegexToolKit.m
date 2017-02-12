//
//  HGCRegexToolKit.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/7/24.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import "HGCRegexToolKit.h"

@implementation HGCRegexToolKit

+ (BOOL)verifyIsPhoneNumber:(NSString *)phoneNumberString {
    // 判断手机号，合法条件:
    //
    // 1.全部是数字
    // 2.13开头
    // 3.147开头
    // 4.15开头，第三个数字是除4和非数字字符外的数字
    // 5.18开头，第三个数字是0, 2, 5到9
    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,2,5-9]))\\d{8}$";
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [predicate evaluateWithObject:phoneNumberString];
    
    return isMatch;
}

+ (BOOL)verifyIsValidateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

@end

//
//  HGCRegexToolKit.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/7/24.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HGCRegexToolKit : NSObject

+ (BOOL)verifyIsPhoneNumber:(NSString *)phoneNumberString;
+ (BOOL)verifyIsValidateEmail:(NSString *)email;

@end

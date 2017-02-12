//
//  HGCFontFactory.h
//  label
//
//  Created by Jymn_Chen on 16/3/11.
//  Copyright © 2016年 com.jymnchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HGCFontType) {
    HGCFontTypeLight,
    HGCFontTypeRegular,
    HGCFontTypeBold,
};

@interface HGCFontFactory : NSObject

+ (UIFont *)fontWithType:(HGCFontType)type size:(CGFloat)size;

@end

//
//  HGCMultiLineLabel.h
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/7/15.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HGCFontFactory.h"

@interface HGCMultiLineLabel : UILabel

+ (instancetype)labelWithText:(NSString *)text
                    textColor:(UIColor *)color
                     fontSize:(CGFloat)fontSize
                     fontType:(HGCFontType)fontType
                  lineSpacing:(CGFloat)lineSpacing;

- (void)setText:(NSString *)text;
- (void)clearText;
- (void)setText:(NSString *)text withAttributes:(NSDictionary<NSString *, id> *)attrs range:(NSRange)range;
- (CGFloat)heightWithWidth:(CGFloat)width defaultHeight:(CGFloat)defaultH;

@end

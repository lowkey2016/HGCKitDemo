//
//  UILabel+HGCCategory.h
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/1/6.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (HGCCategory)

/**
 *  计算一段文字的高度，没有行数限制
 */
- (CGFloat)hgc_heightWithMaxWidth:(CGFloat)width
                        maxHeight:(CGFloat)height
                         fontSize:(CGFloat)fontSize
                    defaultHeight:(CGFloat)defaultH;
+ (CGFloat)hgc_heightWithContent:(NSString *)content
                        maxWidth:(CGFloat)width
                       maxHeight:(CGFloat)height
                        fontSize:(CGFloat)fontSize
                   defaultHeight:(CGFloat)defaultH;
+ (CGFloat)hgc_heightWithContent:(NSString *)content
                        maxWidth:(CGFloat)width
                       maxHeight:(CGFloat)height
                            font:(UIFont *)font
                     lineSpacing:(CGFloat)lineSpacing
                   defaultHeight:(CGFloat)defaultH;

/**
 *  计算限制行数的 Label 中文字的高度
 */
+ (CGFloat)hgc_limitedLinesHeightWithContent:(NSString *)content
                               numberOfLines:(NSInteger)numberOfLines
                                    maxWidth:(CGFloat)width
                                  attributes:(NSDictionary *)attributes;

@end

//
//  UITextView+HGCCategory.h
//  PetAirBnb
//
//  Created by Jymn_Chen on 16/2/2.
//  Copyright © 2016年 com.luedong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (HGCCategory)

+ (CGFloat)hgc_heightWithContent:(NSString *)content
                        maxWidth:(CGFloat)width
                            font:(UIFont *)font
                   defaultHeight:(CGFloat)defaultH;

+ (CGFloat)hgc_heightWithAttributedText:(NSAttributedString *)attrText
                               maxWidth:(CGFloat)width
                          defaultHeight:(CGFloat)defaultH;

@end

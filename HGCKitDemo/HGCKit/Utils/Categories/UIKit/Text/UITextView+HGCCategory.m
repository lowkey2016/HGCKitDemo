//
//  UITextView+HGCCategory.m
//  PetAirBnb
//
//  Created by Jymn_Chen on 16/2/2.
//  Copyright © 2016年 com.luedong. All rights reserved.
//

#import "UITextView+HGCCategory.h"

@implementation UITextView (HGCCategory)

+ (CGFloat)hgc_heightWithContent:(NSString *)content
                        maxWidth:(CGFloat)width
                            font:(UIFont *)font
                   defaultHeight:(CGFloat)defaultH
{
    if (content && [[content stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        return defaultH;
    }
    
    UITextView *tmpTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    tmpTextView.font = font;
    tmpTextView.text = content;
    CGSize size = [tmpTextView sizeThatFits:CGSizeMake(width, CGFLOAT_MAX)];
    CGFloat desHeight = fmax(size.height, defaultH);
    return desHeight;
}

+ (CGFloat)hgc_heightWithAttributedText:(NSAttributedString *)attrText
                               maxWidth:(CGFloat)width
                          defaultHeight:(CGFloat)defaultH
{
    if (attrText == nil || [[attrText.string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]) {
        return defaultH;
    }
    
    UITextView *tmpTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    tmpTextView.attributedText = attrText;
    CGSize size = [tmpTextView sizeThatFits:CGSizeMake(width, CGFLOAT_MAX)];
    CGFloat desHeight = fmax(size.height, defaultH);
    return desHeight;
}

@end

//
//  UILabel+HGCCategory.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/1/6.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "UILabel+HGCCategory.h"

@implementation UILabel (HGCCategory)

#pragma mark - Unlimited Lines Height

- (CGFloat)hgc_heightWithMaxWidth:(CGFloat)width
                        maxHeight:(CGFloat)height
                         fontSize:(CGFloat)fontSize
                    defaultHeight:(CGFloat)defaultH
{
    NSString *text = self.text;
    return [UILabel hgc_heightWithContent:text maxWidth:width maxHeight:height fontSize:fontSize defaultHeight:defaultH];
}

+ (CGFloat)hgc_heightWithContent:(NSString *)content
                        maxWidth:(CGFloat)width
                       maxHeight:(CGFloat)height
                        fontSize:(CGFloat)fontSize
                   defaultHeight:(CGFloat)defaultH
{
    if (content && [[content stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        return defaultH;
    }
    
    CGRect rect = [content boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:(fontSize + 0.5)]} context:nil];
    NSInteger newlinesCount = [content componentsSeparatedByString:@"\\n"].count - 1;
    CGFloat lineSpacing = 4;
    return rect.size.height + (fontSize + lineSpacing) * newlinesCount;
}

+ (CGFloat)hgc_heightWithContent:(NSString *)content
                        maxWidth:(CGFloat)width
                       maxHeight:(CGFloat)height
                            font:(UIFont *)font
                     lineSpacing:(CGFloat)lineSpacing
                   defaultHeight:(CGFloat)defaultH
{
    if (content && [[content stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
        return defaultH;
    }
    if (font == nil) {
        return defaultH;
    }
    
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = lineSpacing;
    paragraphStyle.alignment = NSTextAlignmentJustified;
    NSDictionary *attributesDict = @{NSFontAttributeName : font,
                                     NSParagraphStyleAttributeName : paragraphStyle
                                     };
    CGRect rect = [content boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDict context:nil];
    return rect.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Limited Lines

+ (CGFloat)hgc_limitedLinesHeightWithContent:(NSString *)content
                               numberOfLines:(NSInteger)numberOfLines
                                    maxWidth:(CGFloat)width
                                  attributes:(NSDictionary *)attributes
{
    // From: http://stackoverflow.com/documentation/ios/246/uilabel/5898/calculate-content-bounds-for-i-e-dynamic-cell-heights#t=201607251046460163149
    
    // We calculate the height of a line by omitting the NSStringDrawingUsesLineFragmentOrigin option, which will assume an infinitely wide label
    CGRect singleLineRect = [content boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                                  options:NSStringDrawingTruncatesLastVisibleLine
                                               attributes:attributes
                                                  context:nil];
    CGFloat lineHeight = CGRectGetHeight(singleLineRect);
    CGFloat maxHeight = lineHeight * numberOfLines;
    
    // Now you can call the method appropriately
    CGRect bodyBounds = [content boundingRectWithSize:CGSizeMake(width, maxHeight)
                                              options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine)
                                           attributes:attributes
                                              context:nil];
    
    return CGRectGetHeight(bodyBounds);
}

@end

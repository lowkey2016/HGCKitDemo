//
//  HGCMultiLineLabel.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/7/15.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "HGCMultiLineLabel.h"
#import "NSString+HGCCategory.h"

@interface HGCMultiLineLabel ()

@property (nonatomic, copy) NSDictionary *attributes;

@end

@implementation HGCMultiLineLabel

+ (instancetype)labelWithText:(NSString *)text
                    textColor:(UIColor *)color
                     fontSize:(CGFloat)fontSize
                     fontType:(HGCFontType)fontType
                  lineSpacing:(CGFloat)lineSpacing
{
    return [[HGCMultiLineLabel alloc] initWithText:text textColor:color fontSize:fontSize fontType:fontType lineSpacing:lineSpacing];
}

- (instancetype)initWithText:(NSString *)text
                   textColor:(UIColor *)color
                    fontSize:(CGFloat)fontSize
                    fontType:(HGCFontType)fontType
                 lineSpacing:(CGFloat)lineSpacing
{
    self = [super init];
    if (self) {
        self.textAlignment = NSTextAlignmentJustified;
        self.numberOfLines = 0;
        
        UIColor *textColorAttribute = color ?: [UIColor blackColor];
        CGFloat fontSizeAttribute = (fontSize <= 0) ? 13 : fontSize;
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = lineSpacing;
        paragraphStyle.alignment = NSTextAlignmentJustified;
        paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
        
        UIFont *font = [HGCFontFactory fontWithType:fontType size:fontSizeAttribute];
        self.attributes = @{NSParagraphStyleAttributeName : paragraphStyle,
                            NSFontAttributeName : font,
                            NSForegroundColorAttributeName : textColorAttribute
                            };
        [self setText:text];
    }
    return self;
}

- (void)setText:(NSString *)text {
    if (text == nil || [text hgc_isEmpty]) {
        [self clearText];
    }
    else {
        [self setText:text withAttributes:nil range:NSMakeRange(0, 0)];
    }
}

- (void)clearText {
    self.attributedText = nil;
}

- (void)setText:(NSString *)text withAttributes:(NSDictionary<NSString *, id> *)attrs range:(NSRange)range
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:(text ?: @"") attributes:_attributes];
    if (attrs && range.length > 0) {
        [attributedString addAttributes:attrs range:range];
    }
    self.attributedText = attributedString;
}

- (CGFloat)heightWithWidth:(CGFloat)width defaultHeight:(CGFloat)defaultH {
    NSString *content = self.text;
    if (content == nil || [content hgc_isEmpty]) {
        return defaultH;
    }
    
    NSMutableParagraphStyle *paragraphStyle = [_attributes[NSParagraphStyleAttributeName] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributesDict = @{NSParagraphStyleAttributeName : paragraphStyle,
                                     NSFontAttributeName : self.font
                                     };
    CGRect rect = [content boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attributesDict context:nil];
    return rect.size.height;
}

@end

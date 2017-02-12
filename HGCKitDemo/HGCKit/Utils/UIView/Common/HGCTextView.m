//
//  HGCTextView.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/12/14.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "HGCTextView.h"
#import "HGCFontFactory.h"

@interface HGCTextView ()

@end

@implementation HGCTextView

#pragma mark - Init

+ (instancetype)staticViewWithTextColor:(UIColor *)textColor
                               fontSize:(CGFloat)fontSize
                               fontType:(HGCFontType)fontType
{
    return [self viewWithTextColor:textColor
                          fontSize:fontSize
                          fontType:fontType
                         alignment:NSTextAlignmentJustified
                      contentInset:UIEdgeInsetsZero
                          delegate:nil
                          editable:NO
                        selectable:NO
                     scrollEnabled:NO
                 showsHorIndicator:NO
                 showsVerIndicator:NO];
}

+ (instancetype)viewWithTextColor:(UIColor *)textColor
                         fontSize:(CGFloat)fontSize
                         fontType:(HGCFontType)fontType
                        alignment:(NSTextAlignment)alignment
                     contentInset:(UIEdgeInsets)inset
                         delegate:(id<UITextViewDelegate>)delegate
                         editable:(BOOL)editable
                       selectable:(BOOL)selectable
                    scrollEnabled:(BOOL)scrollEnabled
                showsHorIndicator:(BOOL)showsHorIndicator
                showsVerIndicator:(BOOL)showsVerIndicator
{
    UIFont *font = [HGCFontFactory fontWithType:fontType size:fontSize];
    return [[HGCTextView alloc] initWithTextColor:textColor
                                             font:font
                                    textAlignment:alignment
                                     contentInset:inset
                                         delegate:delegate
                                         editable:editable
                                       selectable:selectable
                                    scrollEnabled:scrollEnabled
                                showsHorIndicator:showsHorIndicator
                                showsVerIndicator:showsVerIndicator];
}

- (instancetype)initWithTextColor:(UIColor *)textColor
                             font:(UIFont *)font
                    textAlignment:(NSTextAlignment)alignment
                     contentInset:(UIEdgeInsets)inset
                         delegate:(id<UITextViewDelegate>)delegate
                         editable:(BOOL)editable
                       selectable:(BOOL)selectable
                    scrollEnabled:(BOOL)scrollEnabled
                showsHorIndicator:(BOOL)showsHorIndicator
                showsVerIndicator:(BOOL)showsVerIndicator
{
    self = [super init];
    if (self) {
        self.textColor = textColor;
        self.font = font;
        self.textAlignment = alignment;
        if ([self respondsToSelector:@selector(textContainerInset)]) {
            self.textContainerInset = inset;
        }
        else {
            self.contentInset = inset;
        }
        self.delegate = delegate;
        self.editable = editable;
        self.selectable = selectable;
        self.scrollEnabled = scrollEnabled;
        self.showsHorizontalScrollIndicator = showsHorIndicator;
        self.showsVerticalScrollIndicator = showsVerIndicator;
    }
    return self;
}

@end

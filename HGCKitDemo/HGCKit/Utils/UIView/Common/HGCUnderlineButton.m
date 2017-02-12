//
//  HGCUnderlineButton.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/8/26.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "HGCUnderlineButton.h"
#import "NSString+HGCCategory.h"
#import "UIColor+HGCUtil.h"


///////////////////////////////////////////////////////////////////////////////////////////


@interface HGCUnderlineButton ()

@property (nonatomic, copy) void (^actionBlock)(id sender);

@end

@implementation HGCUnderlineButton


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Init

+ (instancetype)buttonWithTitle:(NSString *)title
                       fontSize:(CGFloat)fontSize
                       fontType:(HGCFontType)fontType
                      textColor:(UIColor *)textColor
{
    return [self buttonWithTitle:title fontSize:fontSize fontType:fontType textColor:textColor underlineColor:textColor underlineStyle:NSUnderlineStyleSingle];
}

+ (instancetype)buttonWithTitle:(NSString *)title
                       fontSize:(CGFloat)fontSize
                       fontType:(HGCFontType)fontType
                      textColor:(UIColor *)textColor
                 underlineColor:(UIColor *)underlineColor
                 underlineStyle:(NSUnderlineStyle)underlineStyle
{
    HGCUnderlineButton *btn = [HGCUnderlineButton buttonWithType:UIButtonTypeCustom];
    
    UIFont *font = [HGCFontFactory fontWithType:fontType size:fontSize];
    NSDictionary *attrDict = @{NSFontAttributeName : font,
                               NSForegroundColorAttributeName : textColor,
                               NSUnderlineColorAttributeName : textColor,
                               NSUnderlineStyleAttributeName : @(underlineStyle)
                               };
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:(title ?: @"") attributes:attrDict];
    [btn setAttributedTitle:attrStr forState:UIControlStateNormal];
    
    return btn;
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Quick Methods

- (void)addAction:(void (^)(id sender))action {
    self.actionBlock = action;
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)removeCurrentAction {
    [self removeTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addTarget:(id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)removeTarget:(id)target action:(SEL)action {
    [self removeTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Button Action

- (void)buttonAction:(id)sender {
    self.userInteractionEnabled = NO;
    !_actionBlock ?: _actionBlock(sender);
    self.userInteractionEnabled = YES;
}

@end

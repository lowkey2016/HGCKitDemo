//
//  HGCYYMultiLineLabelHolder.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/10/18.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "HGCYYMultiLineLabelHolder.h"
#import <objc/message.h>
#import "UIView+HGCFrameSugar.h"
#import "NSString+HGCCategory.h"


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - YYLabel + HGCYYMultiLineLabelHolder

@interface YYLabel (HGCYYMultiLineLabelHolder)
@property (nonatomic, assign) CGFloat hgcyy_lineSpacing;
@end
@implementation YYLabel (HGCYYMultiLineLabelHolder)
- (CGFloat)hgcyy_lineSpacing {
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}
- (void)setHgcyy_lineSpacing:(CGFloat)lineSpacing {
    objc_setAssociatedObject(self, @selector(hgcyy_lineSpacing), [NSNumber numberWithDouble:lineSpacing], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end


///////////////////////////////////////////////////////////////////////////////////////////


@interface HGCYYMultiLineLabelHolder ()

@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, assign) NSInteger numberOfLines;
@property (nonatomic, assign) CGFloat lineSpacing;

@property (nonatomic, strong) YYTextShadow *textShadow;
@property (nonatomic, copy) NSString *text;

@property (nonatomic, readwrite, strong) YYLabel *label;

@end

@implementation HGCYYMultiLineLabelHolder


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Init

+ (YYLabel *)multilineLabelWithFrame:(CGRect)frame
                                font:(UIFont *)font
                           textColor:(UIColor *)textColor
                       numberOfLines:(NSInteger)lines
                         lineSpacing:(CGFloat)lineSpacing
                       displaysAsync:(BOOL)async
{
    YYLabel *label = [YYLabel new];
    label.frame = frame;
    label.frame_height = font.lineHeight * lines + lineSpacing * (lines - 1);
    label.lineBreakMode = NSLineBreakByCharWrapping;
    label.font = font;
    label.textColor = textColor;
    label.numberOfLines = lines;
    label.hgcyy_lineSpacing = lineSpacing;
    label.displaysAsynchronously = async;
    return label;
}

- (instancetype)initWithLabel:(YYLabel *)label {
    self = [super init];
    if (self) {
        _label = label;
        
        _font = _label.font;
        _textColor = _label.textColor;
        _numberOfLines = _label.numberOfLines;
        _lineSpacing = _label.hgcyy_lineSpacing;
    }
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Properties Setter

- (void)setTextShadowWithColor:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius {
    YYTextShadow *shadow = [YYTextShadow new];
    shadow.color = color;
    shadow.offset = offset;
    shadow.radius = radius;
    self.textShadow = shadow;
}

- (void)setText:(NSString *)text {
    if (_text != text) {
        _text = [text copy];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Properties Getter

- (YYTextLayout *)textLayout {
    if (_text == nil || [_text hgc_isEmpty]) {
        return nil;
    }
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:_text];
    if (_textShadow) {
        attrStr.yy_textShadow = _textShadow;
    }
    attrStr.yy_font = _font;
    attrStr.yy_color = _textColor;
    attrStr.yy_lineSpacing = _lineSpacing;
    
    YYTextContainer *container = [YYTextContainer new];
    container.size = CGSizeMake(_label.frame_width, CGFLOAT_MAX);
    container.maximumNumberOfRows = _numberOfLines;
    
    YYTextLayout *layout = [YYTextLayout layoutWithContainer:container text:attrStr];
    return layout;
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Display

- (void)clearContent {
    _label.textLayout = nil;
}

- (void)displayAt:(CGRect)frame {
    [self displayAt:frame textLayout:[self textLayout]];
}

- (void)displayAt:(CGRect)frame textLayout:(YYTextLayout *)layout {
    _label.frame = frame;
    _label.frame_height = layout.textBoundingSize.height;
    _label.textLayout = layout;
}

@end

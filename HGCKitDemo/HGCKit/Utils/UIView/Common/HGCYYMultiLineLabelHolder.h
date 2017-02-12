//
//  HGCYYMultiLineLabelHolder.h
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/10/18.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYText/YYText.h>

@interface HGCYYMultiLineLabelHolder : NSObject

@property (nonatomic, readonly, strong) YYLabel *label;

#pragma mark - Init

+ (YYLabel *)multilineLabelWithFrame:(CGRect)frame
                                font:(UIFont *)font
                           textColor:(UIColor *)textColor
                       numberOfLines:(NSInteger)lines
                         lineSpacing:(CGFloat)lineSpacing
                       displaysAsync:(BOOL)async;
- (instancetype)initWithLabel:(YYLabel *)label;

#pragma mark - Properties Setter

- (void)setTextShadowWithColor:(UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius;
- (void)setText:(NSString *)text;

#pragma mark - Properties Getter

- (YYTextLayout *)textLayout;

#pragma mark - Display

- (void)clearContent;
- (void)displayAt:(CGRect)frame;
- (void)displayAt:(CGRect)frame textLayout:(YYTextLayout *)layout;

@end

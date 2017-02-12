//
//  HGCNavigationTitleView.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/8/18.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import "HGCNavigationTitleView.h"

@interface HGCNavigationTitleView ()
{
    CGRect m_frame;
}

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *logoImageView;

@end

@implementation HGCNavigationTitleView

#pragma mark - Init

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupWithTitle:nil textColor:nil font:nil logo:nil];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupWithTitle:nil textColor:nil font:nil logo:nil];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupWithTitle:nil textColor:nil font:nil logo:nil];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                    textColor:(UIColor *)color
                         font:(UIFont *)font
                         logo:(UIImage *)logoImage
{
    self = [super initWithFrame:frame];
    if (self) {
        m_frame = frame;
        [self setupWithTitle:title textColor:color font:font logo:logoImage];
    }
    return self;
}

- (void)setupWithTitle:(NSString *)title
             textColor:(UIColor *)color
                  font:(UIFont *)font
                  logo:(UIImage *)logoImage
{
    if (logoImage) {
        self.logoImageView = [[UIImageView alloc] initWithImage:logoImage];
        [self addSubview:_logoImageView];
        [_logoImageView makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.size.equalTo(CGSizeMake(65, 24));
        }];
    }
    else {
        self.titleLabel = [UILabel new];
        _titleLabel.textColor = color ?: [UIColor whiteColor];
        _titleLabel.font = font ?: [UIFont systemFontOfSize:18.0f];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = title;
        [self addSubview:_titleLabel];
        [_titleLabel makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.width.equalTo(CGRectGetWidth(m_frame));
            make.height.equalTo(CGRectGetHeight(m_frame));
        }];
    }
}

@end

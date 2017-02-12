//
//  HGCImageView.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/6/24.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "HGCImageView.h"

@interface HGCImageView ()

@property (nonatomic, strong) UITapGestureRecognizer *tapInSelf;
@property (nonatomic, copy) void (^tapInSelfActionBlock)();

@end

@implementation HGCImageView

#pragma mark - Init

/** 1.1.0 */

+ (instancetype)view {
    return [self viewWithImage:nil backgroundColor:nil];
}

+ (instancetype)viewWithImage:(UIImage *)image {
    return [self viewWithImage:image backgroundColor:nil];
}

+ (instancetype)viewWithImage:(UIImage *)image backgroundColor:(UIColor *)bgColor {
    return [[HGCImageView alloc] initWithImage:image backgroundColor:bgColor];
}

+ (instancetype)viewWithSensitiveImage:(UIImage *)image tapAction:(void (^)())block {
    return [[HGCImageView alloc] initWithSensitiveImage:image backgroundColor:nil tapAction:block];
}

/** 1.0.0 */

- (instancetype)initWithImage:(UIImage *)image backgroundColor:(UIColor *)bgColor {
    self = [super init];
    if (self) {
        self.image = image;
        self.backgroundColor = bgColor;
        self.clipsToBounds = YES;
        self.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}

- (instancetype)initWithSensitiveImage:(UIImage *)image
                       backgroundColor:(UIColor *)bgColor
                             tapAction:(void (^)())block
{
    self = [super init];
    if (self) {
        self.image = image;
        self.backgroundColor = bgColor;
        self.clipsToBounds = YES;
        self.contentMode = UIViewContentModeCenter;
        self.userInteractionEnabled = YES;
        
        _tapInSelfActionBlock = [block copy];
        self.tapInSelf = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapInSelfAction:)];
        [self addGestureRecognizer:_tapInSelf];
    }
    return self;
}

- (void)tapInSelfAction:(id)sender {
    _tapInSelf.enabled = NO;
    !_tapInSelfActionBlock ?: _tapInSelfActionBlock();
    _tapInSelf.enabled = YES;
}

@end

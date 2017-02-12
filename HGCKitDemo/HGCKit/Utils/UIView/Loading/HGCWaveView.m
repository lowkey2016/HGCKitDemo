//
//  HGCWaveView.m
//  HGCWaveDemo
//
//  Created by Jymn_Chen on 15/11/17.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "HGCWaveView.h"
#import "UIView+HGCFrameSugar.h"


///////////////////////////////////////////////////////////////////////////////////////////


static CGFloat const kHGCWaveAnimationDuration = 1.0f;
static CGFloat const kHGCWaveImageViewTopToValue = -8;
static CGFloat const kHGCWaveImageWidth = 320.0f;
static CGFloat const kHGCWaveImageHeight = 88.0f;

@interface HGCWaveView ()

@property (nonatomic, assign) BOOL continueAnimation;

@property (nonatomic, strong) UIImageView *waveImageView;

@end

@implementation HGCWaveView


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupWithFrame:frame];
    }
    return self;
}

- (void)setupWithFrame:(CGRect)frame {
    self.loadedPercent = 100;
    self.waveType = HGCWaveTypeGrowUp;
    self.backgroundColor = [UIColor whiteColor];
    self.clipsToBounds = YES;
    
    self.waveImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"com_wave"]];
    _waveImageView.frame = CGRectMake(0, 0, kHGCWaveImageWidth, kHGCWaveImageHeight);
    _waveImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_waveImageView];
    _waveImageView.frame_top = frame.size.height;
    _waveImageView.frame_right = 0;
}

#pragma mark - Dealloc

- (void)dealloc {
    _waveImageView = nil;
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - iVars Accessors

- (void)setCurrentPercent:(NSInteger)currentPercent {
    if (currentPercent > 100 || currentPercent < 0) {
        return;
    }
    
    if (_currentPercent != currentPercent) {
        _currentPercent = currentPercent;
        
        CGFloat height = self.frame_height;
        _waveImageView.frame_top = height - height * (currentPercent / 100.0f) + kHGCWaveImageViewTopToValue;
        _waveImageView.frame_left = 0 - kHGCWaveImageWidth * (100.0f - currentPercent) / 100.0f;
    }
}

#pragma mark - Animation

- (void)commitWaveAnimation {
    self.continueAnimation = YES;
    switch (_waveType) {
        case HGCWaveTypeGrowUp: {
            [self _hgc_commitGrowUpAnimation];
            break;
        }
        case HGCWaveTypeGrowDown: {
            [self _hgc_commitGrowDownAnimation];
            break;
        }
    }
}

- (void)_hgc_commitGrowUpAnimation {
    CGFloat height = self.frame_height;
    _waveImageView.frame_top = height;
    _waveImageView.frame_right = 0;
    [UIView animateWithDuration:kHGCWaveAnimationDuration animations:^{
        _waveImageView.frame_top = height - height * (_loadedPercent / 100.0f) + kHGCWaveImageViewTopToValue;
        _waveImageView.frame_left = 0;
    } completion:^(BOOL finished) {
        if (_continueAnimation) {
            [self _hgc_commitGrowUpAnimation];
        }
    }];
}

- (void)_hgc_commitGrowDownAnimation {
    
}

- (void)stopWaveAnimation {
    self.continueAnimation = NO;
}

@end

//
//  HGCRingView.m
//  CircleLoadingDemo
//
//  Created by Jymn_Chen on 15/11/27.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "HGCRingView.h"


///////////////////////////////////////////////////////////////////////////////////////////


#undef DEGREES_TO_RADOANS
#define DEGREES_TO_RADOANS(x) (M_PI * (x) / 180.0) // 将角度转为弧度

static CGFloat const kHGCShapeLayerLineWidth = 1.5f;
static CGFloat const kHGCStartAngle = 90;
static CGFloat const kHGCEndAngle = 89;

@interface HGCRingView ()

// 灰色背景遮罩
@property (nonatomic, strong) CAShapeLayer *bgMaskLayer;

// 白色线条
@property (nonatomic, strong) CAShapeLayer *whiteLineLayer;
// 白色填充遮罩
@property (nonatomic, strong) CAShapeLayer *whiteFillMaskLayer;
@property (nonatomic, strong) UIBezierPath *fillMaskBezierPath;

@end

@implementation HGCRingView


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Init

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.25];
    
    self.whiteLineLayer = [CAShapeLayer layer];
    _whiteLineLayer.backgroundColor = [UIColor whiteColor].CGColor;
    _whiteLineLayer.frame = self.bounds;
    [self.layer addSublayer:_whiteLineLayer];
    
    self.bgMaskLayer = [CAShapeLayer layer];
    _bgMaskLayer.frame = self.bounds;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2) radius:self.bounds.size.width / 3 startAngle:DEGREES_TO_RADOANS(kHGCStartAngle) endAngle:DEGREES_TO_RADOANS(kHGCEndAngle) clockwise:YES];
    _bgMaskLayer.lineWidth = kHGCShapeLayerLineWidth;
    _bgMaskLayer.path = path.CGPath;
    _bgMaskLayer.fillColor = [UIColor clearColor].CGColor;
    _bgMaskLayer.strokeColor = [UIColor blackColor].CGColor;
    _bgMaskLayer.lineCap = kCALineCapRound;
    self.layer.mask = _bgMaskLayer;
    
    self.fillMaskBezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2) radius:self.bounds.size.width / 3 startAngle:DEGREES_TO_RADOANS(kHGCStartAngle) endAngle:DEGREES_TO_RADOANS(kHGCEndAngle) clockwise:YES];
    self.whiteFillMaskLayer = [CAShapeLayer layer];
    _whiteFillMaskLayer.frame = self.bounds;
    _whiteFillMaskLayer.path = _fillMaskBezierPath.CGPath;
    _whiteFillMaskLayer.lineWidth = kHGCShapeLayerLineWidth + 0.5f;
    _whiteFillMaskLayer.fillColor = [UIColor clearColor].CGColor;
    _whiteFillMaskLayer.strokeColor = [UIColor blackColor].CGColor;
    _whiteFillMaskLayer.lineCap = kCALineCapRound;
    _whiteLineLayer.mask = _whiteFillMaskLayer;
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - iVars Accessors

- (void)setPercent:(CGFloat)percent {
    _percent = percent >= 0 ? percent : 0;
    
    NSInteger angle =  percent >= 1 ? kHGCEndAngle : (NSInteger)(kHGCStartAngle + 360 * percent) % 360;
    [_fillMaskBezierPath removeAllPoints];
    [_fillMaskBezierPath addArcWithCenter:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2) radius:self.bounds.size.width / 3 startAngle:DEGREES_TO_RADOANS(kHGCStartAngle) endAngle:DEGREES_TO_RADOANS(angle) clockwise:YES];
    _whiteFillMaskLayer.path = _fillMaskBezierPath.CGPath;
}

@end

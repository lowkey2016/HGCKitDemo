//
//  HGCLoadingViewController.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/9/8.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import "HGCLoadingViewController.h"
#import "UIColor+HGCUtil.h"


///////////////////////////////////////////////////////////////////////////////////////////


static NSString * const kHGCTransitionAnimation_selfview_trans = @"kHGCTransitionAnimation_selfview_trans";
static NSInteger const kHGCTransitionAnimation_imagesCount = 13;
static CGFloat const kHGCTransitionAnimatinon_duration_scaleFactor = 1.0f / 13;

@interface HGCLoadingViewController () <CAAnimationDelegate>
{
    NSInteger m_currentImageIndex;
}

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIImageView *loadingImageView;

@end

@implementation HGCLoadingViewController


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - View

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupData];
    [self setupMainView];
}

- (void)setupData {
    m_currentImageIndex = 1;
}

- (void)setupMainView {
    self.view.backgroundColor = HGCRGBHexColor(0xE3E4E8);
    
    self.containerView = [UIView new];
    _containerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_containerView];
    [_containerView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.loadingImageView = [UIImageView new];
    [_containerView addSubview:_loadingImageView];
    [_loadingImageView makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_containerView);
        make.size.equalTo(CGSizeMake(49, 59));
    }];
}

- (BOOL)changeLoadingImageView {
    NSInteger lastImgIndex = kHGCTransitionAnimation_imagesCount;
    if (m_currentImageIndex > lastImgIndex) {
        [self endLoading];
        
        return NO;
    }
    else {
        NSString *imgName = [NSString stringWithFormat:@"loading_%zd", m_currentImageIndex];
        self.loadingImageView.image = [UIImage imageNamed:imgName];
        m_currentImageIndex++;
        
        return YES;
    }
}

#pragma mark - Common Methods

- (CGFloat)loadingDuration {
    return 3.0f;
}

- (BOOL)canLoading {
    return [self loadingDuration] > 0;
}

- (void)willStartLoading {
    if ([self canLoading]) {
        self.view.hidden = NO;
        m_currentImageIndex = 1;
        self.loadingImageView.image = [UIImage imageNamed:@"loading_1"];
    }
}

- (void)startLoading {
    if ([self canLoading]) {
        [self transitionAnimation];
    }
}

- (void)startLoadingLater {
    if ([self canLoading]) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self transitionAnimation];
        });
    }
}

- (void)endLoading {
    self.view.hidden = YES;
    [self.view.layer removeAllAnimations];
    m_currentImageIndex = 1;
    self.loadingImageView.image = [UIImage imageNamed:@"loading_1"];
    
    !_loadingFinishBlock ?: _loadingFinishBlock();
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Animations

- (void)transitionAnimation {
    if ([self changeLoadingImageView]) {
        CATransition *anima = [CATransition animation];
        anima.type = kCATransitionFade;
        anima.subtype = kCATransitionFromRight;
        anima.duration = [self loadingDuration] * kHGCTransitionAnimatinon_duration_scaleFactor;
        anima.delegate = self;
        anima.removedOnCompletion = NO;
        [_containerView.layer addAnimation:anima forKey:kHGCTransitionAnimation_selfview_trans];
    }
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStart:(CAAnimation *)anim {
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [self transitionAnimation];
}

@end

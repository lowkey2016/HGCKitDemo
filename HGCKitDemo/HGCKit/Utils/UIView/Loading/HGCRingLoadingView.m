//
//  HGCRingLoadingView.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/11/27.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "HGCRingLoadingView.h"

#import "HGCRingView.h"


///////////////////////////////////////////////////////////////////////////////////////////


@interface HGCRingLoadingView ()

@property (nonatomic, strong) HGCRingView *ring;
@property (nonatomic, strong) UIActivityIndicatorView *spinner;

@end

@implementation HGCRingLoadingView


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
    self.ring = [[HGCRingView alloc] initWithFrame:self.bounds];
    _ring.percent = 0;
    [self addSubview:_ring];
    
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    _spinner.hidesWhenStopped = YES;
    [self addSubview:_spinner];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Public Methods

- (void)showWithoutLoading {
    if (self.hidden) {
        if ([_spinner isAnimating]) {
            [_spinner stopAnimating];
        }
        
        _ring.hidden = NO;
        _spinner.hidden = YES;
        self.hidden = NO;
    }
}

- (void)hideAndStopLoading {
    if (self.hidden == NO) {
        if ([_spinner isAnimating]) {
            [_spinner stopAnimating];
        }
        
        _ring.hidden = YES;
        _spinner.hidden = YES;
        self.hidden = YES;
    }
}

- (void)updateProgress:(CGFloat)progress {
    _ring.percent = progress;
}

- (void)startLoading {
    _ring.hidden = YES;
    _spinner.hidden = NO;
    [_spinner startAnimating];
}

@end

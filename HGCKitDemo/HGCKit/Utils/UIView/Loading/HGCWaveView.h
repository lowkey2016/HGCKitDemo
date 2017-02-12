//
//  HGCWaveView.h
//  HGCWaveDemo
//
//  Created by Jymn_Chen on 15/11/17.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HGCWaveType) {
    HGCWaveTypeGrowUp = 0,
    HGCWaveTypeGrowDown,
};

@interface HGCWaveView : UIView

@property (nonatomic, assign) NSInteger currentPercent;
@property (nonatomic, assign) NSInteger loadedPercent;
@property (nonatomic, assign) HGCWaveType waveType;

- (void)commitWaveAnimation;
- (void)stopWaveAnimation;

@end

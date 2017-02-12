//
//  HGCAnimationFactory.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/9/15.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import "HGCAnimationFactory.h"

@implementation HGCAnimationFactory

+ (CABasicAnimation *)basicAnimationWithKeyPath:(NSString *)keyPath
                                      fromValue:(id)fromValue
                                        toValue:(id)toValue
                                       duration:(CGFloat)duration
                                 timingFunction:(NSString *)timingFunction
                            removedOnCompletion:(BOOL)shouldRemove
                                       delegate:(id)aDelegate
                                    configBlock:(HGCAnimationConfigBlock)block
{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:keyPath];
    anim.fromValue = fromValue;
    anim.toValue = toValue;
    anim.duration = duration;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:timingFunction];
    anim.removedOnCompletion = shouldRemove;
    anim.delegate = aDelegate;
    !block ?: block();
    
    return anim;
}

+ (CAKeyframeAnimation *)keyframeAnimationWithKeyPath:(NSString *)keyPath
                                               values:(NSArray *)values
                                             duration:(CGFloat)duration
                                       timingFunction:(NSString *)timingFunction
                                  removedOnCompletion:(BOOL)shouldRemove
                                             delegate:(id)aDelegate
                                          configBlock:(HGCAnimationConfigBlock)block
{
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    anim.values = values;
    anim.duration = duration;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:timingFunction];
    anim.removedOnCompletion = shouldRemove;
    anim.delegate = aDelegate;
    !block ?: block();
    
    return anim;
}

@end

//
//  HGCAnimationFactory.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/9/15.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HGCAnimationConfigBlock)();

@interface HGCAnimationFactory : NSObject

+ (CABasicAnimation *)basicAnimationWithKeyPath:(NSString *)keyPath
                                      fromValue:(id)fromValue
                                        toValue:(id)toValue
                                       duration:(CGFloat)duration
                                 timingFunction:(NSString *)timingFunction
                            removedOnCompletion:(BOOL)shouldRemove
                                       delegate:(id)aDelegate
                                    configBlock:(HGCAnimationConfigBlock)block;

+ (CAKeyframeAnimation *)keyframeAnimationWithKeyPath:(NSString *)keyPath
                                               values:(NSArray *)values
                                             duration:(CGFloat)duration
                                       timingFunction:(NSString *)timingFunction
                                  removedOnCompletion:(BOOL)shouldRemove
                                             delegate:(id)aDelegate
                                          configBlock:(HGCAnimationConfigBlock)block;

@end

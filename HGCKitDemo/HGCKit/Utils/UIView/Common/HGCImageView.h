//
//  HGCImageView.h
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/6/24.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HGCImageView : UIImageView

/** 1.1.0 */

+ (instancetype)view;
+ (instancetype)viewWithImage:(UIImage *)image;
+ (instancetype)viewWithImage:(UIImage *)image backgroundColor:(UIColor *)bgColor;
+ (instancetype)viewWithSensitiveImage:(UIImage *)image tapAction:(void (^)())block;

/** 1.0.0 */

- (instancetype)initWithImage:(UIImage *)image backgroundColor:(UIColor *)bgColor;
- (instancetype)initWithSensitiveImage:(UIImage *)image
                       backgroundColor:(UIColor *)bgColor
                             tapAction:(void (^)())block;

@end

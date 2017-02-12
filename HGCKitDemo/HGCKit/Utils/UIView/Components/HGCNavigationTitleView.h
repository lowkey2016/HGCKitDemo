//
//  HGCNavigationTitleView.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/8/18.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HGCNavigationTitleView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                    textColor:(UIColor *)color
                         font:(UIFont *)font
                         logo:(UIImage *)logoImage;

@end

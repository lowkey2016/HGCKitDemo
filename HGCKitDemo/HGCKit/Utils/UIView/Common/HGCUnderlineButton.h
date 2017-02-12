//
//  HGCUnderlineButton.h
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/8/26.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HGCFontFactory.h"

@interface HGCUnderlineButton : UIButton

+ (instancetype)buttonWithTitle:(NSString *)title
                       fontSize:(CGFloat)fontSize
                       fontType:(HGCFontType)fontType
                      textColor:(UIColor *)textColor;

// default control events: UIControlEventTouchUpInside
- (void)addAction:(void (^)(id sender))action;
- (void)removeCurrentAction;
- (void)addTarget:(id)target action:(SEL)action;
- (void)removeTarget:(id)target action:(SEL)action;

@end

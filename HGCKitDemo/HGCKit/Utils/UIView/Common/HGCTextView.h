//
//  HGCTextView.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/12/14.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HGCFontFactory.h"

@interface HGCTextView : UITextView

+ (instancetype)staticViewWithTextColor:(UIColor *)textColor
                               fontSize:(CGFloat)fontSize
                               fontType:(HGCFontType)fontType;

+ (instancetype)viewWithTextColor:(UIColor *)textColor
                         fontSize:(CGFloat)fontSize
                         fontType:(HGCFontType)fontType
                        alignment:(NSTextAlignment)alignment
                     contentInset:(UIEdgeInsets)inset
                         delegate:(id<UITextViewDelegate>)delegate
                         editable:(BOOL)editable
                       selectable:(BOOL)selectable
                    scrollEnabled:(BOOL)scrollEnabled
                showsHorIndicator:(BOOL)showsHorIndicator
                showsVerIndicator:(BOOL)showsVerIndicator;

@end

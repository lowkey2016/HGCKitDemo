//
//  UIAlertView+SBNCBlockConfig.h
//  AlertViewDemo
//
//  Created by Jymn_Chen on 15/6/7.
//  Copyright (c) 2015年 com.jymnchen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBNCAlertViewItem.h"

@interface UIAlertView (SBNCBlockConfig)

/**
 *  items的所有元素必须为SBNCAlertViewItem类
 *  默认最后一个对象为cancelItem，否则生成默认的cancelItem
 *
 *  如果items为nil或@[]，则使用默认的UIAlertView，delegate为nil
 */
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                        items:(NSArray *)items;

@end

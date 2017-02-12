//
//  UIActionSheet+SBNCBlockConfig.h
//  ActionSheetBlock
//
//  Created by Jymn_Chen on 15/10/29.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBNCActionSheetItem.h"

@interface UIActionSheet (SBNCBlockConfig) <UIActionSheetDelegate>

/**
 *  items的所有元素必须为SBNCActionSheetItem类
 *  默认第一个对象为confirmItem，否则生成默认的confirmItem
 *  默认最后一个对象为cancelItem，否则生成默认的cancelItem
 *
 *  如果items为nil或@[]，则使用默认的UIActionSheet，delegate为nil
 *  传入格式如：@[confirmItem, item1, item2, cancelItem]
 */
- (instancetype)initWithTitle:(NSString *)title items:(NSArray *)items;

@end

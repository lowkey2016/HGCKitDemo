//
//  SBNCAlertViewItem.h
//  AlertViewDemo
//
//  Created by Jymn_Chen on 15/6/7.
//  Copyright (c) 2015年 com.jymnchen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SBNCAlertViewItemAction)(void);

@interface SBNCAlertViewItem : NSObject

- (instancetype)initWithTitle:(NSString *)title
                       action:(SBNCAlertViewItemAction)action;

- (instancetype)initWithTitle:(NSString *)title
                       action:(SBNCAlertViewItemAction)action
                 isCancelItem:(BOOL)isCancel;

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) SBNCAlertViewItemAction action;
@property (nonatomic, readonly, assign) BOOL isCancelItem;

@end

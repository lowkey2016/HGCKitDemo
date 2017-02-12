//
//  SBNCAlertViewItem.m
//  AlertViewDemo
//
//  Created by Jymn_Chen on 15/6/7.
//  Copyright (c) 2015年 com.jymnchen. All rights reserved.
//

#import "SBNCAlertViewItem.h"

@interface SBNCAlertViewItem ()

@property (nonatomic, readwrite, copy) NSString *title;
@property (nonatomic, readwrite, copy) SBNCAlertViewItemAction action;
@property (nonatomic, readwrite, assign) BOOL isCancelItem;

@end

@implementation SBNCAlertViewItem

- (instancetype)initWithTitle:(NSString *)title action:(SBNCAlertViewItemAction)action {
    return [self initWithTitle:title action:action isCancelItem:NO];
}

- (instancetype)initWithTitle:(NSString *)title
                       action:(SBNCAlertViewItemAction)action
                 isCancelItem:(BOOL)isCancel
{
    self = [super init];
    if (self) {
        _title = [title copy];
        _action = [action copy];
        _isCancelItem = isCancel;
    }
    return self;
}

@end

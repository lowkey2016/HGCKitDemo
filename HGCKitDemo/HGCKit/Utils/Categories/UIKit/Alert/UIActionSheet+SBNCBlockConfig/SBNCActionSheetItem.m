//
//  SBNCActionSheetItem.m
//  ActionSheetBlock
//
//  Created by Jymn_Chen on 15/10/29.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "SBNCActionSheetItem.h"

@interface SBNCActionSheetItem ()

@property (nonatomic, readwrite, copy) NSString *title;
@property (nonatomic, readwrite, copy) SBNCActionSheetItemAction action;
@property (nonatomic, readwrite, assign) BOOL isCancelItem;
@property (nonatomic, readwrite, assign) BOOL isConfirmItem;

@end

@implementation SBNCActionSheetItem

- (instancetype)initWithTitle:(NSString *)title action:(SBNCActionSheetItemAction)action {
    return [self initWithTitle:title action:action isCancelItem:NO isConfirmItem:NO];
}

- (instancetype)initWithTitle:(NSString *)title
                       action:(SBNCActionSheetItemAction)action
                 isCancelItem:(BOOL)isCancel
{
    return [self initWithTitle:title action:action isCancelItem:YES isConfirmItem:NO];
}

- (instancetype)initWithTitle:(NSString *)title
                       action:(SBNCActionSheetItemAction)action
                isConfirmItem:(BOOL)isConfirm
{
    return [self initWithTitle:title action:action isCancelItem:NO isConfirmItem:YES];
}

- (instancetype)initWithTitle:(NSString *)title
                       action:(SBNCActionSheetItemAction)action
                 isCancelItem:(BOOL)isCancel
                isConfirmItem:(BOOL)isConfirm
{
    if (isCancel == YES && isConfirm == YES) {
        return nil;
    }
    
    self = [super init];
    if (self) {
        _title = [title copy];
        _action = [action copy];
        _isCancelItem = isCancel;
        _isConfirmItem = isConfirm;
    }
    return self;
}

@end

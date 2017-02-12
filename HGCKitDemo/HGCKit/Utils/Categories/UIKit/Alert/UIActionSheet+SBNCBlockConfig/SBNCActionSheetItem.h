//
//  SBNCActionSheetItem.h
//  ActionSheetBlock
//
//  Created by Jymn_Chen on 15/10/29.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SBNCActionSheetItemAction)(void);

@interface SBNCActionSheetItem : NSObject

- (instancetype)initWithTitle:(NSString *)title
                       action:(SBNCActionSheetItemAction)action;

- (instancetype)initWithTitle:(NSString *)title
                       action:(SBNCActionSheetItemAction)action
                 isCancelItem:(BOOL)isCancel;

- (instancetype)initWithTitle:(NSString *)title
                       action:(SBNCActionSheetItemAction)action
                isConfirmItem:(BOOL)isConfirm;

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) SBNCActionSheetItemAction action;
@property (nonatomic, readonly, assign) BOOL isCancelItem;
@property (nonatomic, readonly, assign) BOOL isConfirmItem;

@end

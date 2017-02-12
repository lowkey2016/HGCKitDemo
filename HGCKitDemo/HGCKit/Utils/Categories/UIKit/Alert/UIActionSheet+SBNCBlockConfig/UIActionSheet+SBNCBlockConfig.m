//
//  UIActionSheet+SBNCBlockConfig.m
//  ActionSheetBlock
//
//  Created by Jymn_Chen on 15/10/29.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "UIActionSheet+SBNCBlockConfig.h"
#import <objc/runtime.h>


///////////////////////////////////////////////////////////////////////////////////////////


#define SBNCDefaultActionSheet(title)  [[UIActionSheet alloc] initWithTitle:title delegate:nil cancelButtonTitle:@"确定" destructiveButtonTitle:nil otherButtonTitles:nil, nil]

@interface UIActionSheet (_SBNCBlockConfig)

@property (nonatomic, copy) NSArray *sbnc_allItems;

@end

@implementation UIActionSheet (SBNCBlockConfig)


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - C Functions

BOOL SBNCIsSBNCActionSheetItemClass(id object) {
    return [object isKindOfClass:[SBNCActionSheetItem class]];
}

#pragma mark - Getters and Setters

- (NSArray *)sbnc_allItems {
    // _cmd表示当前方法的@selector
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setSbnc_allItems:(NSArray *)allItems {
    // 第二个参数是const void *key
    // SEL类型的定义: typedef struct objc_selector *SEL
    // SEL是一个结构体指针，所以可以用作该参数
    objc_setAssociatedObject(self, @selector(sbnc_allItems), allItems, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Init

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
- (instancetype)initWithTitle:(NSString *)title items:(NSArray *)items {
    if (items == nil || [items isKindOfClass:[NSArray class]] == NO || [items count] == 0) {
        return SBNCDefaultActionSheet(title);
    }
    for (__unused id aItem in items) {
        NSAssert(SBNCIsSBNCActionSheetItemClass(aItem), @"Not SBNCActionSheetItem Class");
    }
    
    SBNCActionSheetItem *confirmItem = nil;
    SBNCActionSheetItem *firstItem = [items firstObject];
    if (firstItem.isConfirmItem == NO) {
        NSString *confirmTitle = @"确定";
        confirmItem = [[SBNCActionSheetItem alloc] initWithTitle:confirmTitle action:nil];
    }
    else {
        confirmItem = firstItem;
    }
    
    SBNCActionSheetItem *cancelItem = nil;
    SBNCActionSheetItem *lastItem = [items lastObject];
    if (lastItem.isCancelItem == NO) {
        NSString *cancelTitle = @"取消";
        cancelItem = [[SBNCActionSheetItem alloc] initWithTitle:cancelTitle action:nil];
    }
    else {
        cancelItem = lastItem;
    }
    
    // 必须在initXXXX方法中，才能使用init方法对self赋值，否则会报错
    self = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:cancelItem.title destructiveButtonTitle:confirmItem.title otherButtonTitles:nil, nil];
    if (self == nil) {
        return nil;
    }
    
    NSMutableArray *allItems = [NSMutableArray arrayWithArray:items];
    if (firstItem.isConfirmItem == NO) {
        [allItems insertObject:confirmItem atIndex:0];
    }
    if (lastItem.isCancelItem == NO) {
        [allItems addObject:cancelItem];
    }
    [self setSbnc_allItems:[allItems copy]];
    for (NSInteger i = 1; i < allItems.count - 1; i++) {
        SBNCActionSheetItem *aItem = allItems[i];
        [self addButtonWithTitle:aItem.title];
    }
    
    // 由于初始化时self == nil，所以设置在
    // initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:方法中设置的delegate无效
    // 所以这里要再次设置self.delegate = self
    self.delegate = self;
    
    return self;
}
#pragma clang diagnostic pop


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSArray *allItems = [self sbnc_allItems];
    if (buttonIndex == 0) {
        SBNCActionSheetItem *confirmItem = [allItems firstObject];
        !confirmItem.action ?: confirmItem.action();
    }
    else if (buttonIndex == 1) {
        SBNCActionSheetItem *cancelItem = [allItems lastObject];
        !cancelItem.action ?: cancelItem.action();
    }
    else {
        SBNCActionSheetItem *aItem = allItems[buttonIndex - 1];
        !aItem.action ?: aItem.action();
    }
}

@end

//
//  UIAlertView+SBNCBlockConfig.m
//  AlertViewDemo
//
//  Created by Jymn_Chen on 15/6/7.
//  Copyright (c) 2015年 com.jymnchen. All rights reserved.
//

#import "UIAlertView+SBNCBlockConfig.h"
#import <objc/runtime.h>


///////////////////////////////////////////////////////////////////////////////////////////


#define SBNCDefaultAlertView(title, message)    [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil]

@interface UIAlertView (_SBNCBlockConfig)

@property (nonatomic, copy) NSArray *sbnc_allItems;

@end

@implementation UIAlertView (SBNCBlockConfig)


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - C Functions

BOOL SBNCIsSBNCAlertViewItemClass(id object) {
    return [object isKindOfClass:[SBNCAlertViewItem class]];
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
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message items:(NSArray *)items {
    if (items == nil || [items isKindOfClass:[NSArray class]] == NO || [items count] == 0) {
        return SBNCDefaultAlertView(title, message);
    }
    for (__unused id aItem in items) {
        NSAssert(SBNCIsSBNCAlertViewItemClass(aItem), @"Not SBNCAlertItem Class");
    }
    
    SBNCAlertViewItem *cancelItem = nil;
    SBNCAlertViewItem *lastItem = [items lastObject];
    if (lastItem.isCancelItem == NO) {
        NSString *cancelTitle = ([items count] > 0) ? @"取消" : @"确定";
        cancelItem = [[SBNCAlertViewItem alloc] initWithTitle:cancelTitle action:nil];
    }
    else {
        cancelItem = lastItem;
    }
    // 必须在initXXXX方法中，才能使用init方法对self赋值，否则会报错
    self = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelItem.title otherButtonTitles:nil, nil];
    if (self == nil) {
        return nil;
    }
    
    NSArray *allItems = nil;
    if (lastItem.isCancelItem == NO) {
        allItems = [items arrayByAddingObject:cancelItem];
    }
    else {
        allItems = items;
    }
    [self setSbnc_allItems:allItems];
    for (NSInteger i = 0; i < allItems.count - 1; i++) {
        SBNCAlertViewItem *aItem = allItems[i];
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


#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSArray *allItems = [self sbnc_allItems];
    if (buttonIndex == 0) {
        SBNCAlertViewItem *cancelItem = [allItems lastObject];
        !cancelItem.action ?: cancelItem.action();
    }
    else {
        SBNCAlertViewItem *aItem = allItems[buttonIndex - 1];
        !aItem.action ?: aItem.action();
    }
}

@end

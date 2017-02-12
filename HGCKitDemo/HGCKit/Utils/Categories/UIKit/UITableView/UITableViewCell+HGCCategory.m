//
//  UITableViewCell+HGCCategory.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/7/24.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import "UITableViewCell+HGCCategory.h"

@implementation UITableViewCell (HGCCategory)

#pragma mark - Nib

+ (UINib *)hgc_nib {
    // [self class]会由调用的类决定
    Class cellClass = [self class];
    return [UINib nibWithNibName:NSStringFromClass(cellClass) bundle:[NSBundle mainBundle]];
}

@end

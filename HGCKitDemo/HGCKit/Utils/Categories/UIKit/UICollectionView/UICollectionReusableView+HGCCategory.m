//
//  UICollectionReusableView+HGCCategory.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/8/14.
//  Copyright (c) 2015年 com.youmi. All rights reserved.
//

#import "UICollectionReusableView+HGCCategory.h"

@implementation UICollectionReusableView (HGCCategory)

+ (UINib *)hgc_nib {
    // [self class]会由调用的类决定
    Class cellClass = [self class];
    return [UINib nibWithNibName:NSStringFromClass(cellClass) bundle:[NSBundle mainBundle]];
}

@end

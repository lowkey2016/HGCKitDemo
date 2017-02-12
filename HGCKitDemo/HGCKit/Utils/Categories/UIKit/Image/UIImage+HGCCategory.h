//
//  UIImage+HGCCategory.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/11/22.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HGCCategory)

- (instancetype)hgc_cropWithSize:(CGSize)size corners:(UIRectCorner)corners radius:(CGFloat)radius;

- (NSData *)hgc_JPEGOrPNGDataWithRepresentation:(CGFloat)rep;

@end

//
//  UIImage+HGCCategory.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/11/22.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "UIImage+HGCCategory.h"

@implementation UIImage (HGCCategory)

- (instancetype)hgc_cropWithSize:(CGSize)size corners:(UIRectCorner)corners radius:(CGFloat)radius {
    if (CGSizeEqualToSize(size, CGSizeZero) == NO &&
        corners != 0 &&
        (NSInteger)radius > 0)
    {
        CGFloat scale = [[UIScreen mainScreen] scale];
        UIGraphicsBeginImageContextWithOptions(size, NO, scale);
        CGRect drawingRect = (CGRect){CGPointZero, size};
        [[UIBezierPath bezierPathWithRoundedRect:drawingRect byRoundingCorners:(UIRectCorner)corners cornerRadii:CGSizeMake(radius, radius)] addClip];
        [self drawInRect:drawingRect];
        UIImage *cropedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return cropedImage;
    }
    else {
        return self;
    }
}

- (NSData *)hgc_JPEGOrPNGDataWithRepresentation:(CGFloat)rep {
    rep = MAX(MIN(rep, 1), 0);
    NSData *imgData = UIImageJPEGRepresentation(self, rep);
    if (imgData == nil) {
        imgData = UIImagePNGRepresentation(self);
    }
    return imgData;
}

@end

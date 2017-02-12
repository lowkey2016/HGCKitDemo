//
//  UIImageView+HGCWebImage.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/11/20.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/SDWebImageManager.h>
#import <NYXImagesKit/NYXImagesKit.h>

typedef NS_OPTIONS(NSInteger, HGCRectCorner) {
    HGCRectCornerNone           = 0,
    HGCRectCornerTopLeft        = 1 << 0,
    HGCRectCornerTopRight       = 1 << 1,
    HGCRectCornerBottomLeft     = 1 << 2,
    HGCRectCornerBottomRight    = 1 << 3,
    HGCRectCornerAll            = HGCRectCornerTopLeft|HGCRectCornerTopRight|HGCRectCornerBottomLeft|HGCRectCornerBottomRight,
};

@interface UIImageView (HGCWebImage)

#pragma mark - Set Image with URL

- (void)hgc_setImageWithURLString:(NSString *)urlstring
                 placeholderImage:(UIImage *)placeholderImg;

- (void)hgc_setImageWithURLString:(NSString *)urlstring
                 placeholderImage:(UIImage *)placeholderImg
                    loadFailImage:(UIImage *)loadFailImg;

- (void)hgc_setImageWithURLString:(NSString *)urlstring
                 placeholderImage:(UIImage *)placeholderImg
                    loadFailImage:(UIImage *)loadFailImg
                  scaleToFillSize:(CGSize)sizeToFill;

- (void)hgc_setImageWithURLString:(NSString *)urlstring
             placeholderImageName:(NSString *)placeholderImgName
                loadFailImageName:(NSString *)loadFailImgName
            roundingDefaultImages:(BOOL)shouldRounding
                  scaleToFillSize:(CGSize)sizeToFill
                  roundingCorners:(HGCRectCorner)corners
                      cornerRadii:(CGFloat)radius;

- (void)hgc_setImageWithURLString:(NSString *)urlstring
                 placeholderImage:(UIImage *)placeholderImg
                    loadFailImage:(UIImage *)loadFailImg
                  scaleToFillSize:(CGSize)sizeToFill
                  roundingCorners:(HGCRectCorner)corners
                      cornerRadii:(CGFloat)radius;

#pragma mark - Set Image with Name

- (void)hgc_setImageWithName:(NSString *)imgName
            placeholderImage:(UIImage *)placeholderImg
             scaleToFillSize:(CGSize)sizeToFill
             roundingCorners:(HGCRectCorner)corners
                 cornerRadii:(CGFloat)radius;

#pragma mark - Get Image

+ (void)hgc_getImageWithURLString:(NSString *)urlstring
                 placeholderImage:(UIImage *)placeholderImg
                    loadFailImage:(UIImage *)loadFailImg
                  scaleToFillSize:(CGSize)sizeToFill
                  roundingCorners:(HGCRectCorner)corners
                      cornerRadii:(CGFloat)radius
                  completionBlock:(void (^)(UIImage *callbackImage))completionBlock;

@end

//
//  UIImageView+HGCWebImage.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/11/20.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "UIImageView+HGCWebImage.h"
#import "HGCFoundationUtil.h"
#import "UIView+WebCacheOperation.h"

static NSString * const kHGCImageLoadOperationKey = @"HGCImageViewImageLoad";

@implementation UIImageView (HGCWebImage)


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Toolkit Methods

static inline UIImage *HGCWebImage_cropImage(UIImage *srcImage, CGSize size, CGFloat scale, UIRectCorner corners, CGFloat radius)
{
    if (srcImage &&
        CGSizeEqualToSize(size, CGSizeZero) == NO &&
        corners != HGCRectCornerNone &&
        (NSInteger)radius > 0)
    {
        UIGraphicsBeginImageContextWithOptions(size, NO, scale);
        CGRect drawingRect = (CGRect){CGPointZero, size};
        [[UIBezierPath bezierPathWithRoundedRect:drawingRect byRoundingCorners:(UIRectCorner)corners cornerRadii:CGSizeMake(radius, radius)] addClip];
        [srcImage drawInRect:drawingRect];
        UIImage *cropedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return cropedImage;
    }
    else {
        return nil;
    }
}

static inline UIImage *HGCWebImage_scaleToFillAndCropImage(UIImage *srcImage, CGSize sizeToFill, UIRectCorner corners, CGFloat radius)
{
    UIImage *desImage;
    if (CGSizeEqualToSize(sizeToFill, CGSizeZero)) { // 不需要拉伸和裁剪
        desImage = srcImage;
    }
    else {
        CGFloat scale = [[UIScreen mainScreen] scale];
        
        // 先拉伸图片
        desImage = [srcImage scaleToFillSize:CGSizeMake(sizeToFill.width * scale, sizeToFill.height * scale)];
        
        // 再按需裁剪图片
        UIImage *cropedImg = HGCWebImage_cropImage(desImage, sizeToFill, scale, (UIRectCorner)corners, radius);
        if (cropedImg) {
            desImage = cropedImg;
        }
    }
    return desImage;
}

static inline NSString *HGCWebImage_keyForCache(NSString *name, CGSize sizeToFill, HGCRectCorner corners, CGFloat radius)
{
    /*
     *  key的生成规则：
     *
     *  if (size == CGSizeZero)
     *      key = urlstring
     *  else
     *      key = [urlstring]_[size.width]-[size.height]_[corners]
     */
    
    if ([HGCFoundationUtil isStringEmpty:name]) {
        return nil;
    }
    
    if (CGSizeEqualToSize(sizeToFill, CGSizeZero)) {
        return name;
    }
    else {
        return [NSString stringWithFormat:@"%@_%zd-%zd_c%zd_r%zd", name, (NSInteger)(sizeToFill.width), (NSInteger)(sizeToFill.height), (NSInteger)corners, (NSInteger)radius];
    }
}

static inline CGSize HGCWebImage_integerSize(CGSize size) {
    return CGSizeMake((NSInteger)(size.width), (NSInteger)(size.height));
}

#define HGCWebImage_validNotNilVars(v1, v2) \
    if (v1 == nil || v2 == nil) {   \
        if (v1 == nil && v2) {      \
            v1 = v2;                \
        }                           \
        if (v2 == nil && v1) {      \
            v2 = v1;                \
        }                           \
    }


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Set Image with URL

- (void)hgc_setImageWithURLString:(NSString *)urlstring
                 placeholderImage:(UIImage *)placeholderImg
{
    [self hgc_setImageWithURLString:urlstring
                   placeholderImage:placeholderImg
                      loadFailImage:placeholderImg];
}

- (void)hgc_setImageWithURLString:(NSString *)urlstring
                 placeholderImage:(UIImage *)placeholderImg
                    loadFailImage:(UIImage *)loadFailImg
{
    [self hgc_setImageWithURLString:urlstring
                   placeholderImage:placeholderImg
                      loadFailImage:loadFailImg
                    scaleToFillSize:CGSizeZero];
}

- (void)hgc_setImageWithURLString:(NSString *)urlstring
                 placeholderImage:(UIImage *)placeholderImg
                    loadFailImage:(UIImage *)loadFailImg
                  scaleToFillSize:(CGSize)sizeToFill
{
    [self hgc_setImageWithURLString:urlstring
                   placeholderImage:placeholderImg
                      loadFailImage:loadFailImg
                    scaleToFillSize:sizeToFill
                    roundingCorners:HGCRectCornerNone
                        cornerRadii:0];
}

- (void)hgc_setImageWithURLString:(NSString *)urlstring
             placeholderImageName:(NSString *)placeholderImgName
                loadFailImageName:(NSString *)loadFailImgName
            roundingDefaultImages:(BOOL)shouldRounding
                  scaleToFillSize:(CGSize)sizeToFill
                  roundingCorners:(HGCRectCorner)corners
                      cornerRadii:(CGFloat)radius
{
    HGCWebImage_validNotNilVars(placeholderImgName, loadFailImgName)
    UIImage *desPlaceholderImg = [UIImage imageNamed:placeholderImgName];
    UIImage *desLoadfailImg = [UIImage imageNamed:loadFailImgName];
    
    if (desPlaceholderImg && desLoadfailImg && shouldRounding &&
        CGSizeEqualToSize(sizeToFill, CGSizeZero) == NO &&
        corners != HGCRectCornerNone &&
        (NSInteger)radius > 0)
    {
        UIImage *placeholderImg;
        UIImage *loadfailImg;
        
        NSString *keyForPlaceholderImg = HGCWebImage_keyForCache(placeholderImgName, sizeToFill, corners, radius);
        placeholderImg = [[[SDWebImageManager sharedManager] imageCache] imageFromDiskCacheForKey:keyForPlaceholderImg];
        if (placeholderImg == nil) {
            placeholderImg = HGCWebImage_scaleToFillAndCropImage(desPlaceholderImg, sizeToFill, (UIRectCorner)corners, radius);
            [[[SDWebImageManager sharedManager] imageCache] storeImage:placeholderImg forKey:keyForPlaceholderImg toDisk:YES];
        }
        
        NSString *keyForLoadFailImg = HGCWebImage_keyForCache(loadFailImgName, sizeToFill, corners, radius);
        loadfailImg = [[[SDWebImageManager sharedManager] imageCache] imageFromDiskCacheForKey:keyForLoadFailImg];
        if (loadfailImg == nil) {
            loadfailImg = HGCWebImage_scaleToFillAndCropImage(desLoadfailImg, sizeToFill, (UIRectCorner)corners, radius);
            [[[SDWebImageManager sharedManager] imageCache] storeImage:loadfailImg forKey:keyForLoadFailImg toDisk:YES];
        }
        
        if (placeholderImg) {
            desPlaceholderImg = placeholderImg;
        }
        if (loadfailImg) {
            desLoadfailImg = loadfailImg;
        }
    }
    
    [self hgc_setImageWithURLString:urlstring
                   placeholderImage:desPlaceholderImg
                      loadFailImage:desLoadfailImg
                    scaleToFillSize:sizeToFill
                    roundingCorners:corners
                        cornerRadii:radius];
}

- (void)hgc_setImageWithURLString:(NSString *)urlstring
                 placeholderImage:(UIImage *)placeholderImg
                    loadFailImage:(UIImage *)loadFailImg
                  scaleToFillSize:(CGSize)sizeToFill
                  roundingCorners:(HGCRectCorner)corners
                      cornerRadii:(CGFloat)radius
{
    /**
     *  检查占位图片是否为空
     */
    HGCWebImage_validNotNilVars(placeholderImg, loadFailImg)
    
    
    /**
     *  先取消之前加载的请求，避免之前的图片请求回调导致图片加载错乱
     */
    [self sd_cancelImageLoadOperationWithKey:kHGCImageLoadOperationKey];
    
    
    /**
     *  首先过滤空白URL
     */
    if ([HGCFoundationUtil isStringEmpty:urlstring]) {
        NSLog(@"[WARNING] Image loading : url is empty");
        self.image = loadFailImg;
        
        return;
    }
    
    
    /**
     *  sizeToFill 的 width/height 设置为整数，防止出现像素不对齐的问题
     */
    sizeToFill = HGCWebImage_integerSize(sizeToFill);
    
    
    /**
     *  生成读取缓存的key
     */
    NSString *keyForCachedImg = HGCWebImage_keyForCache(urlstring, sizeToFill, corners, radius);
    
    
    /**
     *  读缓存
     */
    UIImage *cachedImage = [[[SDWebImageManager sharedManager] imageCache] imageFromDiskCacheForKey:keyForCachedImg];
    if (cachedImage) {
        self.image = cachedImage;
        
        // 如果缓存存在，就直接返回
        return;
    }
    self.image = placeholderImg;
    
    
    /**
     *  从网络下载最新的图片，然后缓存起来并更新到界面
     */
    id <SDWebImageOperation> operation = [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:urlstring] options:SDWebImageRetryFailed|SDWebImageProgressiveDownload|SDWebImageRefreshCached|SDWebImageAllowInvalidSSLCertificates progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        
        if ([urlstring isEqualToString:imageURL.absoluteString] == NO) {
            NSLog(@"[WARN] Download Web Image: callback urlstring is error");
            return;
        }
        
        if (image && error == nil && finished) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                // 先拉伸并裁剪图片
                UIImage *desImage = HGCWebImage_scaleToFillAndCropImage(image, sizeToFill, (UIRectCorner)corners, radius);
                
                // 缓存起来，并更新到界面
                if (desImage) {
                    [[[SDWebImageManager sharedManager] imageCache] storeImage:desImage forKey:keyForCachedImg toDisk:YES];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.image = desImage;
                    });
                }
                else {
                    NSLog(@"[ERROR] Download Web Image: des image is nil");
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.image = loadFailImg;
                    });
                }
            });
        }
        else {
            NSLog(@"[ERROR] Download Web Image: error = %@", error);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.image = loadFailImg;
            });
        }
    }];
    if (operation) {
        [self sd_setImageLoadOperation:operation forKey:kHGCImageLoadOperationKey];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Set Image with Name

- (void)hgc_setImageWithName:(NSString *)imgName
            placeholderImage:(UIImage *)placeholderImg
             scaleToFillSize:(CGSize)sizeToFill
             roundingCorners:(HGCRectCorner)corners
                 cornerRadii:(CGFloat)radius
{
    /**
     *  首先过滤空白图片名
     */
    if ([HGCFoundationUtil isStringEmpty:imgName]) {
        NSLog(@"[WARNING] Image loading : name is empty");
        self.image = placeholderImg;
        
        return;
    }
    
    
    /**
     *  sizeToFill 的 width/height 设置为整数，防止出现像素不对齐的问题
     */
    sizeToFill = HGCWebImage_integerSize(sizeToFill);
    
    
    /**
     *  生成读取缓存的key
     */
    NSString *keyForCachedImg = HGCWebImage_keyForCache(imgName, sizeToFill, corners, radius);
    
    
    /**
     *  读缓存
     */
    UIImage *cachedImage = [[[SDWebImageManager sharedManager] imageCache] imageFromDiskCacheForKey:keyForCachedImg];
    if (cachedImage) {
        // 如果缓存存在，就直接返回
        self.image = cachedImage;
        
        return;
    }
    
    
    /**
     *  对图片进行加工处理，然后缓存起来并更新到界面
     */
    UIImage *localImg = [UIImage imageNamed:imgName];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 先拉伸并裁剪图片
        UIImage *desImage = HGCWebImage_scaleToFillAndCropImage(localImg, sizeToFill, (UIRectCorner)corners, radius);
        
        // 缓存起来，并更新到界面
        if (desImage) {
            [[[SDWebImageManager sharedManager] imageCache] storeImage:desImage forKey:keyForCachedImg toDisk:YES];
        }
        else {
            desImage = placeholderImg;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = desImage;
        });
    });
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Get Image

+ (void)hgc_getImageWithURLString:(NSString *)urlstring
                 placeholderImage:(UIImage *)placeholderImg
                    loadFailImage:(UIImage *)loadFailImg
                  scaleToFillSize:(CGSize)sizeToFill
                  roundingCorners:(HGCRectCorner)corners
                      cornerRadii:(CGFloat)radius
                  completionBlock:(void (^)(UIImage *))completionBlock
{
    /**
     *  检查占位图片是否为空
     */
    HGCWebImage_validNotNilVars(placeholderImg, loadFailImg)
    
    
    /**
     *  首先过滤空白URL
     */
    if ([HGCFoundationUtil isStringEmpty:urlstring]) {
        NSLog(@"[WARNING] Image loading : url is empty");
        !completionBlock ?: completionBlock(loadFailImg);
        
        return;
    }
    
    
    /**
     *  sizeToFill 的 width/height 设置为整数，防止出现像素不对齐的问题
     */
    sizeToFill = HGCWebImage_integerSize(sizeToFill);
    
    
    /**
     *  生成读取缓存的key
     */
    NSString *keyForCachedImg = HGCWebImage_keyForCache(urlstring, sizeToFill, corners, radius);
    
    
    /**
     *  读缓存
     */
    UIImage *cachedImage = [[[SDWebImageManager sharedManager] imageCache] imageFromDiskCacheForKey:keyForCachedImg];
    if (cachedImage) {
        !completionBlock ?: completionBlock(cachedImage);
        
        // 如果缓存存在，就直接返回
        return;
    }
    
    
    /**
     *  从网络下载最新的图片，然后缓存起来并更新到界面
     */
    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:urlstring] options:SDWebImageRetryFailed|SDWebImageProgressiveDownload|SDWebImageRefreshCached|SDWebImageAllowInvalidSSLCertificates progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        
        if (image && error == nil && finished) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                // 先拉伸并裁剪图片
                UIImage *desImage = HGCWebImage_scaleToFillAndCropImage(image, sizeToFill, (UIRectCorner)corners, radius);
                
                if (desImage) {
                    // 缓存起来，并回调
                    [[[SDWebImageManager sharedManager] imageCache] storeImage:desImage forKey:keyForCachedImg toDisk:YES];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        !completionBlock ?: completionBlock(desImage);
                    });
                }
                else {
                    NSLog(@"[ERROR] Download Web Image: des image is nil");
                    dispatch_async(dispatch_get_main_queue(), ^{
                        !completionBlock ?: completionBlock(loadFailImg);
                    });
                }
            });
        }
        else {
            NSLog(@"[ERROR] Download Web Image: error = %@", error);
            dispatch_async(dispatch_get_main_queue(), ^{
                !completionBlock ?: completionBlock(loadFailImg);
            });
        }
    }];
}

@end

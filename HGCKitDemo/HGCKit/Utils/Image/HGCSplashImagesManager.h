//
//  HGCSplashImagesManager.h
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/10/29.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HGCAppSplashDisplayingTimeInterval  2.0f
#define mHGCSplashImagesManager [HGCSplashImagesManager sharedInstance]

@interface HGCSplashImagesManager : NSObject

@property (nonatomic, copy, readonly) NSString *defaultSplashImageName;

+ (instancetype)sharedInstance;

/**
 *  设定默认的闪屏图片名
 *
 *  @param imgname              初始图片名，如果需要添加后缀，不要传入 .png 等后缀
 *  @param appendSizeSuffix     是否需要添加屏幕尺寸后缀
 *  @param appendScaleSuffix    是否需要添加屏幕分辨率后缀
 *
 *  @description
 *  例如 设备为 iPhone 5
 *  如果 imgname 为空，则闪屏图片名为：pic_start_640-1136@2x.png
 *  如果 imgname 为 pic_start
 *      * 如果 appendSizeSuffix 为 YES ，那么闪屏图片名为：pic_start_640-1136
 *          * 如果 appendScaleSuffix 为 YES ，那么闪屏图片名为：pic_start_640-1136@2x.png
 *          * 否则图片名为：pic_start_640-1136.png
 *      * 否则根据 appendScaleSuffix 来判断，规则同上
 */
- (void)setupDefaultSplashImageName:(NSString *)imgname
             appendScreenSizeSuffix:(BOOL)appendSizeSuffix
                  appendScaleSuffix:(BOOL)appendScaleSuffix;

/**
 闪屏图片加载机制：
 . 以图片url为key查缓存，如果缓存存在就直接加载缓存，并下载最新的网络图片更新本地缓存
 . 如果缓存不存在，就加载默认启动页图片，并下载网络图片缓存起来
 */
- (UIImage *)getSplashImageWithURLString:(NSString *)urlstring;

@end


//
//  HGCSplashImagesManager.m
//  H5GameCenter
//
//  Created by Jymn_Chen on 15/10/29.
//  Copyright © 2015年 com.youmi. All rights reserved.
//

#import "HGCSplashImagesManager.h"
#import "HGCMacros.h"
#import "NSString+HGCCategory.h"
#import "HGCFileManager.h"
#import <AFNetworking/AFNetworking.h>


///////////////////////////////////////////////////////////////////////////////////////////


static NSString * const kHGCSplashImagesDirectory = @"HGCSplashImages";
static NSString * const kHGCSplashImageInfosPlistName = @"splashImgInfos.plist";

@interface HGCSplashImagesManager ()

@property (nonatomic, copy, readwrite) NSString *defaultSplashImageName;

@end

@implementation HGCSplashImagesManager


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Singleton

+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[super allocWithZone:NULL] init];
    });
    return _sharedInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [[self class] sharedInstance];
}

//- (instancetype)copyWithZone:(NSZone *)zone {
//    return [[self class] sharedInstance];
//}
//
//- (instancetype)mutableCopyWithZone:(NSZone *)zone {
//    return [[self class] sharedInstance];
//}

#pragma mark - Init

- (instancetype)init {
    self = [super init];
    if (self) {
        [mHGCFileManager createFolderIfNotExists:[self splashImagesStoragePath]];
    }
    return self;
}

- (void)setupDefaultSplashImageName:(NSString *)imgname
             appendScreenSizeSuffix:(BOOL)appendSizeSuffix
                  appendScaleSuffix:(BOOL)appendScaleSuffix
{
    NSInteger scaleFactor = (NSInteger)[[UIScreen mainScreen] scale];
    NSInteger width = (NSInteger)HGCScreenWidth;
    NSInteger height = (NSInteger)HGCScreenHeight;
    if (imgname == nil || [imgname hgc_isEmpty]) {
        self.defaultSplashImageName = [NSString stringWithFormat:@"pic_start_%zd_%zd@%zdx.png", width * scaleFactor, height * scaleFactor, scaleFactor];
    }
    else if ([imgname hasSuffix:@".png"] || [imgname hasSuffix:@".jpg"] || [imgname hasSuffix:@".jpeg"]) {
        self.defaultSplashImageName = imgname;
    }
    else {
        self.defaultSplashImageName = imgname;
        if (appendSizeSuffix) {
            self.defaultSplashImageName = [NSString stringWithFormat:@"%@_%zd_%zd", _defaultSplashImageName, width * scaleFactor, height * scaleFactor];
        }
        if (appendScaleSuffix) {
            self.defaultSplashImageName = [NSString stringWithFormat:@"%@@%zdx", _defaultSplashImageName, scaleFactor];
        }
        self.defaultSplashImageName = [NSString stringWithFormat:@"%@.png", _defaultSplashImageName];
    }
}

#pragma mark - Common Methods

- (NSString *)splashImagesStoragePath {
    return [mHGCFileManager pathForDocumentsInnerDirectory:kHGCSplashImagesDirectory];
}

- (NSString *)splashImageInfosPlistFilePath {
    NSString *directory = [self splashImagesStoragePath];
    NSString *plistName = kHGCSplashImageInfosPlistName;
    NSString *filePath = [directory stringByAppendingPathComponent:plistName];
    
    return filePath;
}

- (NSDictionary *)loadCachesInfoDict {
    NSDictionary *dict = [mHGCFileManager loadDictionaryFromFilePath:[self splashImageInfosPlistFilePath]];
    return dict ?: @{};
}

- (void)saveCachesInfoDict:(NSDictionary *)dict {
    [mHGCFileManager saveDictionary:dict toFilePath:[self splashImageInfosPlistFilePath]];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Cache Image

- (UIImage *)cachedImageWithURLString:(NSString *)urlstring {
    if (urlstring == nil || [urlstring hgc_isEmpty]) {
        return nil;
    }
    
    NSDictionary *infosDict = [self loadCachesInfoDict];
    NSString *fileName = infosDict[urlstring];
    NSString *imageFilePath = [[self splashImagesStoragePath] stringByAppendingPathComponent:fileName];
    UIImage *cachedImage = [UIImage imageWithContentsOfFile:imageFilePath];
    
    return cachedImage;
}

#pragma mark - Download Image

- (void)downloadImageWithURLString:(NSString *)urlstring {
    if (urlstring == nil || [urlstring hgc_isEmpty]) {
        return;
    }
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURL *URL = [NSURL URLWithString:urlstring];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        NSString *directory = [self splashImagesStoragePath];
        NSString *filePath = [directory stringByAppendingPathComponent:[response suggestedFilename]];
        
        return [NSURL fileURLWithPath:filePath];
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        
        if (error) {
            DDLogError(@"Splash Manager ** download error = %@", error);
        }
        else {
            DDLogInfo(@"Splash Image downloaded to %@", filePath);
            
            NSDictionary *infosDict = [self loadCachesInfoDict];
            NSMutableDictionary *mdict = [NSMutableDictionary dictionaryWithDictionary:infosDict];
            mdict[urlstring] = [filePath lastPathComponent];
            [self saveCachesInfoDict:[mdict copy]];
        }
        
    }];
    [downloadTask resume];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Public Methods

- (UIImage *)getSplashImageWithURLString:(NSString *)urlstring {
    DDLogInfo(@"splash url string = %@", urlstring);
    UIImage *cachedImage = [self cachedImageWithURLString:urlstring];
    [self downloadImageWithURLString:urlstring];
    
    if (cachedImage == nil) {
        return [UIImage imageNamed:_defaultSplashImageName];
    }
    else {
        return cachedImage;
    }
}

@end

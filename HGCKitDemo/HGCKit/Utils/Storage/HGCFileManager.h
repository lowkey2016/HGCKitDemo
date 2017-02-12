//
//  HGCFileManager.h
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/1/28.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define mHGCFileManager [HGCFileManager defaultManager]

@interface HGCFileManager : NSObject

+ (instancetype)defaultManager;


///////////////////////////////////////////////////////////////////////////////////////////
// MARK: - 获取路径
///////////////////////////////////////////////////////////////////////////////////////////

- (NSString *)documentsPath;
// innerDirectory必须按照 A/B/C 的形式传入
- (NSString *)pathForDocumentsInnerDirectory:(NSString *)innerDirectory;

- (NSString *)cachesPath;
- (NSString *)pathForCachesInnerDirectory:(NSString *)innerDirectory;

- (BOOL)fileExistsAtPath:(NSString *)path;


///////////////////////////////////////////////////////////////////////////////////////////
// MARK: - 新建目录
///////////////////////////////////////////////////////////////////////////////////////////

/**
 *  创建新的文件夹，如果文件夹已经存在就不作为
 *
 *  @param folderPath
 *
 *  @return YES 表示文件夹已经存在或者创建成功，NO 表示创建失败或者文件夹已经以文件的形式存在
 */
- (BOOL)createFolderIfNotExists:(NSString *)folderPath;

/**
 *  创建新的文件夹，如果文件夹已经存在就不作为，如果文件夹以文件的形式存在，就先删除再新建文件夹
 *
 *  @param folderPath
 *
 *  @return YES 表示文件夹已经存在或者创建成功，NO 表示创建失败或者覆盖已有文件失败
 */
- (BOOL)createFolderIfNotExistsForcely:(NSString *)folderPath;

/**
 *  创建新的空白文件夹，如果文件夹已经存在就将其删除再新建
 *
 *  @param folderPath
 *
 *  @return YES 表示文件夹创建成功，NO 表示创建失败或者移除已有文件夹失败
 */
- (BOOL)createNewEmptyFolderAtPath:(NSString *)folderPath;


///////////////////////////////////////////////////////////////////////////////////////////
// MARK: - 拷贝/移动/删除文件
///////////////////////////////////////////////////////////////////////////////////////////

// 拷贝/移动文件的时候
// 如果 shouldOverride = NO，且目标文件已经存在，将不会覆盖，并且报错
// 如果 shouldOverride = YES，且目标文件已经存在，将直接覆盖
- (BOOL)copyItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath override:(BOOL)shouldOverride;
- (BOOL)moveItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath override:(BOOL)shouldOverride;
- (BOOL)removeItemAtPath:(NSString *)path;

- (BOOL)copyItemAtFileURL:(NSURL *)srcURL toFileURL:(NSURL *)dstURL override:(BOOL)shouldOverride;
- (BOOL)moveItemAtFileURL:(NSURL *)srcURL toFileURL:(NSURL *)dstURL override:(BOOL)shouldOverride;
- (BOOL)removeItemAtFileURL:(NSURL *)url;

/**
 *  递归地移动 srcFolderPath 目录下的所有文件到 desFolderPath
 *
 *  @param srcFolderPath
 *  @param desFolderPath
 *  @param shouldOverride
 */
- (void)recursiveMoveItemsFromPath:(NSString *)srcFolderPath
                            toPath:(NSString *)desFolderPath
                          override:(BOOL)shouldOverride;


///////////////////////////////////////////////////////////////////////////////////////////
// MARK: - 存取字典、数组、二进制数据
///////////////////////////////////////////////////////////////////////////////////////////

- (BOOL)saveDictionary:(NSDictionary *)mdict toFilePath:(NSString *)filePath;
- (NSDictionary *)loadDictionaryFromFilePath:(NSString *)filePath;

- (BOOL)saveArray:(NSArray *)marray toFilePath:(NSString *)filePath;
- (NSArray *)loadArrayFromFilePath:(NSString *)filePath;

- (BOOL)saveData:(NSData *)mdata toFilePath:(NSString *)filePath;
- (NSData *)loadDataFromFilePath:(NSString *)filePath;


///////////////////////////////////////////////////////////////////////////////////////////
// MARK: - 获取目录中的内容
///////////////////////////////////////////////////////////////////////////////////////////

// ascend = YES: 日期从最久到最新
// ascend = NO: 日期从最新到最久
- (NSArray<NSString *> *)contentsSortByCreationDateAtFolderPath:(NSString *)folderPath ascend:(BOOL)ascend;
- (NSArray<NSString *> *)contentsSortByUpdateDateAtFolderPath:(NSString *)folderPath ascend:(BOOL)ascend;


///////////////////////////////////////////////////////////////////////////////////////////
// MARK: - 文件属性相关
///////////////////////////////////////////////////////////////////////////////////////////

- (BOOL)addSkipBackupAttributeToItemAtPath:(NSString *)filePath;
- (BOOL)getIsItemSkipBackupValue:(BOOL *)value atPath:(NSString *)filePath;

@end

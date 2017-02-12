//
//  HGCFileManager.m
//  TextGameEngine
//
//  Created by Jymn_Chen on 16/1/28.
//  Copyright © 2016年 com.youmi. All rights reserved.
//

#import "HGCFileManager.h"
#import "NSString+HGCCategory.h"

#ifdef DEBUG
#define _FMLog(...)     \
(NSLog)(@"<%s : %d> %s\n", [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __func__);          \
NSLog(__VA_ARGS__);
#else
#define _FMLog(...)
#endif

@implementation HGCFileManager


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Singleton

+ (instancetype)defaultManager {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[super allocWithZone:NULL] init];
    });
    return _sharedInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [[self class] defaultManager];
}

//- (instancetype)copyWithZone:(NSZone *)zone {
//    return [[self class] defaultManager];
//}
//
//- (instancetype)mutableCopyWithZone:(NSZone *)zone {
//    return [[self class] defaultManager];
//}

#pragma mark - Init

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - Common Methods

- (BOOL)_isStringEmpty:(NSString *)str {
    return (str == nil || [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]);
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - File Path

- (NSString *)documentsPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if (paths == nil || [paths count] == 0) {
        _FMLog(@"Documents目录为空")
        return @"";
    }
    
    return paths[0];
}

- (NSString *)pathForDocumentsInnerDirectory:(NSString *)innerDirectory {
    if ([self _isStringEmpty:innerDirectory]) {
        _FMLog(@"获取Documents内部目录失败")
        return @"";
    }
    
    NSString *path = [[self documentsPath] stringByAppendingPathComponent:innerDirectory];
    return path;
}

- (NSString *)cachesPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    if (paths == nil || [paths count] == 0) {
        _FMLog(@"Caches目录为空")
        return @"";
    }
    
    return paths[0];
}

- (NSString *)pathForCachesInnerDirectory:(NSString *)innerDirectory {
    if ([self _isStringEmpty:innerDirectory]) {
        _FMLog(@"获取Caches内部目录失败")
        return @"";
    }
    
    NSString *path = [[self cachesPath] stringByAppendingPathComponent:innerDirectory];
    return path;
}

- (BOOL)fileExistsAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Create Folder

- (BOOL)_createFolderAtPath:(NSString *)folderPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *createDirectError = nil;
    [fileManager createDirectoryAtPath:folderPath
           withIntermediateDirectories:YES
                            attributes:nil
                                 error:&createDirectError];
    if (createDirectError) {
        _FMLog(@"创建目录失败: error = %@", createDirectError)
        return NO;
    }
    else {
        return YES;
    }
}

- (BOOL)createFolderIfNotExists:(NSString *)folderPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDirectory;
    if ([fileManager fileExistsAtPath:folderPath isDirectory:&isDirectory]) {
        if (isDirectory) {
            return YES;
        }
        else {
            _FMLog(@"该目录已经以文件形式存在")
            return NO;
        }
    }
    
    // 创建目录
    return [self _createFolderAtPath:folderPath];
}

- (BOOL)createFolderIfNotExistsForcely:(NSString *)folderPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDirectory;
    if ([fileManager fileExistsAtPath:folderPath isDirectory:&isDirectory]) {
        if (isDirectory) {
            return YES;
        }
        else {
            if ([self removeItemAtPath:folderPath] == NO) {
                _FMLog(@"创建目录时，覆盖文件失败")
                return NO;
            }
        }
    }
    
    // 创建目录
    return [self _createFolderAtPath:folderPath];
}

- (BOOL)createNewEmptyFolderAtPath:(NSString *)folderPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:folderPath]) {
        if ([self removeItemAtPath:folderPath] == NO) {
            _FMLog(@"创建空目录时，移除已有目录失败")
            return NO;
        }
    }
    
    // 创建目录
    return [self _createFolderAtPath:folderPath];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Copy or Move or Remove

- (BOOL)copyItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath override:(BOOL)shouldOverride {
    if ([self _isStringEmpty:srcPath] || [self _isStringEmpty:dstPath]) {
        _FMLog(@"拷贝项目失败: 源路径或目的路径非法")
        return NO;
    }
    if ([self fileExistsAtPath:srcPath] == NO) {
        _FMLog(@"拷贝项目失败: 源文件不存在")
        return NO;
    }
    
    if ([self createFolderIfNotExists:[dstPath stringByDeletingLastPathComponent]]) {
        if (shouldOverride) {
            [self removeItemAtPath:dstPath];
        }
        
        NSError *copyItemError = nil;
        BOOL succ = [[NSFileManager defaultManager] copyItemAtPath:srcPath toPath:dstPath error:&copyItemError];
        if (copyItemError) {
            _FMLog(@"拷贝项目失败: error = %@", copyItemError)
        }
        return succ;
    }
    else {
        _FMLog(@"拷贝项目失败: 无法获取目标文件所在目录");
        return NO;
    }
}

- (BOOL)moveItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath override:(BOOL)shouldOverride {
    if ([self _isStringEmpty:srcPath] || [self _isStringEmpty:dstPath]) {
        _FMLog(@"移动项目失败: 源路径或目的路径非法")
        return NO;
    }
    if ([self fileExistsAtPath:srcPath] == NO) {
        _FMLog(@"移动项目失败: 源文件不存在")
        return NO;
    }
    
    if ([self createFolderIfNotExists:[dstPath stringByDeletingLastPathComponent]]) {
        if (shouldOverride) {
            [self removeItemAtPath:dstPath];
        }
        
        NSError *moveItemError = nil;
        BOOL succ = [[NSFileManager defaultManager] moveItemAtPath:srcPath toPath:dstPath error:&moveItemError];
        if (moveItemError) {
            _FMLog(@"移动项目失败: error = %@", moveItemError)
        }
        return succ;
    }
    else {
        _FMLog(@"移动项目失败: 无法获取目标文件所在目录");
        return NO;
    }
}

- (BOOL)removeItemAtPath:(NSString *)path {
    if ([self _isStringEmpty:path]) {
        _FMLog(@"删除项目失败: 路径非法")
        return NO;
    }
    if ([[NSFileManager defaultManager] fileExistsAtPath:path] == NO) {
        return YES;
    }
    
    NSError *removeItemError = nil;
    BOOL succ = [[NSFileManager defaultManager] removeItemAtPath:path error:&removeItemError];
    if (removeItemError) {
        _FMLog(@"删除项目失败: error = %@", removeItemError)
    }
    return succ;
}

- (BOOL)copyItemAtFileURL:(NSURL *)srcURL toFileURL:(NSURL *)dstURL override:(BOOL)shouldOverride {
    NSString *srcPath = srcURL.path;
    NSString *dstPath = dstURL.path;
    return [self copyItemAtPath:srcPath toPath:dstPath override:shouldOverride];
}

- (BOOL)moveItemAtFileURL:(NSURL *)srcURL toFileURL:(NSURL *)dstURL override:(BOOL)shouldOverride {
    NSString *srcPath = srcURL.path;
    NSString *dstPath = dstURL.path;
    return [self moveItemAtPath:srcPath toPath:dstPath override:shouldOverride];
}

- (BOOL)removeItemAtFileURL:(NSURL *)url {
    NSString *path = url.path;
    return [self removeItemAtPath:path];
}

- (void)recursiveMoveItemsFromPath:(NSString *)srcFolderPath
                            toPath:(NSString *)desFolderPath
                          override:(BOOL)shouldOverride
{
    if ([self _isStringEmpty:srcFolderPath] || [self _isStringEmpty:desFolderPath]) {
        _FMLog(@"递归移动项目失败: 源路径或目的路径非法")
        return;
    }
    if ([self fileExistsAtPath:srcFolderPath] == NO) {
        _FMLog(@"递归移动项目失败: 源文件不存在")
        return;
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *readContentsErr;
    NSArray *contents = [fileManager contentsOfDirectoryAtPath:srcFolderPath error:&readContentsErr];
    if (readContentsErr) {
        _FMLog(@"读取目录内容失败，error = %@", readContentsErr)
        return;
    }
    if (contents == nil || contents.count == 0) {
        _FMLog(@"%@为空目录", srcFolderPath)
        return;
    }
    
    [contents enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *filename = (NSString *)obj;
        BOOL isDirectory = NO;
        if ([fileManager fileExistsAtPath:[srcFolderPath stringByAppendingPathComponent:filename] isDirectory:&isDirectory]) {
            if (isDirectory) {
                NSString *srcSubDirectoryPath = [srcFolderPath stringByAppendingPathComponent:filename];
                NSString *desSubDirectoryPath = [desFolderPath stringByAppendingPathComponent:filename];
                [self createFolderIfNotExistsForcely:desSubDirectoryPath];
                [self recursiveMoveItemsFromPath:srcSubDirectoryPath toPath:desSubDirectoryPath override:shouldOverride];
            }
            else {
                NSString *srcFilePath = [srcFolderPath stringByAppendingPathComponent:filename];
                NSString *desFilePath = [desFolderPath stringByAppendingPathComponent:filename];
                [self moveItemAtPath:srcFilePath toPath:desFilePath override:shouldOverride];
            }
        }
        else {
            _FMLog(@"%@不存在", [srcFolderPath stringByAppendingPathComponent:filename])
        }
    }];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Load and Save

- (BOOL)saveObject:(id)object toFilePath:(NSString *)filePath {
    if (object == nil) {
        _FMLog(@"写入文件失败: 数据为空")
        return NO;
    }
    
    if ([self _isStringEmpty:filePath]) {
        _FMLog(@"写入文件失败: 非法的文件路径")
        return NO;
    }
    
    NSString *folderPath = [filePath stringByDeletingLastPathComponent];
    if ([self createFolderIfNotExists:folderPath]) {
        if ([object writeToFile:filePath atomically:YES] == YES) {
            return YES;
        }
        else {
            _FMLog(@"写入文件失败: 系统错误")
            return NO;
        }
    }
    else {
        _FMLog(@"写入文件失败: 无法获取目标文件所在目录")
        return NO;
    }
}

- (id)loadObject:(Class)objectType fromFilePath:(NSString *)filePath {
    if ([self _isStringEmpty:filePath]) {
        _FMLog(@"读取文件失败: 非法的文件路径")
        return nil;
    }
    
    if ([self fileExistsAtPath:filePath] == NO) {
        _FMLog(@"读取文件失败: 文件不存在 %@", filePath);
        return nil;
    }
    
    if (objectType == [NSDictionary class]) {
        NSMutableDictionary *mdict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
        return [mdict copy];
    }
    else if (objectType == [NSArray class]) {
        NSMutableArray *marray = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
        return [marray copy];
    }
    else if (objectType == [NSData class]) {
        NSMutableData *mdata = [[NSMutableData alloc] initWithContentsOfFile:filePath];
        return [mdata copy];
    }
    else {
        return nil;
    }
}

#pragma mark - Save and Load NSDictionary

- (BOOL)saveDictionary:(NSDictionary *)mdict toFilePath:(NSString *)filePath {
    return [self saveObject:mdict toFilePath:filePath];
}

- (NSDictionary *)loadDictionaryFromFilePath:(NSString *)filePath {
    return (NSDictionary *)[self loadObject:[NSDictionary class] fromFilePath:filePath];
}

#pragma mark - Save and Load NSArray

- (BOOL)saveArray:(NSArray *)marray toFilePath:(NSString *)filePath {
    return [self saveObject:marray toFilePath:filePath];
}

- (NSArray *)loadArrayFromFilePath:(NSString *)filePath {
    return (NSArray *)[self loadObject:[NSArray class] fromFilePath:filePath];
}

#pragma mark - Save and Load NSData

- (BOOL)saveData:(NSData *)mdata toFilePath:(NSString *)filePath {
    return [self saveObject:mdata toFilePath:filePath];
}

- (NSData *)loadDataFromFilePath:(NSString *)filePath {
    return (NSData *)[self loadObject:[NSData class] fromFilePath:filePath];
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Contents Getter

+ (NSComparisonResult)_compareDate1:(NSDate *)date1
                              date2:(NSDate *)date2
                             ascend:(BOOL)ascend
{
    NSTimeInterval timeInterval1 = [date1 timeIntervalSince1970];
    NSTimeInterval timeInterval2 = [date2 timeIntervalSince1970];
    
    if (ascend) {
        if (timeInterval1 > timeInterval2) {
            return NSOrderedAscending;
        }
        else if (timeInterval1 == timeInterval2) {
            return NSOrderedSame;
        }
        else {
            return NSOrderedDescending;
        }
    }
    else {
        if (timeInterval1 < timeInterval2) {
            return NSOrderedAscending;
        }
        else if (timeInterval1 == timeInterval2) {
            return NSOrderedSame;
        }
        else {
            return NSOrderedDescending;
        }
    }
}

- (NSArray<NSString *> *)contentsSortByCreationDateAtFolderPath:(NSString *)folderPath ascend:(BOOL)ascend
{
    NSError *error;
    NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:folderPath error:&error];
    if (error) {
        _FMLog(@"读取文件夹中的内容失败: error = %@", error);
        return nil;
    }
    _FMLog(@"目录: %@, 内容: %@", folderPath, contents);
    
    NSArray *sortedContents = [contents sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *filename1 = (NSString *)obj1;
        NSString *filePath1 = [folderPath stringByAppendingPathComponent:filename1];
        NSDictionary *attributes1 = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath1 error:nil];
        NSDate *date1 = attributes1[NSFileCreationDate];
        
        NSString *filename2 = (NSString *)obj2;
        NSString *filePath2 = [folderPath stringByAppendingPathComponent:filename2];
        NSDictionary *attributes2 = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath2 error:nil];
        NSDate *date2 = attributes2[NSFileCreationDate];
        
        return [[self class] _compareDate1:date1 date2:date2 ascend:ascend];
    }];
    return sortedContents;
}

- (NSArray<NSString *> *)contentsSortByUpdateDateAtFolderPath:(NSString *)folderPath ascend:(BOOL)ascend
{
    NSError *error;
    NSArray *contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:folderPath error:&error];
    if (error) {
        _FMLog(@"读取文件夹中的内容失败: error = %@", error);
        return nil;
    }
    _FMLog(@"目录: %@, 内容: %@", folderPath, contents);
    
    NSArray *sortedContents = [contents sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *filename1 = (NSString *)obj1;
        NSString *filePath1 = [folderPath stringByAppendingPathComponent:filename1];
        NSDictionary *attributes1 = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath1 error:nil];
        NSDate *date1 = attributes1[NSFileModificationDate];
        
        NSString *filename2 = (NSString *)obj2;
        NSString *filePath2 = [folderPath stringByAppendingPathComponent:filename2];
        NSDictionary *attributes2 = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath2 error:nil];
        NSDate *date2 = attributes2[NSFileModificationDate];
        
        return [[self class] _compareDate1:date1 date2:date2 ascend:ascend];
    }];
    return sortedContents;
}


///////////////////////////////////////////////////////////////////////////////////////////


#pragma mark - Attributes

- (BOOL)addSkipBackupAttributeToItemAtPath:(NSString *)filePath {
    NSURL *URL = [NSURL fileURLWithPath:filePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:[URL path]] == NO) {
        _FMLog(@"文件不存在: %@", filePath);
        return NO;
    }
    
    NSError *error = nil;
    BOOL succ = [URL setResourceValue:@(YES) forKey:NSURLIsExcludedFromBackupKey error:&error];
    if (succ == NO) {
        _FMLog(@"去掉备份属性失败，文件位于：%@, error = %@", filePath, error);
    }
    return succ;
}

- (BOOL)getIsItemSkipBackupValue:(BOOL *)value atPath:(NSString *)filePath {
    NSURL *URL = [NSURL fileURLWithPath:filePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:[URL path]] == NO) {
        _FMLog(@"获取文件的备份属性失败，文件不存在: %@", filePath);
        return NO;
    }
    
    NSError *error = nil;
    NSNumber *isSkipBackup = nil;
    BOOL succ = [URL getResourceValue:&isSkipBackup forKey:NSURLIsExecutableKey error:&error];
    if (succ == NO || error) {
        _FMLog(@"获取文件的备份属性失败，文件位于: %@, error = %@", filePath, error);
        return NO;
    }
    
    if (value) {
        *value = [isSkipBackup boolValue];
    }
    return YES;
}

@end

#undef _FMLog

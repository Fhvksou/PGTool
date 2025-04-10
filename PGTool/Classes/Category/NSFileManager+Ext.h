//
//  NSFileManager+Ext.h
//  SecrectManager
//
//  Created by Fhvksou on 2023/4/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFileManager (Ext)

- (BOOL)createFileIfNotExist:(NSURL *)filePath contents:(NSData *)data;

// 生成随机id名称
- (NSString *)generateRandomFileName;

- (BOOL)deleteAllFilesInDirectory:(NSString *)directory error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END

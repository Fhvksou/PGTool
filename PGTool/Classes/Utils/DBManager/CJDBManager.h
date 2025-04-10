//
//  CJDBManager.h
//  SecrectManager
//
//  Created by Fhvksou on 2023/4/17.
//

#import <Foundation/Foundation.h>
#import "CJDataBase.h"

NS_ASSUME_NONNULL_BEGIN

@interface CJDBManager : NSObject

//数据库文件存储的根目录
@property (nonatomic, copy) NSString *rootDirectory;

+ (void)registerRootDirectory:(NSString *)rootDirectory;

/**
 * 关闭数据库
 */
+ (void)closeDataBases:(NSArray *)dbIds;
/**
 * 单例
 */
+ (instancetype)sharedManager;

/**
 * 获取数据库，有就返回，没有就创建
 */
- (CJDataBase *)getDataBase:(nullable NSString *)identity;

- (CJDataBase *)getDataBase:(nullable NSString *)identity dbName:(NSString *)dbName;

@end

NS_ASSUME_NONNULL_END

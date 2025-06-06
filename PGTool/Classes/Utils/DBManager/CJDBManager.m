//
//  CJDBManager.m
//  SecrectManager
//
//  Created by Fhvksou on 2023/4/17.
//

#import "CJDBManager.h"

@interface CJDBManager ()

@property (nonatomic ,copy) NSString * rootPath;

@property (nonatomic ,strong) NSMutableDictionary * databaseMap;

@end

@implementation CJDBManager

+ (instancetype)sharedManager{
    static CJDBManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[CJDBManager alloc] init];
    });
    return _instance;
}

+ (void)registerRootDirectory:(NSString *)rootDirectory{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[self sharedManager] setRootDirectory:rootDirectory];
    });
}

- (instancetype)init{
    if (self = [super init]){
        _databaseMap = [NSMutableDictionary dictionary];
    }
    return self;
}

- (CJDataBase *)getDataBase:(nullable NSString *)identity{
    return [self getDataBase:identity dbName:@"app.db"];
}

- (CJDataBase *)getDataBase:(nullable NSString *)identity dbName:(NSString *)dbName{
    if (self.rootDirectory.length == 0){
        @throw [[NSException alloc] initWithName:@"参数验证" reason:@"数据库根路径为空" userInfo:nil];
        return nil;
    }
    
    if (dbName.length == 0){
        @throw [[NSException alloc] initWithName:@"参数验证" reason:@"数据库名称为空" userInfo:nil];
        return nil;
    }
    
    if (identity.length == 0){
        return nil;
    }
    
    @synchronized (self) {
        CJDataBase *db = [self.databaseMap objectForKey:identity];
        if (!db){
            NSString *dbPath = [self dbPath:identity dbName:dbName];
            db = [[CJDataBase alloc] initWithDBPath:dbPath];
            [self.databaseMap setObject:db forKey:identity];
        }
        [db open];
        return db;
    }
}

- (NSString *)dbPath:(NSString *)identity dbName:(NSString *)dbName{
    NSString *path = [NSString stringWithFormat:@"%@/%@/%@",self.rootDirectory,identity,dbName];
    return path;
}


+ (void)closeDataBases:(NSArray *)dbIds{
    [[CJDBManager sharedManager] closeDataBases:dbIds];
}

- (void)closeDataBases:(NSArray *)dbIds{
    NSArray *keys = self.databaseMap.allKeys;
    for (NSString *dbId in keys){
        if ([dbIds containsObject:dbId]){
            CJDataBase *dataBase = [self getDataBase:dbId];
            [dataBase close];
            [self.databaseMap removeObjectForKey:dbId];
        }
    }
}


@end

//
//  CJDataBase.m
//  SecrectManager
//
//  Created by Fhvksou on 2023/4/17.
//

#import "CJDataBase.h"
#import <FMDB/FMDB.h>
#import <PGTool/NSFileManager+Ext.h>

@interface CJDataBase ()

@property (nonatomic ,copy) NSString * dbPath;
@property (nonatomic, strong,readwrite) FMDatabaseQueue *databaseQueue;
@property (nonatomic, assign,readwrite) BOOL isOpened;

@end

@implementation CJDataBase


- (instancetype)initWithDBPath:(NSString *)dbPath{
    if (self = [super init]){
        self.dbPath = dbPath;
    }
    return self;
}

- (void)open{
    @synchronized (self) {
        if (self.isOpened){
            return;
        }
        
        if (self.dbPath.length > 0){
            BOOL isSuccess = [[NSFileManager defaultManager] createFileIfNotExist:[NSURL fileURLWithPath:self.dbPath] contents:nil];
            if (isSuccess){
                FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:self.dbPath];
                self.databaseQueue = queue;
                self.isOpened = YES;
            }
            
        }
    }
}

- (void)close{
    self.isOpened = NO;
    [self.databaseQueue close];
    self.databaseQueue = nil;
}


- (void)inDatabase:(__attribute__((noescape)) void (^)(FMDatabase *db))block{
    [self.databaseQueue inDatabase:block];
}
    
- (void)inTransaction:(void (^)(FMDatabase * _Nonnull db, BOOL * _Nonnull rollback))block {
    [self.databaseQueue inTransaction:block];
}

@end

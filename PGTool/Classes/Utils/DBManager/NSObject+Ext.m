//
//  NSObject+Ext.m
//  SecrectManager
//
//  Created by 彻夜未眠 on 2023/4/17.
//

#import "NSObject+Ext.h"
#import "CJDBManager.h"

@implementation NSObject (Ext)

+ (CJDataBase *)dataBase{
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wundeclared-selector"
        if ([self respondsToSelector:@selector(dbID)]){
            NSString *dbId = [self performSelector:@selector(dbID)];
            CJDataBase *dataBase = [[CJDBManager sharedManager] getDataBase:dbId];
            return dataBase;
        }
        return nil;
    #pragma clang diagnostic pop
}

@end

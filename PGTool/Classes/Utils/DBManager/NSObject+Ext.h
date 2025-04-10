//
//  NSObject+Ext.h
//  SecrectManager
//
//  Created by 彻夜未眠 on 2023/4/17.
//

#import <Foundation/Foundation.h>

#import "CJDataBase.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Ext)
@property (nonatomic, readonly, weak,class) CJDataBase *dataBase;

@end

NS_ASSUME_NONNULL_END

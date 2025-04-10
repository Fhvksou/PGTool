//
//  NSArray+Func.h
//  PGTool_Example
//
//  Created by 倪超杰 on 2025/4/9.
//  Copyright © 2025 Fhvksou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Func)

/**
 *  数组压平
 */
- (NSArray *)flat;

/**
 *  数组映射
 */
- (NSArray *)flatMap:(nonnull id (^)(id item))block;

/**
 *  数组筛选
 */
- (NSArray *)filter:(nonnull BOOL (^)(id item))block;

@end

NS_ASSUME_NONNULL_END

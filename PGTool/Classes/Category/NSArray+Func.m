//
//  NSArray+Func.m
//  PGTool_Example
//
//  Created by Fhvksou on 2025/4/9.
//  Copyright © 2025 Fhvksou. All rights reserved.
//

#import "NSArray+Func.h"

@implementation NSArray (Func)

- (NSArray *)flat{
    NSMutableArray *mutArray = [NSMutableArray array];
    [self traverseArr:self mutArr:mutArray];
    return [mutArray copy];
}

- (void)traverseArr:(id)arr mutArr:(NSMutableArray*)mutArr{
    for (id item in arr) {
        if ([item isKindOfClass:[NSArray class]]) {
            [self traverseArr:item mutArr:mutArr];
        }else{
            [mutArr addObject:item];
        }
    }
}

- (NSArray *)flatMap:(nonnull id (^)(id item))block{
    NSMutableArray *mutArray = [NSMutableArray array];
    for (id item in self){
        id toObject = block(item);
        if (toObject) {
            [mutArray addObject:toObject];
        }
    }
    return [mutArray copy];
}

- (NSArray *)filter:(nonnull BOOL (^)(id item))block{
    NSMutableArray *mutArray = [NSMutableArray array];
    for (id item in self){
        if (block(item)){
            [mutArray addObject:item];
        }
    }
    return [mutArray copy];
}

@end

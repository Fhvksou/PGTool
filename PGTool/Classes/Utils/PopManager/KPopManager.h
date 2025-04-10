//
//  KPopManager.h
//  GloudGame
//
//  Created by 倪超杰 on 2023/6/20.
//

#import <Foundation/Foundation.h>
#import "KPopTask.h"

NS_ASSUME_NONNULL_BEGIN

@interface KPopManager : NSObject

@property (nonatomic ,strong) KPopTask * currentTask;

+ (instancetype)sharedInstance;

- (void)registSortClassNames:(NSArray<NSString *> *)classNames;

- (void)addTask:(Class)task;

- (void)addTask:(Class)class params:(nullable id)params;

@end

NS_ASSUME_NONNULL_END

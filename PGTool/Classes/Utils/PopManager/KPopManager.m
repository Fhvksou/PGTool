//
//  KPopManager.m
//  GloudGame
//
//  Created by 倪超杰 on 2023/6/20.
//

#import "KPopManager.h"
#import <PGTool/NSArray+Func.h>

@interface KPopManager ()<KTaskDelegate>

@property (nonatomic, strong, readwrite) NSMutableArray<KPopTask *> *tasks;
@property (nonatomic, strong) NSArray <NSString *>* classNames;
@end

@implementation KPopManager

+ (instancetype)sharedInstance{
    static KPopManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[KPopManager alloc] init];
    });
    return instance;
}

//+ (NSArray *)sortsOfPopViewsClassName{
//    static dispatch_once_t class_names;
//    static NSArray *classNames = nil;
//    
//    dispatch_once(&class_names, ^{
//        classNames = @[
////            NSStringFromClass()
//        ];
//    });
//    return classNames;
//}

- (void)registSortClassNames:(NSArray<NSString *> *)classNames{
    self.classNames = classNames;
}

- (void)sortTasks{
    [self.tasks sortUsingComparator:^NSComparisonResult(KPopTask *obj1,KPopTask *obj2) {
        NSInteger index1 = [self.classNames indexOfObject:NSStringFromClass([obj1 class])];
        NSInteger index2 = [self.classNames indexOfObject:NSStringFromClass([obj2 class])];
        return [@(index1) compare:@(index2)];
    }];
}


#pragma mark - Task Manage

- (void)requestFinish:(KPopTask *)task{
    //接口请求完成
    if (task.canShow == NO) {
        [self removeTask:task];
    }else{
        //正在显示， 什么都不做， 后续 task remove 时候 goNext
    }
}

- (void)addTask:(Class)task{
    [self addTask:task params:nil];
}

- (void)addTask:(Class)class params:(nullable id)params{
    NSArray *taskClasses = [self.tasks flatMap:^id _Nonnull(KPopTask  *item) {
        return item.class;
    }];
    if ([taskClasses containsObject:class] == NO) {
        KPopTask *task = [[class alloc]init];
        task.delegate = self;
        task.params = params;
        
        [self.tasks addObject:task];
        [self sortTasks];
        
        //第一个task
        if (taskClasses.count == 0){
            self.currentTask = task;
            [task request];
        }
    }
}

- (void)goNext{
    KPopTask *task = [self.tasks firstObject];
    if (task && !task.isCleared) {
        self.currentTask = task;
        [task request];
    }
}

#pragma mark  ---TaskDelegate---

- (void)removeTask:(KPopTask *)task{
    [self.tasks removeObject:task];
    [self goNext];
}

- (void)clearAllTasks{
    NSMutableArray *tempArray = [self.tasks mutableCopy];
    for (KPopTask *task in tempArray){
        [task clear];
    }
    
    self.tasks = [@[] mutableCopy];
}

#pragma mark - Init

- (NSMutableArray<KPopTask *> *)tasks{
    if (_tasks) {
        return _tasks;
    }
    _tasks = [@[] mutableCopy];
    return _tasks;
}

@end

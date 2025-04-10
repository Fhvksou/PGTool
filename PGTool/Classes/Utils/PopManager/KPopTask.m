//
//  KPopTask.m
//  GloudGame
//
//  Created by Fhvksou on 2023/6/20.
//

#import "KPopTask.h"

@interface KPopTask ()

@property (nonatomic, assign, readwrite) BOOL canShow;
@property (nonatomic, assign, readwrite) BOOL didRequest;
@property (nonatomic, assign, readwrite) BOOL didPop;
@property (nonatomic, assign, readwrite) BOOL isCleared;

@end

@implementation KPopTask

+ (instancetype)initWithDelegate:(id<KTaskDelegate>)delegate{
    KPopTask *task = [[self alloc] init];
    task.delegate = delegate;
    return task;
}

- (void)request{
    _didRequest = YES;
}

- (void)show{
    _didPop = YES;
}
- (void)allowPop{
    _canShow = YES;
    [self show];
}

- (void)close{
    
}

- (void)clear{
    self.isCleared = YES;
}



@end

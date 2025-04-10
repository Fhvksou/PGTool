//
//  KPopTask.h
//  GloudGame
//
//  Created by Fhvksou on 2023/6/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class KPopTask;
@protocol KTaskDelegate <NSObject>

- (void)removeTask:(KPopTask *)task;

- (void)requestFinish:(KPopTask *)task;

@end

@interface KPopTask : NSObject

+ (instancetype)initWithDelegate:(id<KTaskDelegate>)delegate;

@property (nonatomic, assign, readonly) BOOL canShow;
@property (nonatomic, assign, readonly) BOOL didRequest;
@property (nonatomic, assign, readonly) BOOL didPop;
@property (nonatomic, assign, readonly) BOOL isCleared;

@property (nonatomic, weak) id <KTaskDelegate>delegate;
@property (nonatomic, strong) id params;

- (void)request;

- (void)show;
- (void)allowPop;

- (void)close;

- (void)clear;

@end

NS_ASSUME_NONNULL_END

//
//  LogUtil.h
//  OTM
//
//  Created by Fhvksou on 2023/11/20.
//

#import <Foundation/Foundation.h>
#import "LogAppender.h"
#import "LogConstants.h"

NS_ASSUME_NONNULL_BEGIN

@interface LogUtil : NSObject

/**
 * 设置日志等级
 */
+ (void)setLogLevel:(LogLevel)logLevel;

+ (void)setLogAppenders:(NSArray *)logAppenders;

/**
 * flags 中的日志，不打印
 */
+ (void)configIgnoreFlagsLog:(NSArray *)flags;

+ (void)debug:(NSString *)msg flag:(nullable NSString *)flag context:(id)context;
+ (void)info:(NSString *)msg flag:(nullable NSString *)flag context:(id)context;
+ (void)warn:(NSString *)msg flag:(nullable NSString *)flag context:(id)context;
+ (void)error:(NSString *)msg flag:(nullable NSString *)flag context:(id)context;

@end

NS_ASSUME_NONNULL_END

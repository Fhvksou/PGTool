//
//  LogAppender.h
//  OTM
//
//  Created by Fhvksou on 2023/11/20.
//

#import <Foundation/Foundation.h>
#import "LogConstants.h"

NS_ASSUME_NONNULL_BEGIN

@interface LogAppender : NSObject

- (void)log:(NSString *)msg level:(LogLevel)logLevel flag:(nullable NSString *)flag context:(id)context;

@end

NS_ASSUME_NONNULL_END

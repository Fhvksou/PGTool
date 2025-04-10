//
//  LogConstants.h
//  OTM
//
//  Created by 倪超杰 on 2023/11/20.
//

#ifndef LogConstants_h
#define LogConstants_h

/**
 * 等级数越大，越能打印
 */
typedef NS_ENUM(NSUInteger,LogLevel){
    LogLevelDebug = 0,
    LogLevelInfo = 1,
    LogLevelWarn = 2,
    LogLevelError = 3
};

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-function"
static inline NSString *logLevelString(LogLevel logLevel){
    switch (logLevel) {
        case LogLevelDebug:
            return @"DEBUG";
        case LogLevelInfo:
            return @"INFO";
        case LogLevelWarn:
            return @"WARN";
        case LogLevelError:
            return @"ERROR";
        default:
            return @"UNKNOW";
    }
}
#pragma clang diagnostic pop

#endif /* LogConstants_h */

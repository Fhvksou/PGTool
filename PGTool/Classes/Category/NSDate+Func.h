//
//  NSDate+Func.h
//  OTM
//
//  Created by Fhvksou on 2023/11/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Func)

+ (long)getTimeSp;

+ (NSString *)timeWithYearMonthDayCountDown:(NSString *)timestamp;

@end

NS_ASSUME_NONNULL_END

//
//  NSDate+Func.m
//  OTM
//
//  Created by 倪超杰 on 2023/11/8.
//

#import "NSDate+Func.h"

@implementation NSDate (Func)

+ (long)getTimeSp{
    long time;
    NSDate * date = [self date];
    time = (long)[date timeIntervalSince1970];
    return time;
}

#pragma mark 时间戳 转日期 （yyyy-MM-dd）
+ (NSString *)timeWithYearMonthDayCountDown:(NSString *)timestamp {
    // 时间戳转日期
    
    // 传入的时间戳timeStr如果是精确到毫秒的记得要/1000
    NSTimeInterval timeInterval = [timestamp doubleValue]/1000;
    NSDate *detailDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // 实例化一个NSDateFormatter对象，设定时间格式，这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    NSString *dateStr = [dateFormatter stringFromDate:detailDate];

    return dateStr;
}

@end

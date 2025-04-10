//
//  NSData+Func.h
//  OTM
//
//  Created by 倪超杰 on 2023/11/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Func)

+ (NSData *)tranformData:(NSString *)str length:(NSUInteger)length;

+ (NSString *)convertToNSStringWithNSData:(NSData *)data;

@end

NS_ASSUME_NONNULL_END

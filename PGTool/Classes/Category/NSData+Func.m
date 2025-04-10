//
//  NSData+Func.m
//  OTM
//
//  Created by Fhvksou on 2023/11/8.
//

#import "NSData+Func.h"

@implementation NSData (Func)

+ (NSData *)tranformData:(NSString *)str length:(NSUInteger)length{
    if (!str || str.length == 0) {
        return nil;
    }
    
    NSMutableData * hexData = [[NSMutableData alloc]initWithCapacity:length];
    NSRange range;
    if (str.length % 2 == 0) {
        range = NSMakeRange(0, 2);
    }else{
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < str.length; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    return hexData;
}


+ (NSString *)convertToNSStringWithNSData:(NSData *)data{
    NSMutableString * destStr = [[NSMutableString alloc]init];
    [data enumerateByteRangesUsingBlock:^(const void * _Nonnull bytes, NSRange byteRange, BOOL * _Nonnull stop) {
        unsigned char * dataBytes = (unsigned char *)bytes;
        for (int i = 0; i < byteRange.length; i++) {
            NSString * hexStr = [NSString stringWithFormat:@"%x",dataBytes[i]&0xff];
            if ([hexStr length] == 2) {
                [destStr appendString:hexStr];
            }else{
                [destStr appendFormat:@"0%@",hexStr];
            }
        }
    }];
    return destStr;
}

@end

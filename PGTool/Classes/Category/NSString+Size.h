//
//  NSString+Size.h
//  OTM
//
//  Created by 倪超杰 on 2023/9/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Size)

- (CGSize)sizeWithFont:(UIFont*)font andMaxSize:(CGSize)size;
+ (CGSize)sizeWithString:(NSString*)str andFont:(UIFont*)font andMaxSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END

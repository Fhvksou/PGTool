//
//  UIColor+Ext.h
//  SecrectManager
//
//  Created by 彻夜未眠 on 2023/4/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Ext)
+ (UIColor *) colorFromHexCode:(NSString *)hexString;
@end

NS_ASSUME_NONNULL_END

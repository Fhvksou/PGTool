//
//  NSString+validation.h
//  OTM
//
//  Created by 倪超杰 on 2023/9/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger,ValidResultType){
    ValidResultTypePass = 0,
    ValidResultTypeErrorLenght = 1,
    ValidResultTypeErrorFormat = 2,
};

@interface NSString (validation)

+ (ValidResultType)valiMobilePhone:(NSString *)mobilePhone;

@end

NS_ASSUME_NONNULL_END

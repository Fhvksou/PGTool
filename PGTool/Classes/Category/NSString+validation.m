//
//  NSString+validation.m
//  OTM
//
//  Created by Fhvksou on 2023/9/4.
//

#import "NSString+validation.h"

@implementation NSString (validation)

+ (ValidResultType)valiMobilePhone:(NSString *)mobilePhone{
    if (mobilePhone.length != 11){
        return ValidResultTypeErrorLenght;
    }
    NSString *CT_NUM = @"^1[3-9]\\d{9}$";;
    NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
    BOOL isMatch3 = [pred3 evaluateWithObject:mobilePhone];
    if (isMatch3) {
        return ValidResultTypePass;
    }
    return ValidResultTypeErrorFormat;
}


@end

//
//  NSString+HKExtends.m
//  HKBaseDemo
//
//  Created by hukaiyin on 16/8/1.
//  Copyright © 2016年 hukaiyin. All rights reserved.
//

#import "NSString+HKExtends.h"

@implementation NSString (HKExtends)

/**
 * NSDate 转 NSString
 * @param format 如@"yyyy-MM-dd HH:mm:ss"
 */
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}

@end

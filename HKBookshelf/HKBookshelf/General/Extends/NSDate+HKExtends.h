//
//  NSDate+HKExtends.h
//  HKBaseDemo
//
//  Created by hukaiyin on 16/8/1.
//  Copyright © 2016年 hukaiyin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HKExtends)

/**
 *  根据时间获取第一天周几
*
 *  @return @(1) 表示周一
 */
- (NSInteger)monthBeginDay;

/**
 *  NSString 转 NSDate
 */
+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)format;

/**
 * 一个日期具体是周几
 *
 *  @return @"周一"
 */
- (NSString *)weekDay;

/**
 *  一个日期具体是周几
 *
 *  @return @(1) 表示周一
 */
- (NSInteger)weekDayInteger;

/**
 * 计算两个日期之间间隔的天数
 */
+ (NSInteger)daysBetweenDate:(NSDate *)startDate andDate:(NSDate *)endDate;

/**
 * 这个月有多少天
 */
- (NSInteger)daysInThisMonth;

// Adjusting dates
- (NSDate *)dateByAddingMonth: (NSInteger)month;
- (NSDate *)dateByAddingDays: (NSInteger)days;


/**
 *  系统设置是否为24小时制
 *
 *  @return YES:24小时制 NO:12小时制
 */
+ (BOOL)is24HourSystem;


/**
 *  转化为 UTC时间（+8）
 *
 */
- (NSDate *)convertToUTCdate;

/**
 *  转化为字符串形式的 UTC 时间 (+8)
 *
 *  @param formatStr 例 @"yyyy.MM.dd a hh:mm:ss"
 *
 *  @return 格式化后的时间字符串
 */
- (NSString *)convertToUTCdateStrWithFormatStr:(NSString *)formatStr;

@end

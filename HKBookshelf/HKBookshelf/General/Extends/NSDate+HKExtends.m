//
//  NSDate+HKExtends.m
//  HKBaseDemo
//
//  Created by hukaiyin on 16/8/1.
//  Copyright © 2016年 hukaiyin. All rights reserved.
//

#define D_MINUTE	60
#define D_HOUR		3600
#define D_DAY		86400
#define D_WEEK		604800
#define D_YEAR		31556926

#import "NSDate+HKExtends.h"

@implementation NSDate (HKExtends)


/**
 *  根据时间获取第一天周几
 *
 *  @param dateStr 时间
 *
 *  @return @(1) 表示周一
 */
- (NSInteger)monthBeginDay {
    
    double interval = 0;
    NSDate *beginDate = nil;
    //    NSDate *endDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //
    [calendar setFirstWeekday:2];//设定周一为周首日
    BOOL ok = [calendar rangeOfUnit:NSCalendarUnitMonth
                          startDate:&beginDate
                           interval:&interval
                            forDate:self];
    //分别修改为 NSDayCalendarUnit NSWeekCalendarUnit NSYearCalendarUnit
    if (ok) {
        //        endDate = [beginDate dateByAddingTimeInterval:interval-1];
    }else {
        return 1;
    }
    return [beginDate weekDayInteger];
}

/**
 *  NSString 转 NSDate
 */
+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)format {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    NSTimeZone* GTMzone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    [dateFormatter setTimeZone:GTMzone];
    [dateFormatter setDateFormat:format];
    
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    return destDate;
}

/**
 * 一个日期具体是周几
 * 周一：返回@"周一"
 */
- (NSString *)weekDay {
    
    NSString *weekDay;
    NSArray *weekDayFormatArr = @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"];
    NSInteger index = [self weekDayInteger];
    weekDay = weekDayFormatArr[index - 1];

    return weekDay;
}

/**
 * 一个日期具体是周几 
 *  周一：返回@(1)
 */
- (NSInteger)weekDayInteger {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags =NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour |NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    comps = [calendar components:unitFlags fromDate:self];
    return [comps weekday];
}

/**
 * 计算两个日期之间间隔的天数
 */
+ (NSInteger)daysBetweenDate:(NSDate *)startDate andDate:(NSDate *)endDate {
    
    NSCalendar *calender=[NSCalendar currentCalendar];
    //枚举保存日期的每一天
    NSCalendarUnit unitsave=NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    //计算日期
    NSDateComponents *comTogether=[calender components:unitsave fromDate:startDate toDate:endDate options:0];
    
    return comTogether.day;
}

/**
 * 这个月有多少天
 */
- (NSInteger)daysInThisMonth {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];
    
    return range.length;
}

- (NSDate *)dateByAddingMonth: (NSInteger)months {
    
    NSDateComponents *comps = [[NSDateComponents alloc]init];
    [comps setMonth:months];
    
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDate *mDate = [calendar dateByAddingComponents:comps
                                              toDate:self
                                             options:0];
    return mDate;
}

- (NSDate *)dateByAddingDays: (NSInteger)days {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_DAY * days;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

/**
 *  系统设置是否为24小时制
 *
 *  @return YES:24小时制 NO:12小时制
 */
+ (BOOL)is24HourSystem {
    NSString *formatStringForHours = [NSDateFormatter dateFormatFromTemplate:@"j"
                                                                     options:0
                                                                      locale:[NSLocale currentLocale]];
    NSRange containsA = [formatStringForHours rangeOfString:@"a"];
    return containsA.location == NSNotFound;
}

/**
 *  转化为 UTC时间（+8）
 *
 */
- (NSDate *)convertToUTCdate {
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:self];
    NSDate *localDate = [self dateByAddingTimeInterval:interval];
    return localDate;
}

/**
 *  转化为字符串形式的 UTC 时间 (+8)
 *
 *  @param formatStr 例 @"yyyy.MM.dd a hh:mm:ss"
 *
 *  @return 格式化后的时间字符串
 */
- (NSString *)convertToUTCdateStrWithFormatStr:(NSString *)formatStr {
    NSDate *localDate = self;
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:formatStr];
    NSString *dateStr = [formatter stringFromDate:localDate];
    return dateStr;
}

@end

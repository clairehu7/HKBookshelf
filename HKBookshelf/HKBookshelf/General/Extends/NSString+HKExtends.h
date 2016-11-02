//
//  NSString+HKExtends.h
//  HKBaseDemo
//
//  Created by hukaiyin on 16/8/1.
//  Copyright © 2016年 hukaiyin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (HKExtends)

/**
 * NSDate 转 NSString
 * @param format 如@"yyyy-MM-dd HH:mm:ss"
 */
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format;
- (NSArray *)paginationWithAttributes:(NSDictionary *)attributes constrainedToSize:(CGSize)size;
@end

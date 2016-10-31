//
//  NSDictionary+HKExtends.h
//  HKBaseDemo
//
//  Created by hukaiyin on 16/8/29.
//  Copyright © 2016年 hukaiyin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (HKExtends)

/**
 *  处理 dic 为 NULL 或 value 为 NULL 的情况
 *
 *  @return 异常时返回 nil
 */
-(id)objectForKeyIgnorNil:(id)aKey;
@end

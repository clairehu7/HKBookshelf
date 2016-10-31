//
//  NSDictionary+HKExtends.m
//  HKBaseDemo
//
//  Created by hukaiyin on 16/8/29.
//  Copyright © 2016年 hukaiyin. All rights reserved.
//

#import "NSDictionary+HKExtends.h"

@implementation NSDictionary (HKExtends)

-(id)objectForKeyIgnorNil:(id)aKey {
    if ([self isEqual:[NSNull null]]) {
        return nil;
    }
    id aObject = [self objectForKey:aKey];
    if (aObject != [NSNull null]) {
        return aObject;
    }
    return nil;
}

@end

//
//  TxtDataViewController.h
//  HKBookshelf
//
//  Created by hukaiyin on 2016/11/1.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "HKViewController.h"

#define TextViewFrame CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 20)
@interface TxtDataViewController : HKViewController

@property NSString *txt;
@property NSUInteger pageNumber;
@property NSMutableDictionary * attributes;
@end

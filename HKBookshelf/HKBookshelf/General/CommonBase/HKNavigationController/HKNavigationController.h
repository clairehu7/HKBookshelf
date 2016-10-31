//
//  HKNavigationController.h
//  HKBaseNavigationDemo
//
//  Created by hukaiyin on 16/6/26.
//  Copyright © 2016年 hukaiyin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HKNavigationController : UINavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController withBarTintColor:(UIColor *)bgColor tintColor:(UIColor *)tintColor barHidden:(BOOL)flag;

@end

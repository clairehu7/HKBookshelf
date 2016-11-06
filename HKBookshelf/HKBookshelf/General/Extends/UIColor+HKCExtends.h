//
//  UIColor+HKCExtends.h
//  HKBookshelf
//
//  Created by hukaiyin on 2016/11/6.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HKCExtends)

+ (UIColor *)colorFromRGBHex:(int)rgb;
+ (UIColor *)colorFromRGBHex:(int)rgb a:(CGFloat)alpha;

+ (UIColor *)colorFromRGB:(CGFloat)red :(CGFloat)green :(CGFloat)blue;
+ (UIColor *)colorFromRGBA:(CGFloat)red :(CGFloat)green :(CGFloat)blue :(CGFloat)alpha;
@end

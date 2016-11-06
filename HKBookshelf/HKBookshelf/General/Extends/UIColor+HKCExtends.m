//
//  UIColor+HKCExtends.m
//  HKBookshelf
//
//  Created by hukaiyin on 2016/11/6.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "UIColor+HKCExtends.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation UIColor (HKCExtends)

+ (UIColor *)colorFromRGBHex:(int)rgb {
    return [self colorFromRGBHex:rgb a:1.];
}

+ (UIColor *)colorFromRGBHex:(int)rgb a:(CGFloat)alpha {
    
    CGFloat red =  (rgb & 0xFF0000) >> 16;
    CGFloat green =  (rgb & 0xFF00) >> 8;
    CGFloat blue =  (rgb & 0xFF);
    return [self colorFromRGBA:red :green :blue :alpha];
}

+ (UIColor *)colorFromRGB:(CGFloat)red :(CGFloat)green :(CGFloat)blue {
    return [self colorFromRGBA:red :green :blue :1.];
}

+ (UIColor *)colorFromRGBA:(CGFloat)red :(CGFloat)green :(CGFloat)blue :(CGFloat)alpha {
    return [UIColor colorWithRed:red/255. green:green/255. blue:blue/255. alpha:alpha];
}

@end

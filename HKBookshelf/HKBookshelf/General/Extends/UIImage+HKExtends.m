//
//  UIImage+HKExtends.m
//  HKBaseNavigationDemo
//
//  Created by hukaiyin on 16/6/26.
//  Copyright © 2016年 hukaiyin. All rights reserved.
//

#import "UIImage+HKExtends.h"

@implementation UIImage (HKExtends)

#pragma mark - Color
- (UIImage *)imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    [self drawInRect:bounds blendMode:blendMode alpha:1.f];
//    if (blendMode != kCGBlendModeDestinationIn) {
//        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.];
//    }
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tintedImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - Size

/**
 *  缩放图片
 *
 *  @param newSize   图片尺寸
 *  @param withScale 是否 * [UIScreen mainScreen].scale
 *
 *  @return 处理后的图片
 */
-(UIImage*)scaledToSize:(CGSize)newSize withScale:(BOOL)withScale {
    
    CGFloat scale = 1;
    if (withScale) {
        scale = [UIScreen mainScreen].scale;
    }
    newSize = (CGSize){newSize.width * scale, newSize.height * scale};
    // Create a graphics image context
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0);
    //    UIGraphicsBeginImageContextWithOptions(newSize, NO, [UIScreen mainScreen].scale);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [self drawInRect:(CGRect){CGPointZero, newSize}];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}


-(UIImage*)getSubImage:(CGRect)rect {
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    return smallImage;
}

//传入 view,得到一张左右相反的截图
+ (UIImage *)captureView:(UIView *)view {
    CGRect rect = view.bounds;
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGAffineTransform transform = CGAffineTransformMake(-1.0, 0.0, 0.0, 1.0, rect.size.width, 0.0);
    CGContextConcatCTM(context,transform);
    [view.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

//
//  UILabel+HKExtends.m
//  HKBaseDemo
//
//  Created by hukaiyin on 16/8/2.
//  Copyright © 2016年 hukaiyin. All rights reserved.
//

#import "UILabel+HKExtends.h"

@implementation UILabel (HKExtends)

- (CGRect)boundingRectWithInitSize:(CGSize)size withFontSize:(CGFloat)fontSize {
    self.font = [UIFont systemFontOfSize:16.];
    self.lineBreakMode=NSLineBreakByWordWrapping;
    
    CGRect rect=[self.text boundingRectWithSize:size
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:[NSDictionary
                                                 dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName, nil]
                                        context:nil];
    
    return rect;
}

@end

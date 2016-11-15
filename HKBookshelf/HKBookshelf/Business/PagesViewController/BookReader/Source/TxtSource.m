//
//  TxtSource.m
//  HKBookshelf
//
//  Created by hukaiyin on 2016/11/1.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "TxtSource.h"
#import "NSString+HKExtends.h"
#import "BackViewController.h"

@interface TxtSource ()
@property NSString *txt;
@property NSArray *rangeArray;
@property NSMutableDictionary * attributes;

@property UIViewController *currentViewController;
@end

@implementation TxtSource

- (instancetype)init {
    self = [super init];
    if (self) {

        NSURL *url = [[NSBundle mainBundle] URLForResource:@"one" withExtension:@"txt"];
        self.txt = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        
        NSMutableDictionary * attributes = [NSMutableDictionary dictionaryWithCapacity:5];
        UIFont * font = [UIFont systemFontOfSize:18.];
        [attributes setValue:font forKey:NSFontAttributeName];
        [attributes setValue:@(1.0) forKey:NSKernAttributeName];
        
        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 5.0;
        paragraphStyle.paragraphSpacing = 10.0;
        paragraphStyle.alignment = NSTextAlignmentJustified;
        [attributes setValue:paragraphStyle forKey:NSParagraphStyleAttributeName];
        self.attributes = [attributes copy];
        
        self.rangeArray = [[self.txt paginationWithAttributes:self.attributes constrainedToSize:CGSizeMake(TextViewFrame.size.width, TextViewFrame.size.height - 64)] mutableCopy];
    }
    return self;
}

- (TxtDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard {
    
    if (index >= self.rangeArray.count) {
        return nil;
    }

    TxtDataViewController *dataVC = [storyboard instantiateViewControllerWithIdentifier:@"TxtDataViewController"];
    dataVC.pageNumber = index + 1;
    
    NSRange range = NSRangeFromString(self.rangeArray[index]);
    dataVC.txt = [self.txt substringWithRange:range];
    dataVC.attributes = self.attributes;
    return dataVC;
}

- (NSUInteger)indexOfViewController:(TxtDataViewController *)viewController {
    return viewController.pageNumber - 1;
}



@end

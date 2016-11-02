//
//  TxtSource.m
//  HKBookshelf
//
//  Created by hukaiyin on 2016/11/1.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "TxtSource.h"
#import "NSString+HKExtends.h"

@interface TxtSource ()
@property NSUInteger numberOfPages;
@property NSString *txt;
@property NSArray *rangeArray;
@property NSMutableDictionary * attributes;
@end

@implementation TxtSource

- (instancetype)init {
    self = [super init];
    if (self) {
//        NSString *str = @"123456789";
//        NSLog(@"%@",[str substringFromIndex:3]);
//        NSLog(@"%@",[str substringToIndex:6]);
//        NSLog(@"%@",[str substringWithRange:NSMakeRange(3, 3)]);
//        http://blog.csdn.net/centralperk/article/details/11882877

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

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self indexOfViewController:(TxtDataViewController *)viewController];
    if ((index == 0)||(index == NSNotFound)) {
        return nil;
    }
    index --;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self indexOfViewController:(TxtDataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    index ++;
    if (index == self.numberOfPages) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

@end

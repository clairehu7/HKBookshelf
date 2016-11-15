//
//  BookSource.m
//  HKBookshelf
//
//  Created by hukaiyin on 2016/11/14.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "BookSource.h"
#import "TxtSource.h"
#import "PDFSource.h"

@implementation BookSource

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard {
    //必须在子类里重写这一方法
    return [[UIViewController alloc]init];
}

- (NSUInteger)indexOfViewController:(UIViewController *)viewController {
    //必须在子类里重写这一方法
    return 0;
}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [self indexOfViewController:viewController];
    if ((index == 0)||(index == NSNotFound)) {
        return nil;
    }
    index --;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = [self indexOfViewController:viewController];
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

@implementation BookSourceManager

+ (BookSource *)sourceWithType:(BookType)type {
    BookSource *source;
    switch (type) {
        case BookTypeTxt: {
            source = [[TxtSource alloc]init];
            break;
        }
        case BookTypePDF: {
            source = [[PDFSource alloc]init];
            break;
        }
        default:
            break;
    }
    return source;
}
@end

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
    return [[UIViewController alloc]init];
}

- (NSUInteger)indexOfViewController:(UIViewController *)viewController {
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

+ (BookSource *)sourceForResource:(NSString *)name withExtension:(NSString *)ext {
    
    BookType type;
    
    NSArray *items = @[@"pdf", @"PDF", @"txt",@"TXT"];
    NSUInteger  index = [items indexOfObject:ext];
    switch (index) {
        case 0:
        case 1: {
            //pdf PDF
            type = BookTypePDF;
            break;
        }
        case 2:{
            //txt TXT
            type = BookTypeTxt;
            break;
        }
            
        default:
            break;
    }
    
    BookSource *source = [self sourceWithType:type];
    return source;
}

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
    source.type = type;
    return source;
}
@end

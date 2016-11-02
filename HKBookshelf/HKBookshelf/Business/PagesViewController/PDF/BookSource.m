//
//  BookSource.m
//  HKBookshelf
//
//  Created by hukaiyin on 2016/10/21.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "BookSource.h"

@interface BookSource ()
@property CGPDFDocumentRef pdf;
@property NSInteger numberOfPages;
@end

@implementation BookSource

- (void)dealloc {
    if (self.pdf !=NULL) {
        CGPDFDocumentRelease(self.pdf);
    }
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSURL *pdfURL = [[NSBundle mainBundle] URLForResource:@"om" withExtension:@"pdf"];
        self.pdf = CGPDFDocumentCreateWithURL((__bridge CFURLRef)pdfURL);
        self.numberOfPages = CGPDFDocumentGetNumberOfPages(self.pdf);
        if (self.numberOfPages % 2) {
            self.numberOfPages ++;
        }
    }
    return self;
}

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard {
    DataViewController *dataVC = [storyboard instantiateViewControllerWithIdentifier:@"DataViewController"];
    dataVC.pageNumber = index + 1;
    dataVC.pdf = self.pdf;
    return dataVC;
}

- (NSUInteger)indexOfViewController:(DataViewController *)viewController {
    return viewController.pageNumber - 1;
}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
    if ((index == 0)||(index == NSNotFound)) {
        return nil;
    }
    index --;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
   
    NSUInteger index = [self indexOfViewController:(DataViewController *)viewController];
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

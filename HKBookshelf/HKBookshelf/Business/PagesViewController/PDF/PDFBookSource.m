//
//  PDFBookSource.m
//  HKBookshelf
//
//  Created by hukaiyin on 2016/10/21.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "PDFBookSource.h"

@interface PDFBookSource ()
@property CGPDFDocumentRef pdf;
@property NSInteger numberOfPages;
@end

@implementation PDFBookSource

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

- (PDFDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard {
    PDFDataViewController *dataVC = [storyboard instantiateViewControllerWithIdentifier:@"PDFDataViewController"];
    dataVC.pageNumber = index + 1;
    dataVC.pdf = self.pdf;
    return dataVC;
}

- (NSUInteger)indexOfViewController:(PDFDataViewController *)viewController {
    return viewController.pageNumber - 1;
}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self indexOfViewController:(PDFDataViewController *)viewController];
    if ((index == 0)||(index == NSNotFound)) {
        return nil;
    }
    index --;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
   
    NSUInteger index = [self indexOfViewController:(PDFDataViewController *)viewController];
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

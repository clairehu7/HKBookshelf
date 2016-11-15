//
//  PDFSource.m
//  HKBookshelf
//
//  Created by hukaiyin on 2016/10/21.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "PDFSource.h"

@interface PDFSource ()
@property CGPDFDocumentRef pdf;
@end

@implementation PDFSource

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

@end

//
//  BookSource.h
//  HKBookshelf
//
//  Created by hukaiyin on 2016/10/21.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "PDFDataViewController.h"

@interface PDFBookSource : NSObject <UIPageViewControllerDataSource>
- (PDFDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(PDFDataViewController *)viewController;
@end

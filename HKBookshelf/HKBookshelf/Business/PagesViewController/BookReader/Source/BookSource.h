//
//  BookSource.h
//  HKBookshelf
//
//  Created by hukaiyin on 2016/11/14.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,BookType) {
    BookTypeTxt = 1,
    BookTypePDF,
};

@interface BookSource : NSObject<UIPageViewControllerDataSource>

@property (nonatomic, assign) NSUInteger numberOfPages;
@property (nonatomic, assign) BookType type;

//传入页码，返回应该显示的 vc
- (UIViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;

//传入 vc，返回页码
- (NSUInteger)indexOfViewController:(UIViewController *)viewController;

- (UIViewController *)dataSourcePageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController;
- (UIViewController *)dataSourcePageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController;
@end

@interface BookSourceManager : NSObject
+ (BookSource *)sourceForResource:(NSString *)name withExtension:(NSString *)ext;
@end

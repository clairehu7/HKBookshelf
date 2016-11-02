//
//  TxtSource.h
//  HKBookshelf
//
//  Created by hukaiyin on 2016/11/1.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "TxtDataViewController.h"

@interface TxtSource : NSObject<UIPageViewControllerDataSource>

//传入页码，返回应该显示的 vc
- (TxtDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
//传入 vc，返回页码
- (NSUInteger)indexOfViewController:(TxtDataViewController *)viewController;

@end

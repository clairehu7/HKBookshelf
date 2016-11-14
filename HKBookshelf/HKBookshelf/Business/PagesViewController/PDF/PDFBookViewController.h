//
//  BIPagesViewController.h
//  HKBookshelf
//
//  Created by hukaiyin on 2016/10/20.
//  Copyright © 2016年 HKY. All rights reserved.
//


#import "HKViewController.h"
@interface PDFBookViewController : HKViewController <UIPageViewControllerDelegate>
@property (nonatomic, strong) UIPageViewController *pageViewController;
@end

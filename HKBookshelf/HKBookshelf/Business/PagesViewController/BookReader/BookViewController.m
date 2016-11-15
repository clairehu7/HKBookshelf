//
//  BookViewController.m
//  HKBookshelf
//
//  Created by hukaiyin on 2016/11/14.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "BookViewController.h"
#import "BookSource.h"

#import "BookMenu.h"

@interface BookViewController () <UIPageViewControllerDelegate>

@property (readonly, nonatomic, strong) BookSource *bookSource;
@property (nonatomic, strong) UIPageViewController *pageViewController;

@property (nonatomic ,strong)BookMenu *menu;
@property (nonatomic, assign) BOOL showStatusBar;
@end

@implementation BookViewController
@synthesize bookSource = _bookSource;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self commonInit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)commonInit {
    _showStatusBar = NO;
    [self pageViewController];
    [self addGesture];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (BOOL)prefersStatusBarHidden {
    return !_showStatusBar;
}

#pragma mark - Menu

- (void)addGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                         action:@selector(showMenuAndHide)];
    [self.view addGestureRecognizer:tap];
}

- (void)showMenuAndHide {
    _showStatusBar = !_showStatusBar;
    [self.menu showAndHide];
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        [self prefersStatusBarHidden];
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    }
}

#pragma mark - Setters & Getters

- (BookSource *)bookSource {
    if (!_bookSource) {
        //TODO: 判断文件类型
        _bookSource = [BookSourceManager sourceWithType:BookTypeTxt];
    }
    return _bookSource;
}

- (UIPageViewController *)pageViewController {
    if (!_pageViewController) {
        _pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        _pageViewController.delegate = self;
        _pageViewController.dataSource = self.bookSource;
        
        UIViewController *startVC = [self.bookSource viewControllerAtIndex:0 storyboard:self.storyboard];
        [_pageViewController setViewControllers:@[startVC] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
        [self addChildViewController:_pageViewController];
        [self.view addSubview:_pageViewController.view];
        [_pageViewController didMoveToParentViewController:self];
        self.view.gestureRecognizers = _pageViewController.gestureRecognizers;
    }
    return _pageViewController;
}

- (BookMenu *)menu {
    if (!_menu) {
        _menu = [[BookMenu alloc]init];
        
        __weak typeof(self)weakSelf = self;
        _menu.backHandler = ^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
        };
        [self.view addSubview:_menu];
    }
    return _menu;
}

@end

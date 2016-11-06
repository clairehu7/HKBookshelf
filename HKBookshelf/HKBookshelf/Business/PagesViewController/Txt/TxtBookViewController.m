//
//  TxtBookViewController.m
//  HKBookshelf
//
//  Created by hukaiyin on 2016/11/1.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "TxtBookViewController.h"
#import "TxtSource.h"
#import "TxtDataViewController.h"

#import "BookMenu.h"

@interface TxtBookViewController ()
@property (readonly , nonatomic, strong)TxtSource *source;
@property (nonatomic ,strong)BookMenu *menu;
@property (nonatomic, assign) BOOL showStatusBar;
@property (nonatomic, strong) UIView *statusBackView;
@end

@implementation TxtBookViewController
@synthesize source = _source;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self commonInit];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return !_showStatusBar;
}



- (void)commonInit {
    _showStatusBar = NO;
    [self loadPageViewControler];
    [self addGesture];
}

- (void)loadPageViewControler {
    self.pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.delegate = self;
    TxtDataViewController *startVC = [self.source viewControllerAtIndex:0 storyboard:self.storyboard];
    [self.pageViewController setViewControllers:@[startVC]
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:NO
                                     completion:NULL];
    
    self.pageViewController.dataSource = self.source;
    self.pageViewController.doubleSided = YES;
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    self.pageViewController.view.frame = self.view.bounds;
    [self.pageViewController didMoveToParentViewController:self];
    self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
}

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

- (TxtSource *)source {
    if (!_source) {
        _source = [[TxtSource alloc]init];
    }
    return _source;
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

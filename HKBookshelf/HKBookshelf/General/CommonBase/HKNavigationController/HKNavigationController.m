//
//  HKNavigationController.m
//  HKBaseNavigationDemo
//
//  Created by hukaiyin on 16/6/26.
//  Copyright © 2016年 hukaiyin. All rights reserved.
//

#import "HKNavigationController.h"

#import "UINavigationController+HKExtends.h"
#import "UIBarButtonItem+HKExtends.h"
#import "UIImage+HKExtends.h"
#import "HKViewController.h"

@interface HKNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation HKNavigationController

#pragma mark - Life Cycle
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    return [self initWithRootViewController:rootViewController
                           withBarTintColor:[UIColor whiteColor]
                                  tintColor:[UIColor colorWithRed:0.310 green:0.627 blue:0.984 alpha:1.000]
                                  barHidden:NO];
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController withBarTintColor:(UIColor *)bgColor tintColor:(UIColor *)tintColor barHidden:(BOOL)flag {
    if (self = [super initWithRootViewController:rootViewController]) {
        self.delegate = self;
        UIImage *shadowImage = nil;
//        UIImage *shadowImage = [UIImage new];
        [self updateBarWithTranslucent:NO
                          barTintColor:bgColor
                             tintColor:tintColor
                           shadowImage:shadowImage];
        if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.interactivePopGestureRecognizer.enabled = YES;
            self.interactivePopGestureRecognizer.delegate = self;
        }
        self.navigationBarHidden = flag;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self loadLeftBarBtnItemInVC:viewController];
}

//default
- (void)loadLeftBarBtnItemInVC:(UIViewController *)viewController {
    if (self.viewControllers[0] == viewController) {
        return;
    }
    id target = self;
    SEL backSel = @selector(backTUI:);
    UIImage *leftBarImage = [[UIImage imageNamed:@"nav_back_black"] imageWithTintColor:[UIColor grayColor] blendMode:kCGBlendModeDestinationIn];
    if ([viewController respondsToSelector:@selector(backBtnTUI:)]) {
        backSel = @selector(backBtnTUI:);
        target = viewController;
    }
    
    viewController.navigationItem.leftBarButtonItem =
        [UIBarButtonItem barItemWithTarget:target
                                    action:backSel
                          forControlEvents:UIControlEventTouchUpInside
                                       img:leftBarImage];
}

#pragma mark - Private Methods
- (void)backTUI:(UIButton *)sender {
    [self popViewControllerAnimated:YES];
}

@end

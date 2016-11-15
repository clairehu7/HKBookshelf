//
//  BackViewController.m
//  HKBookshelf
//
//  Created by hukaiyin on 2016/11/3.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "BackViewController.h"
#import "UIImage+HKExtends.h"

@interface BackViewController ()
@property (nonatomic, strong) UIImageView *bgImageView;
@end

@implementation BackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateWithViewController:(UIViewController *)viewController {
    self.bgImageView.image = [UIImage captureView:viewController.view];
}

#pragma mark - Setters & Getters

- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        _bgImageView.alpha = 0.7;
        [self.view addSubview:_bgImageView];
    }
    return _bgImageView;
}

@end

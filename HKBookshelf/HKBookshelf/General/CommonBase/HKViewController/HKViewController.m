//
//  HKViewController.m
//  HKBaseNavigationDemo
//
//  Created by hukaiyin on 16/6/27.
//  Copyright © 2016年 hukaiyin. All rights reserved.
//

#import "HKViewController.h"
#import "HKViewMarco.h"
#import "UIImage+HKExtends.h"
#import "UIBarButtonItem+HKExtends.h"

@interface HKViewController ()
@property (nonatomic, strong)UIButton *leftBtn;
@property (nonatomic, strong)UIButton *rightBtn;
@property (nonatomic, strong)UIButton *backBtn;
@end

@implementation HKViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.hidesBottomBarWhenPushed = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Btn init
- (void)creatBackBtnWithTitle:(NSString *)title {
    UIImage *leftBarImage = [[UIImage imageNamed:@"nav_back_black"] imageWithTintColor:[UIColor grayColor] blendMode:kCGBlendModeDestinationIn];
    self.navigationItem.leftBarButtonItem =
    [UIBarButtonItem barItemWithTarget:self
                                action:@selector(backBtnTUI:)
                      forControlEvents:UIControlEventTouchUpInside
                                   img:leftBarImage];
}

- (void)creatLeftBtnWithTitle:(NSString *)title {
    if (!_leftBtn) {
        self.leftBtn = [[UIButton alloc] init];
        [self.leftBtn setFrame:CGRectMake(20, 20, TITLE_BAR_HEIGHT, TITLE_BAR_HEIGHT)];
        self.leftBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [self.leftBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [self.leftBtn setTitle:title forState:UIControlStateNormal];
        [self.leftBtn setTitleColor:color_black forState:UIControlStateNormal];
        [self.leftBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
        [self.leftBtn addTarget:self action:@selector(leftBtnTUI:) forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftBtn];
    }
    [self.leftBtn setTitle:title forState:UIControlStateNormal];
}

- (void)creatRightBtnWithTitle:(NSString *)title {
    if (!_rightBtn) {
        self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.rightBtn addTarget:self action:@selector(rightBtnTUI:) forControlEvents:UIControlEventTouchUpInside];
        [self.rightBtn setTitleColor:color_black forState:UIControlStateNormal];
        self.rightBtn.layer.masksToBounds = YES;
        self.rightBtn.layer.cornerRadius = 8;
        [self.rightBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    }
    
    [self.rightBtn setTitle:title forState:UIControlStateNormal];
    [self.rightBtn sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
}

#pragma mark - Btn Methods
- (void)backBtnTUI:(UIButton *)btn {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)leftBtnTUI:(UIButton *)btn; {
    
}

- (void)rightBtnTUI:(UIButton *)btn {
    
}


@end

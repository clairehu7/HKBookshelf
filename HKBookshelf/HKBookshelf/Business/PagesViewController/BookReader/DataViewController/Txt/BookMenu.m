//
//  BookMenu.m
//  HKBookshelf
//
//  Created by hukaiyin on 2016/11/2.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "BookMenu.h"
#import "UIImage+HKExtends.h"

@interface BookMenu ()
@property (nonatomic, assign)BOOL show;
@end

@implementation BookMenu

- (instancetype)init {
    return [self initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    self.backgroundColor = [UIColor whiteColor];
    UIImage *leftBarImage = [[UIImage imageNamed:@"nav_back_black"] imageWithTintColor:[UIColor grayColor] blendMode:kCGBlendModeDestinationIn];
    UIButton *btn = [[UIButton alloc]initWithFrame:(CGRect){0,20,30,44}];
    [btn setImage:leftBarImage forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
    self.show = NO;
}

- (void)back {
    !_backHandler?:_backHandler();
}

- (void)showAndHide {
    self.show = !self.show;
}

- (void)setShow:(BOOL)show {
    _show = show;
    self.hidden = !self.show;
    //TODO:动画效果
}

@end

//
//  TxtDataViewController.m
//  HKBookshelf
//
//  Created by hukaiyin on 2016/11/1.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "TxtDataViewController.h"

@interface TxtDataViewController ()
@property (nonatomic , strong)UITextView *textView;
@property (nonatomic, strong) UILabel *label;
@end

@implementation TxtDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSAttributedString *aStr = [[NSAttributedString alloc]initWithString:self.txt attributes:self.attributes];
//    self.label.attributedText = aStr;
    self.textView.attributedText = aStr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setters & Getters

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc]initWithFrame:TextViewFrame];
        _textView.editable = NO;
        _textView.scrollEnabled = NO;
        _textView.textContainerInset = UIEdgeInsetsMake(0,0, 0, 0);
//        _textView.backgroundColor = [UIColor blueColor];
        [self.view addSubview:_textView];
    }
    return _textView;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:TextViewFrame];
        _label.numberOfLines = 0;
        [self.view addSubview:_label];
    }
    return _label;
}

@end

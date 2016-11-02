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
@end

@implementation TxtDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textView.typingAttributes = self.attributes;
    self.textView.text = self.txt;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setters & Getters

- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc]initWithFrame:self.view.bounds];
        [self.view addSubview:_textView];
    }
    return _textView;
}

@end

//
//  BookMenu.h
//  HKBookshelf
//
//  Created by hukaiyin on 2016/11/2.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookMenu : UIView

@property (nonatomic, copy)dispatch_block_t backHandler;
- (void)showAndHide;
@end

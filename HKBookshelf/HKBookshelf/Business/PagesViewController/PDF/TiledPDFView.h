//
//  TiledPDFView.h
//  HKBookshelf
//
//  Created by hukaiyin on 2016/10/21.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TiledPDFView : UIView
@property CGPDFPageRef pdfPage;
@property CGFloat myScale;

- (instancetype)initWithFrame:(CGRect)frame scale:(CGFloat)scale;
- (void)setPage:(CGPDFPageRef)newPage;
@end

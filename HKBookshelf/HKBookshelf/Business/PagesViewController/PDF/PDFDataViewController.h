//
//  PDFDataViewController.h
//  HKBookshelf
//
//  Created by hukaiyin on 2016/10/21.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "HKViewController.h"
#import "PDFScrollView.h"

@interface PDFDataViewController : HKViewController

@property (strong,nonatomic) PDFScrollView *scrollView;

@property CGPDFDocumentRef pdf;
@property CGPDFPageRef page;
@property NSInteger pageNumber;
@property CGFloat myScale;

@end

//
//  PDFDataViewController.m
//  HKBookshelf
//
//  Created by hukaiyin on 2016/10/21.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "PDFDataViewController.h"

@implementation PDFDataViewController

-(void) dealloc {
    if( self.page != NULL ) CGPDFPageRelease( self.page );
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.page = CGPDFDocumentGetPage(self.pdf, self.pageNumber);
    NSLog(@"self.page==NULL? %@",self.page==NULL?@"yes":@"no");
    
    if( self.page != NULL ) CGPDFPageRetain( self.page );
    [self.scrollView setPDFPage:self.page];
}

- (PDFScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[PDFScrollView alloc]initWithFrame:self.view.bounds];
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

-(void)viewWillAppear:(BOOL)animated {
    // Disable zooming if our pages are currently shown in landscape
    if( [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortrait || [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationPortraitUpsideDown ) {
        [self.scrollView setUserInteractionEnabled:YES];
    } else {
        [self.scrollView setUserInteractionEnabled:NO];
    }
    NSLog(@"%s scrollView.zoomScale=%f",__PRETTY_FUNCTION__,self.scrollView.zoomScale);
}

-(void)viewDidLayoutSubviews {
    NSLog(@"%s",__PRETTY_FUNCTION__);
    [self restoreScale];
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    NSLog(@"%s",__PRETTY_FUNCTION__);
    if( fromInterfaceOrientation == UIInterfaceOrientationPortrait || fromInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown ) {
        [self.scrollView setUserInteractionEnabled:NO];
    } else {
        [self.scrollView setUserInteractionEnabled:YES];
    }
}

-(void)restoreScale {
    // Called on orientation change.
    // We need to zoom out and bas ically reset the scrollview to look right in two-page spline view.
    CGRect pageRect = CGPDFPageGetBoxRect( self.page, kCGPDFMediaBox );
    CGFloat yScale = self.view.frame.size.height/pageRect.size.height;
    CGFloat xScale = self.view.frame.size.width/pageRect.size.width;
    self.myScale = MIN( xScale, yScale );
    NSLog(@"%s self.myScale=%f",__PRETTY_FUNCTION__, self.myScale);
    self.scrollView.frame = self.view.bounds;
    self.scrollView.zoomScale = 1.0;
    self.scrollView.PDFScale = self.myScale;
    self.scrollView.tiledPDFView.bounds = (CGRect){0,0,self.view.bounds.size.width,self.view.bounds.size.height - 64
    };
    self.scrollView.tiledPDFView.myScale = self.myScale;
    [self.scrollView.tiledPDFView.layer setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    NSLog(@"%s",__PRETTY_FUNCTION__);
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

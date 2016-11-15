//
//  TiledPDFView.m
//  HKBookshelf
//
//  Created by hukaiyin on 2016/10/21.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "TiledPDFView.h"

@implementation TiledPDFView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
    if (self.pdfPage != NULL) {
        CGPDFPageRelease(self.pdfPage);
    }
}

- (instancetype)initWithFrame:(CGRect)frame scale:(CGFloat)scale {
    self = [super initWithFrame:frame];
    if (self) {
        CATiledLayer *tiledLayer = (CATiledLayer *)self.layer;
        tiledLayer.levelsOfDetail = 4;
        tiledLayer.levelsOfDetailBias = 3;
        tiledLayer.tileSize = CGSizeMake(512.0, 512.0);
        self.myScale = scale;
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 10;
    }
    return self;
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextSetRGBFillColor(ctx, 1., 1., 1., 1.);
    CGContextFillRect(ctx, self.bounds);
    
    if (_pdfPage == NULL) {
        return;
    }
    CGContextSaveGState(ctx);
    CGContextTranslateCTM(ctx, 0.0, self.bounds.size.height);
    CGContextScaleCTM(ctx, 1.0, -1.0);
    CGContextScaleCTM(ctx, self.myScale, self.myScale);
    CGContextDrawPDFPage(ctx, self.pdfPage);
    CGContextRestoreGState(ctx);
    
}

+ (Class)layerClass {
    return [CATiledLayer class];
}

- (void)setPage:(CGPDFPageRef)newPage {
    if (self.pdfPage != NULL) {
        CGPDFPageRelease(self.pdfPage);
    }
    if (newPage != NULL) {
        self.pdfPage = CGPDFPageRetain(newPage);
    }
}

@end
